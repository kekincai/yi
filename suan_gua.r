# 求卦需要先准备五十根蓍草，取出一根不用，
# 只用四十九根，把这四十九根蓍草用双手任意地分成两堆，
# 再从其中一堆中取出一根夹在手指间，
# 然后四根一组地数，将每一堆最后的余数放在一起，
# 这一过程叫做一“变”。
# 其中分二（分 成两堆），挂一（取出一根夹在手指间），揲四（四个一组地数），归奇（将两堆的余数放在 一起）这四个步骤叫做“四营”。

# “一变”之后，除去挂一，归奇的数，将剩下的蓍草或四十根或四十四根，再按照前面 的过程重复，称为第二变。
# 剩下的蓍草只能是四十根，或三十六根，或三十二根三种情况。 
# 再重复一遍，即第三变，剩下的蓍草只能是三十六根，或三十二根，或二十八根，或二十四 根四种情况。
# 这时用四除去这个数，商一定是“九”、“八”、“七”、“六”四个数字中的一个，
# 倘若是“九”或者是“七”这两个奇数，就画出阳爻，是“八”或者“六”这两个偶数，就 画出阴爻。
# 这样经过三次变化，就得出了一爻。每卦有六爻，所以要得出一个卦象，就要经 过十八变，即“十有八变而成卦”的意思。

source("yao.r")
source("gua.r")
bian <- function(x) {
    # 变
    x <- x %% 4
    if (x==0)
        x <- 4
    x
}
suan_yao <- function() {
    # 算爻
    len <- 48 # 使用的蓍草数量
    times_bian <- 3 # 变的次数
    while (times_bian>0) {
        left <- sample(seq(len=len), 1)
        right <- len - left
        s <- bian(left) + bian(right)
        len <- len - s
        times_bian <- times_bian - 1
    }
    ret <- len %/% 4
    stopifnot(ret %in% 6:9)
    if (ret %% 2 == 1)
        1
    else
        0
}

if (FALSE) {
    source("suan_gua.r")
    suan_yao()

}

GUA <- list(乾=c(1, 1, 1),
            坤=c(0, 0, 0),
            坎=c(0, 1, 0),
            离=c(1, 0, 1),
            巽=c(1, 1, 0),
            震=c(0, 0, 1),
            艮=c(1, 0, 0),
            兑=c(0, 1, 1))

suan_gua <- function(times=6, fn="rdata/六十四卦.rdata") {
    # 算卦
    ret <- rep(NA_integer_, times)
    while (times>0) {
        ret[times] <- suan_yao()
        times <- times - 1
    }
    d <- get_load(fn)
    list2env(d, envir=.GlobalEnv)
    gua <- sapply(GUA, paste, collapse="_")
    gua <- gua[nm]
    col <- which(paste(head(ret, 3), collapse="_") == gua)
    row <- which(paste(tail(ret, 3), collapse="_") == gua)
    gua64_use[row, col]
}

if (FALSE) {
    source("suan_gua.r")
    ret <- suan_gua()
    fu_gua(ret)
}

GUA <- list(乾=matrix(c(1, 1, 1,
                        1, 1, 1,
                        1, 1, 1), nrow=3, byrow=TRUE),
            坤=matrix(c(1, 0, 1,
                        1, 0, 1,
                        1, 0, 1), nrow=3, byrow=TRUE),
            坎=matrix(c(1, 0, 1,
                        1, 1, 1,
                        1, 0, 1), nrow=3, byrow=TRUE),
            离=matrix(c(1, 1, 1,
                        1, 0, 1,
                        1, 1, 1), nrow=3, byrow=TRUE),
            巽=matrix(c(1, 1, 1,
                        1, 1, 1,
                        1, 0, 1), nrow=3, byrow=TRUE),
            震=matrix(c(1, 0, 1,
                        1, 0, 1,
                        1, 1, 1), nrow=3, byrow=TRUE),
            艮=matrix(c(1, 1, 1,
                        1, 0, 1,
                        1, 0, 1), nrow=3, byrow=TRUE),
            兑=matrix(c(1, 0, 1,
                        1, 1, 1,
                        1, 1, 1), nrow=3, byrow=TRUE))
jing_gua <- function(item="巽", o=1) {
    # 画经卦
    item <- GUA[[item]]
    item <- item[rev(seq(len=nrow(item))), ]
    for (i in seq(len=nrow(item))) {
        x <- item[i, ]
        yao(x, i+(o-1)*3)
    }

}

if (FALSE) {
    source("gua.r")
    plot(0, 0 , xlim=c(0, 5), ylim=c(0, 24),
         axes=FALSE, type = "n", xlab = "", ylab = "",
     main = "")
    jing_gua()
}

fu_gua <- function(x="明夷", fn="data/六十四卦.csv") {
    # 画复卦
    gua64 <- read.csv(file=fn, check.names=FALSE, row.names=1)
    gua64_use <- sapply(gua64, function(x) gsub("\\d+\\. ", "", x))
    gua64_use <- as.data.frame(gua64_use)
    nm <- colnames(gua64_use)
    alias_nm <- gsub(".（(.)）", "\\1", nm)
    nm <- gsub("（.）", "", nm)
    pat <- paste(c(alias_nm, "为"), collapse = "|")
    gua64_use <- sapply(gua64_use, function(x) gsub(pat, "", x))
    idx <- which(gua64_use==x, arr.ind = TRUE)
    idx <- nm[idx]
    par(pty="s")
    par(family = "STKaiti")
    plot(0, 0 , xlim=c(0, 5), ylim=c(0, 24),
         axes=FALSE, type = "n", xlab = "", ylab = "",
         main = x, cex.main=4)
    for (i in seq(idx)) {
        item <- idx[i]
        jing_gua(item, i)
    }
}
if (FALSE) {
    source("gua.r")
    fu_gua()
    fu_gua("归妹")
}
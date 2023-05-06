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
jing_gua <- function(item="巽") {
    # 画经卦
    item <- GUA[[item]]
    item <- item[rev(seq(len=nrow(item))), ]
    for (i in seq(len=nrow(item))) {
        x <- item[i, ]
        yao(x, i)
    }

}

if (FALSE) {
    source("gua.r")
    plot(0, 0 , xlim=c(0, 5), ylim=c(0, 24), type = "n", xlab = "", ylab = "",
     main = "")
    jing_gua()
}

fu_gua <- function(x) {
    # 画复卦
    par("pty") <- "s"
}
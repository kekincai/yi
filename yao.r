yao <- function(x=c(1, 0, 1), i=1) {
    # 画爻

    ybottom <- 2 + (i-1)*3
    ytop <- ybottom + 2
    for (j in seq(x)) {
        xx <- x[j]
        if (xx == 0)
            next
        xleft <- j
        xright <- j + 1
        rect(xleft, ybottom, xright, ytop, col="black")
    }
}

if (FALSE) {
    source("yao.r")
    plot(0, 0 , xlim=c(0, 5), ylim=c(0, 24), type = "n", xlab = "", ylab = "",
     main = "")
    yao()
    yao(x=c(1, 1, 1), i=2)
    yao(x=c(1, 0, 1), i=3)
}
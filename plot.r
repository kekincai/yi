save_tb <- function(d=tb, fn="out/卦序.png", cex=3, res=300, w=8, h=6, pointsize=15) {
    message("Writing: ", fn)
    
    png(fn, w*res, h*res, pointsize=pointsize)
    par(family = "STKaiti")
    hist(ret_idx, main="", xlab="卦序", col="steelblue", cex=cex, cex.axis=cex, cex.lab=cex, cex.main=cex+2)
    dev.off()
}

if (FALSE) {
    source("plot.r")
    save_tb()

}
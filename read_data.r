source("utils.r")
read_data <- function(fn = "data/六十四卦.csv") {
    # 保存六十四卦数据为rdata

    message("Reading: ", fn)
    gua64 <- read.csv(file = fn, check.names = FALSE, row.names = 1)
    gua64_use <- sapply(gua64, function(x) gsub("\\d+\\. ", "", x))
    gua64_use <- as.data.frame(gua64_use)
    nm <- colnames(gua64_use)
    alias_nm <- gsub(".（(.)）", "\\1", nm)
    nm <- gsub("（.）", "", nm)
    pat <- paste(c(alias_nm, "为"), collapse = "|")
    gua64_use <- sapply(gua64_use, function(x) gsub(pat, "", x))

    gua_idx <- sapply(gua64, function(x) gsub("(\\d+).+", "\\1", x))
    ret <- list(
        gua64 = gua64,
        gua64_use = gua64_use,
        nm = nm,
        gua_idx = gua_idx
    )
    out_fn <- "rdata/六十四卦.rdata"
    message("Saving: ", out_fn)
    save(ret, file = out_fn)
}

if (FALSE) {
    source("read_data.r")
    read_data()
}

get_load <- function(fn) {
    # 读取rdata
    get(load(fn))
}
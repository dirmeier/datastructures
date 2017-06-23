

#' @import Rcpp
.onLoad <- function(libname, pkgname)
{
    Rcpp::loadModule("hashmap_module", TRUE)

}

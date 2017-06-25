# datastructures: Implementation of core datastructures for R.
#
# Copyright (C) Simon Dirmeier
#
# This file is part of datastructures.
#
# datastructures is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# datastructures is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with datastructures. If not, see <http://www.gnu.org/licenses/>.


#' @title Add elements to an object
#'
#' @export
#' @docType methods
#' @rdname insert-methods
#'
setGeneric(
    "insert",
    function(obj, x, y)
    {
        standardGeneric("insert")
    },
    package = "datastructures"
)

#' @title Add key-value pairs to a hashmap object
#'
#' @rdname insert-methods
#'
#' @param obj  the object you want to insert elements to
#' @param x  a scalar/vector of keys
#' @param y  a scalar/vector of values
#'
#' @examples
#'  # insert to a hashmap with <character, double> pairs
#'  hashmap <- new("hashmap", "character", "integer")
#'  hashmap <- insert(hashmap, "test", 1)
#'  hashmap <- insert(hashmap, paste0("k", 1:10), 1:10)
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "ANY", y = "ANY"),
    function(obj, x, y)
    {
        kc <- obj@.data$key.class
        vc <- obj@.data$value.class
        if (any(is.null(c(x, y)))) stop("x/y cannot be NULL")
        if (any(is.na(x))) stop("x cannot be NA")
        if (class(x) != kc) stop(paste("class(x) is not", kc))
        if (class(y) != vc) stop(paste("class(y) is not", vc))
        obj@.data$map$insert(x, y)
        return(obj)
    }
)

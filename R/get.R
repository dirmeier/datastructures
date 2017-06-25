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


#' @title Get elements from an object
#'
#' @export
#' @docType methods
#' @rdname get-methods
#'
setGeneric(
    "get",
    function(obj, x)
    {
        standardGeneric("get")
    },
    package = "datastructures"
)

#' @title Get values from a hashmap object
#'
#' @rdname get-methods
#'
#' @param obj  the object you want to insert elements to
#' @param x  a scalar/vector of keys
#'
#' @examples
#'  # insert to a hashmap with <character, double> pairs
#'  hashmap <- new("hashmap", "character", "character")
#'  hashmap <- insert(hashmap, paste0("k", 1:10), paste0("v", 1:10))
#'  get(hashmap, paste0("k", c(3,5,7)))
setMethod(
    "get",
    signature = signature(obj = "hashmap", x = "ANY"),
    function(obj, x)
    {
        kc <- obj@.data$key.class
        if (any(is.null(x))) stop("x/y cannot be NULL")
        if (any(is.na(x))) stop("x cannot be NA")
        if (class(x) != kc) stop(paste("class(x) is not", kc))
        obj@.data$map$get(x)
    }
)

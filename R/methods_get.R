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
#' @description Extracts a set of <key, value> pairs from an object using a
#'  set of keys.
#'
#' @export
#' @docType methods
#' @rdname get-methods
#'
#' @param obj  object to extract values from
#' @param x  the set of keys to match the values
#'
#' @return  returns extracted values from the object
setGeneric(
    "get",
    function(obj, x)
    {
        standardGeneric("get")
    },
    package = "datastructures"
)


#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "hashmap", x = "ANY"),
    function(obj, x)
    {
        kc <- obj@.data$key.class
        if (any(is.null(x))) stop("x/y cannot be NULL")
        if (any(is.na(x)))   stop("x cannot be NA")
        if (class(x) != kc) stop(paste("class(x) is not", kc))
        obj@.data$map$get(x)
    }
)


#' @title Extract elements from an object
#'
#' @description Access <key, value> pairs of a hashmap using a set of keys.
#'
#' @param x  a \code{hashmap}
#' @param i  a vector of keys
setMethod(
    "[",
    signature = signature(x="hashmap", i="ANY", j="missing", drop="missing"),
    function(x, i)
    {
        get(x, i)
    }
)


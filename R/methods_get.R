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
#' @description Extracts a set of <key, value> pairs. For \code{hashmaps}
#'  mappings from
#'  \deqn{f: keys -> values,}
#'  exist so argument \code{which} is per default \code{values} (since these
#'  are going to be retrieved). For \code{bimaps} also
#'  \deqn{f: values -> keys,}
#'  mappings exist, such that \code{which} can also be \code{keys} if the keys
#'  from the object should be retrieved.
#'
#' @export
#' @docType methods
#' @rdname get-methods
#'
#' @param obj  object to extract values from
#' @param x  the set of keys to match the values
#' @param which  choose either \code{values} if the values should get returned
#'  or \code{keys} if the keys should get returned
#'
#' @return  returns extracted keys or values from \code{obj}
#'
setGeneric(
    "get",
    function(obj, x, which=c("values", "keys"))
    {
        standardGeneric("get")
    },
    package = "datastructures"
)

#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "hashmap", x = "ANY", which="missing"),
    function(obj, x)
    {
        .check.key.class(obj, x)
        obj@.map$get(x)
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

#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "bimap", x = "ANY", which = "character"),
    function(obj, x, which=c("values", "keys"))
    {
        which <- match.arg(which)
        kc <- ifelse(which == "values", obj@.key.class, obj@.value.class)
        .check.key.class(obj, x, kc=kc)

        if (which == "keys")
            obj@.map$get_left(x)
        else
            obj@.map$get_right(x)
    }
)

#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "bimap", x = "ANY", which = "missing"),
    function(obj, x)
    {
        .check.key.class(obj, x)
        obj@.map$get_right(x)
    }
)

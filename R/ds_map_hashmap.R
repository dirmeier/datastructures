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


#' @include ds_map.R
#' @include methods_insert.R
#' @include methods_get.R
#' @include methods_head.R
#' @include methods_keys.R
#' @include methods_values.R
#' @include methods_size.R
NULL


#' @title Hashmap class
#'
#' @export
#' @name hashmap-class
#' @rdname hashmap-class
#'
#' @description Implementation of a hashmap data structure, i.e. an unordered
#' collection of key-value pairs:
#' \deqn{f: keys -> values,}
#' Inserting and accessing is amortized in \emph{O(1)}.
#' \code{hashmap} wraps a C++ \code{unordered_map} using Rcpp modules.
#' See \code{\linkS4class{bimap}} for mappings in both ways.
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("hashmap", contains = "map")

#' @title Create a new \code{hashmap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{hashmap}} object,
#'  i.e. an unordered collection of key-value pairs with mapping
#'  \deqn{f: keys -> values.}
#'
#' @param key.class  the primitive class type of the keys
#' @param value.class  the primitive class type of the values
#'
#' @return returns a new \code{hashmap} object
#'
hashmap <- function(
    key.class = c("character", "numeric", "integer"),
    value.class = c("character", "numeric", "integer"))
{
    key.class   <- match.arg(key.class)
    value.class <- match.arg(value.class)

    if (key.class == "character")
    {
        if (value.class == "character")    map <- methods::new(hashmap_ss)
        else if (value.class == "integer") map <- methods::new(hashmap_si)
        else                               map <- methods::new(hashmap_sd)
    }
    else if (key.class == "numeric")
    {
        if (value.class == "character")    map <- methods::new(hashmap_ds)
        else if (value.class == "integer") map <- methods::new(hashmap_di)
        else                               map <- methods::new(hashmap_dd)
    }
    else
    {
        if (value.class == "character")    map <- methods::new(hashmap_is)
        else if (value.class == "integer") map <- methods::new(hashmap_ii)
        else                               map <- methods::new(hashmap_id)
    }

    methods::new("hashmap",
                 .key.class=key.class,
                 .value.class=value.class,
                 .map=map)
}


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "vector", y = "vector"),
    function(obj, x, y) .insert.hashmap(obj, x, y)
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "vector", y = "list"),
    function(obj, x, y) .insert.hashmap(obj, x, y)
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "vector", y = "matrix"),
    function(obj, x, y) .insert.hashmap(obj, x, y)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a hashmap.
#'
#' @param x  a \code{map} object
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="hashmap", i="vector", j="missing", value="vector"),
    function(x, i, value) .insert.hashmap(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a hashmap.
#'
#' @param x  a \code{map} object
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="hashmap", i="vector", j="missing", value="list"),
    function(x, i, value) .insert.hashmap(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a hashmap.
#'
#' @param x  a \code{map} object
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="hashmap", i="vector", j="missing", value="matrix"),
    function(x, i, value) .insert.hashmap(x, i, value)
)


#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "hashmap", x = "vector", which="missing"),
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
    signature = signature(x="hashmap", i="vector", j="missing", drop="missing"),
    function(x, i) get(x, i)
)


#' @rdname head-methods
setMethod("head", "hashmap", .head.map)


#' @rdname keys-methods
setMethod(
    "keys",
    "hashmap",
    function(obj) obj@.map$keys()
)


setMethod("show", "hashmap", .show.map)


#' @rdname size-methods
setMethod("size", "hashmap", .size.map)


#' @rdname values-methods
setMethod(
    "values",
    "hashmap",
    function(obj) obj@.map$values()
)

#' @noRd
.insert.hashmap <- function(obj, x, y)
{
    if (is.matrix(y))
        y <- lapply(seq(nrow(y)), function(i) y[i, ] )
    else if (length(x) == 1 && is.vector(y))
        y <- list(y)
    else if (length(x) == length(y) && is.vector(y))
        y <- as.list(y)

    .check.key.value.classes(obj, x, y)
    obj@.map$insert(x, y)

    obj
}

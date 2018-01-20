# datastructures: Implementation of core datastructures for R.  Copyright (C)
# Simon Dirmeier This file is part of datastructures.  datastructures is free
# software: you can redistribute it and/or modify it under the terms of the GNU
# General Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
# datastructures is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with
# datastructures. If not, see <http://www.gnu.org/licenses/>.


#' @include ds_map.R
#' @include methods_insert.R
#' @include methods_get.R
#' @include methods_head.R
#' @include methods_keys.R
#' @include methods_values.R
#' @include methods_size.R
NULL


#' @title Bimap class
#'
#' @export
#' @name bimap-class
#' @rdname bimap-class
#'
#' @description Implementation of a bimap data structure, i.e. an unordered
#' collection of key-value pairs. The notable difference to
#' \code{\linkS4class{hashmap}} is that the mapping is not only
#' \deqn{f: keys -> values,}
#' but also
#' \deqn{f: values -> keys.}
#' Inserting and accessing is amortized in \emph{O(1)}.
#' \code{bimap} wraps a \code{boost::bimap} using Rcpp modules.
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("bimap", contains = "map")


#' @title Create a new \code{bimap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{bimap}} object,
#'  i.e. an unordered collection of key-value pairs with mappings
#'  \deqn{f: keys -> values,}
#'  and
#'  \deqn{f: values -> keys.}
#'
#' @param key.class  the primitive class type of the keys
#' @param value.class  the primitive class type of the values
#'
#' @return returns a new \code{bimap} object
#'
bimap <- function(key.class = c("character", "numeric", "integer"),
                  value.class = c("character", "numeric", "integer"))
{
    key.class   <- match.arg(key.class)
    value.class <- match.arg(value.class)

    if (key.class == "character") {
        if (value.class == "character")
            map <- methods::new(bimap_ss)
        else if (value.class == "integer")
            map <- methods::new(bimap_si)
        else
         map <- methods::new(bimap_sd)
    }
    else if (key.class == "numeric")
    {
        if (value.class == "character")
            map <- methods::new(bimap_ds)
        else if (value.class == "integer")
            map <- methods::new(bimap_di)
        else
            map <- methods::new(bimap_dd)
    }
    else
    {
        if (value.class == "character")
            map <- methods::new(bimap_is)
        else if (value.class == "integer")
            map <- methods::new(bimap_ii)
        else
        map <- methods::new(bimap_id)
    }

    methods::new("bimap",
                 .key.class = key.class,
                 .value.class = value.class,
                 .map = map)
}


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a bimap.
#'
#' @param x  a \code{map} object
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x = "bimap", i = "vector", j = "missing", value = "vector"),
    function(x, i, value) .insert.bimap(x, i, value)
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "bimap", x = "vector", y = "vector"),
    function(obj, x, y) .bimap.map(obj, x, y)
)


#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "bimap", x = "ANY", which = "character"),
    function(obj, x, which = c("values", "keys"))
    {
        which <- match.arg(which)
        kc <- ifelse(which == "values", obj@.key.class, obj@.value.class)
        .check.key.class(obj, x, kc = kc)

        if (which == "keys")
            obj@.map$get_left(x) else obj@.map$get_right(x)
    }
)


#' @rdname get-methods
setMethod(
    "get",
    signature = signature(obj = "bimap", x = "ANY", which = "missing"),
    function(obj, x) {
        .check.key.class(obj, x)
        obj@.map$get_right(x)
    }
)


#' @rdname head-methods
setMethod("head", "bimap", .head.map)


#' @rdname keys-methods
setMethod("keys", "bimap", function(obj)
{
    obj@.map$lefts()
})


setMethod("show", "bimap", .show.map)


#' @rdname size-methods
setMethod("size", "bimap", .size.map)


#' @rdname values-methods
setMethod("values", "bimap", function(obj)
{
    obj@.map$rights()
})

#' @noRd
.insert.bimap <- function(obj, x, y)
{
    .check.key.value.classes(obj, x, y)
    obj@.map$insert(x, y)

    obj
}

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

#' @include methods_head.R
#' @include methods_insert.R
#' @include methods_get.R
#' @include methods_size.R

#' @title Hashmap class
#'
#' @exportClass hashmap
#' @name hashmap-class
#' @rdname hashmap-class
#'
#' @description Implementation of a hashmap datastructure, i.e. an unordered collection
#'  of key-value pairs. Inserting and accessing is amortized in \emph{O(1)}.
#'  \code{hashmap} wraps a C++ \code{unordered_map} using Rcpp modules.
#'
#' @slot .data  object that bundles all important map related objects
#' @examples
#' \dontrun{
#'  # a hashmap with <character, double> pairs
#'  hashmap <- new("hashmap", "character", "numeric")
#'
#'  # a hashmap with <character, integer> pairs
#'  hashmap <- new("hashmap", "character", "integer")
#'
#'  # a hashmap with <numeric, numeric> pairs
#'  hashmap <- new("hashmap", "numeric", "numeric")
#'  }
setClass(
    "hashmap",
     slots = list(.data = "list"),
     prototype = prototype(.data = NULL)
)

#' @importFrom methods new
setMethod(
    "initialize",
    "hashmap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        .Object@.data <- list(key.class   = match.arg(key.class),
                              value.class = match.arg(value.class))

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
        .Object@.data$map <- map
        .Object
    }
)

#' @title Add key-value pairs to a hashmap object
#'
#' @rdname insert-methods
#'
#' @examples
#'  hashmap <- new("hashmap", "character", "integer")
#'
#'  hashmap <- insert(hashmap, "test", 1L)
#'
#'  hashmap[paste0("k", 1:10)] <- 1:10
#'
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "ANY", y = "ANY"),
    function(obj, x, y)
    {
        .check.key.value.classes(obj, x, y)
        obj@.data$map$insert(x, y)
        return(obj)
    }
)

#' @title Get values from a hashmap object
#'
#' @rdname get-methods
#'
#' @examples
#' \dontrun{
#'  # insert to a hashmap with <character, character> pairs
#'  hashmap <- new("hashmap", "character", "character")
#'  hashmap <- insert(hashmap, paste0("k", 1:10), paste0("v", 1:10))
#'
#'  get(hashmap, paste0("k", c(3,5,7)))
#'
#'  hashmap[paste0("k", c(3,5,7))]
#' }
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

#' Extract parts to an object
#'
#' @description Access <key, value> pairs of a hashmap.
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

#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a hashmap.
#'
#' @param x  a \code{hashmap}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="hashmap", i="ANY", j="missing", value="ANY"),
    function(x, i, value)
    {
        insert(x, i, value)
    }
)

#' @rdname head-methods
setMethod(
    "head",
    "hashmap",
    function(obj)
    {
        if (obj@.data$map$size())
            unlist(obj@.data$map$head())
        else
            NULL

    }
)

setMethod(
    "show",
    "hashmap",
    function(object)
    {
        cat(paste0("An object of class hashmap<",
                   object@.data$key.class, ",",
                   object@.data$value.class, ">\n\n"))
        li <- head(object)
        for (l in names(li))
        {
            e <- li[[l]]
            cat(paste0(l, " -> ",ifelse(is.null(e), "NULL", e), "\n"))
        }
    }
)

#' @rdname size-methods
setMethod(
    "size",
    "hashmap",
    function(obj)
    {
        obj@.data$map$size()
    }
)

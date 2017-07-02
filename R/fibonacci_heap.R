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


#' @include insert.R


#' @title Fibonacci heap class
#'
#' @exportClass fibonacci_heap
#' @name fibonacci_heap-class
#' @rdname fibonacci_heap-class
#'
#' @description Implementation of a Fibonacci heap datastructure, i.e. a
#'  priority datastructure with \code{push} in amortized \emph{O(1)} and \code{pop}
#'  in \emph{O(log n)}. \code{fibonacci_heap} wraps a Boost \code{fibonacci_heap}
#'  using Rcpp modules. The heap consists of nodes with keys and values where the key
#'  determines the priority in the heap.
#'
#' @slot .list  object that bundles all important heap related objects
#' @examples
#'  # a fibonacci_heap with <character, double> key-value nodes
#'  fibonacci_heap <- new("fibonacci_heap", "character", "numeric")
#'
#'  # a fibonacci_heap with <character, integer> key-value nodes
#'  fibonacci_heap <- new("fibonacci_heap", "character", "integer")
#'
#'  # a fibonacci_heap with <double, double> key-value nodes
#'  fibonacci_heap <- new("fibonacci_heap", "numeric", "numeric")
#'
#'  # a fibonacci_heap with <integer, double> key-value nodes
#'  fibonacci_heap <- new("fibonacci_heap", "integer", "numeric")
#'
#'  # a fibonacci_heap with <integer, character> key-value nodes
#'  fibonacci_heap <- new("fibonacci_heap", "integer", "character")
setClass(
    "hashmap",
    slots = list(.data = "list"),
    prototype = prototype(.data = NULL)
)

#' @noRd
setMethod(
    "initialize",
    "fibonacci_heap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        .Object@.data <- list(key.class   = match.arg(key.class),
                              value.class = match.arg(value.class))

        if (key.class == "character")
        {
            if (value.class == "character")    heap <- new(fibonacci_heap_ss)
            else if (value.class == "integer") heap <- new(fibonacci_heap_si)
            else                               heap <- new(fibonacci_heap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")    heap <- new(fibonacci_heap_ds)
            else if (value.class == "integer") heap <- new(fibonacci_heap_di)
            else                               heap <- new(fibonacci_heap_dd)
        }
        else
        {
            if (value.class == "character")    heap <- new(fibonacci_heap_is)
            else if (value.class == "integer") heap <- new(fibonacci_heap_ii)
            else                               heap <- new(fibonacci_heap_id)
        }
        .Object@.data$heap <- heap
        .Object
    }
)

#' @title Add a node to a Fibonacci heap object
#'
#' @rdname insert-methods
#'
#' @param obj  the object you want to insert elements to
#' @param x  a scalar/vector of keys
#' @param y  a scalar/vector of values
#'
#' @examples
#'  # insert to a fibonacci_heap with <character, double> nodes
#'  hashmap <- new("fibonacci_heap", "numeric", "double")
#'
#'  hashmap <- insert(fibonacci_heap, 1.0, "test")
#'
#'  hashmap[rnorm(5)] <- 1:5
#'
setMethod(
    "insert",
    signature = signature(obj = "fibonacci_heap", x = "ANY", y = "ANY"),
    function(obj, x, y)
    {
        kc <- obj@.data$key.class
        vc <- obj@.data$value.class
        if (any(is.null(c(x, y)))) stop("x/y cannot be NULL")
        if (any(is.na(x))) stop("x cannot be NA")
        if (class(x) != kc) stop(paste("class(x) is not", kc))
        if (class(y) != vc) stop(paste("class(y) is not", vc))
        obj@.data$heap$insert(x, y)
        return(obj)
    }
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
#'
#'  get(hashmap, paste0("k", c(3,5,7)))
#'
#'  hashmap[paste0("k", c(3,5,7))]
#'
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

#' @noRd
setMethod(
    "[",
    signature = signature(x="hashmap", i="ANY", j="missing", drop="missing"),
    function(x, i, j="missing", ..., drop="missing")
    {
        get(x, i)
    }
)

#' @noRd
setMethod(
    "[<-",
    signature = signature(x="hashmap", i="ANY", j="missing", value="ANY"),
    function(x, i, j="missing", ..., value)
    {
        insert(x, i, value)
    }
)

#' @export
#' @method head hashmap
head.hashmap <- function(x, ...)
{
    unlist(x@.data$map$head())
}

#' @noRd
setMethod(
    "show",
    "hashmap",
    function(object)
    {
        cat(paste0("An object of class hashmap<",
                   object@.data$key.class, ",",
                   object@.data$value.class, ">\n\n"))
        li <- head(hashmap)
        for (l in names(li))
        {
            cat(paste0(l, " -> ", li[[l]], "\n"))
        }
    }
)

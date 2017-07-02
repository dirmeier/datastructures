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
#' @importFrom methods new
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
            if (value.class == "character")    heap <- methods::new(fibonacci_heap_ss)
            else if (value.class == "integer") heap <- methods::new(fibonacci_heap_si)
            else                               heap <- methods::new(fibonacci_heap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")    heap <- methods::new(fibonacci_heap_ds)
            else if (value.class == "integer") heap <- methods::new(fibonacci_heap_di)
            else                               heap <- methods::new(fibonacci_heap_dd)
        }
        else
        {
            if (value.class == "character")    heap <- methods::new(fibonacci_heap_is)
            else if (value.class == "integer") heap <- methods::new(fibonacci_heap_ii)
            else                               heap <- methods::new(fibonacci_heap_id)
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
        .check.key.value.classes(obj, x, y)
        obj@.data$heap$insert(x, y)
        return(obj)
    }
)

#' @title Pop (remove) the lowest priority node value from the heap
#'
#' @rdname pop-methods
#'
#' @param obj  the object to pop
#'
#' @examples
#'  fibonacci_heap <- new("fibonacci_heap", "character", "character")
#'  fibonacci_heap <- insert(hashmap, paste0("k", 1:10), paste0("v", 1:10))
#'
#'  pop(hashmap)
setMethod(
    "pop",
    signature = signature(obj = "fibonacci_heap"),
    function(obj)
    {
        obj@.data$map$pop()
    }
)

#' @title Peek onto the lowest priority node value from the heap
#'
#' @rdname peek-methods
#'
#' @param obj  the object to peek into
#'
#' @examples
#'  fibonacci_heap <- new("fibonacci_heap", "character", "character")
#'  fibonacci_heap <- insert(hashmap, paste0("k", 1:10), paste0("v", 1:10))
#'
#'  peek(hashmap)
setMethod(
    "peek",
    signature = signature(obj = "fibonacci_heap"),
    function(obj)
    {
        obj@.data$map$peek()
    }
)

#' @noRd
setMethod(
    "[<-",
    signature = signature(x="fibonacci_heap", i="ANY", j="missing", value="ANY"),
    function(x, i, j="missing", ..., value)
    {
        insert(x, i, value)
    }
)

#' @noRd
setMethod(
    "show",
    "fibonacci_heap",
    function(object)
    {
        cat(paste0("An object of class fibonacci_heap<",
                   object@.data$key.class, ",",
                   object@.data$value.class, ">\n\n"))
        li <- peek(object)
        cat(paste0("todo"))
    }
)

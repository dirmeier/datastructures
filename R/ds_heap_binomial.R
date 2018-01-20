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


#' @include ds_heap.R
#' @include methods_insert.R
#' @include methods_peek.R
#' @include methods_pop.R
#' @include methods_size.R
NULL


#' @title Binomial heap class
#'
#' @export
#' @name binomial_heap-class
#' @rdname binomial_heap-class
#'
#' @description Implementation of a binomial heap data structure, i.e. a
#'  priority datastructure with \code{push} and \code{pop} in amortized
#'  \emph{O(log n)}. \code{binomial_heap} wraps a \code{boost::binomial_heap}
#'  using Rcpp modules. The heap consists of nodes with
#'  keys and values where the key determines the priority in the heap.
#'  Also see the \code{\linkS4class{binomial_heap}} class.
#'
#' @slot .heap  \code{C++} object representing a heap
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("binomial_heap", contains = "heap")


#' @title Create a new \code{binomial_heap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{binomial_heap}} object,
#'  i.e. a tree-like data structure satisfying the \emph{min-heap} property.
#'
#' @param key.class  the primitive class type of the keys
#' @param value.class  the primitive class type of the values
#'
#' @return returns a new \code{binomial_heap} object
#'
binomial_heap <- function(
    key.class = c("character", "numeric", "integer"),
    value.class = c("character", "numeric", "integer"))
{
    key.class   <- match.arg(key.class)
    value.class <- match.arg(value.class)

    if (key.class == "character")
    {
        if (value.class == "character")
            heap <- methods::new(binomial_heap_ss)
        else if (value.class == "integer")
            heap <- methods::new(binomial_heap_si)
        else
          heap <- methods::new(binomial_heap_sd)
    }
    else if (key.class == "numeric")
    {
        if (value.class == "character")
            heap <- methods::new(binomial_heap_ds)
        else if (value.class == "integer")
            heap <- methods::new(binomial_heap_di)
        else heap <- methods::new(binomial_heap_dd)
    }
    else
    {
        if (value.class == "character")
            heap <- methods::new(binomial_heap_is)
        else if (value.class == "integer")
            heap <- methods::new(binomial_heap_ii)
        else
            heap <- methods::new(binomial_heap_id)
    }

    methods::new("binomial_heap",
                .key.class = key.class,
                .value.class = value.class,
                .heap = heap)
}


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "binomial_heap", x = "vector", y = "vector"),
    function(obj, x, y) .insert.heap(obj, x, as.list(y))
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "binomial_heap", x = "vector", y = "list"),
    function(obj, x, y) .insert.heap(obj, x, as.list(y))
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "hashmap", x = "vector", y = "matrix"),
    function(obj, x, y) insert.heap(obj, x,
                                    lapply(seq(nrow(y)), function(i) y[i, ] ))
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a Fibonacci heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a \code{heap}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="binomial_heap", i="vector", j="missing", value="vector"),
    function(x, i, value) .insert.heap(x, i, as.list(value))
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a Fibonacci heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a \code{heap}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="binomial_heap", i="vector", j="missing", value="list"),
    function(x, i, value) .insert.heap(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a Fibonacci heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a \code{heap}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
    "[<-",
    signature = signature(x="binomial_heap", i="vector", j="missing", value="matrix"),
    function(x, i, value) .insert.heap(x, i,
                                      lapply(seq(nrow(value)), function(i) value[i, ] )))
)


#' @rdname peek-methods
setMethod("peek", "binomial_heap", .peek.heap)


#' @rdname pop-methods
setMethod("pop", "binomial_heap", .pop.heap)


setMethod("show", "binomial_heap", .show.heap)


#' @rdname size-methods
setMethod("size", "binomial_heap", .size.heap)

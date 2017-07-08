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


#' @title Fibonacci heap class
#'
#' @export
#' @name fibonacci_heap-class
#' @rdname fibonacci_heap-class
#'
#' @description Implementation of a Fibonacci heap datastructure, i.e. a
#'  priority datastructure with \code{push} in amortized \emph{O(1)} and
#'  \code{pop} in \emph{O(log n)}. \code{fibonacci_heap} wraps a Boost
#'  \code{fibonacci_heap} using Rcpp modules. The heap consists of nodes with
#'  keys and values where the key determines the priority in the heap.
#'
#' @slot .data  object that bundles all important heap related objects
#'
 setClass(
    "fibonacci_heap",
    slots = list(.data = "list"),
    prototype = prototype(.data = NULL)
)

#' @importFrom methods new
setMethod(
    "initialize",
    "fibonacci_heap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        key.class   <- match.arg(key.class)
        value.class <- match.arg(value.class)
        .Object@.data <- list(key.class   = key.class,
                              value.class = value.class)

        if (key.class == "character")
        {
            if (value.class == "character")
                heap <- methods::new(fibonacci_heap_ss)
            else if (value.class == "integer")
                heap <- methods::new(fibonacci_heap_si)
            else
                heap <- methods::new(fibonacci_heap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")
                heap <- methods::new(fibonacci_heap_ds)
            else if (value.class == "integer")
                heap <- methods::new(fibonacci_heap_di)
            else
                heap <- methods::new(fibonacci_heap_dd)
        }
        else
        {
            if (value.class == "character")
                heap <- methods::new(fibonacci_heap_is)
            else if (value.class == "integer")
                heap <- methods::new(fibonacci_heap_ii)
            else
                heap <- methods::new(fibonacci_heap_id)
        }

        .Object@.data$heap <- heap
        .Object
    }
)




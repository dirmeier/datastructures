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


#' @include ds_deque.R
#' @include methods_peek.R
#' @include methods_pop.R
#' @include methods_size.R
#' @include methods_insert.R
NULL


#' @title Queue class
#'
#' @export
#' @name queue-class
#' @rdname queue-class
#'
#' @description Implementation of a queue data structure, i.e. a list
#'  implementation with FIFO principle. \code{queue} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}. See \code{\linkS4class{stack}} for a class using
#'  the LIFO principle.
#'
#' @slot .deque  \code{C++} object representing a deque
#' @slot .key.class  the class of the keys
#'
setClass("queue", contains = "deque")


#' @title Create a new \code{queue}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{queue}} object,
#'  i.e. a list implementation with FIFO principle.
#'
#' @param key.class  the primitive class type of the keys
#'
#' @return returns a new \code{queue} object
#'
queue <- function(key.class = c("character", "numeric", "integer")) {
    key.class <- match.arg(key.class)
    if (key.class == "character") {
        queue <- methods::new(queue_s)
    } else if (key.class == "numeric") {
        queue <- methods::new(queue_d)
    } else {
        queue <- methods::new(queue_i)
    }
    
    methods::new("queue", .key.class = key.class, .deque = queue)
}


#' @rdname peek-methods
setMethod("peek", "queue", .peek.deque)


#' @rdname pop-methods
setMethod("pop", "queue", .pop.deque)


setMethod("show", "queue", .show.deque)


#' @rdname size-methods
setMethod("size", "queue", .size.deque)


#' @rdname insert-methods
setMethod("insert", signature = signature(obj = "queue", x = "vector", y = "missing"), 
    function(obj, x) .insert.deque(obj, list(x)))

#' @rdname insert-methods
setMethod("insert", signature = signature(obj = "queue", x = "list", y = "missing"), 
    function(obj, x) .insert.deque(obj, x))

#' @rdname insert-methods
setMethod("insert", signature = signature(obj = "queue", x = "matrix", y = "missing"), 
    function(obj, x) {
        .insert.deque(obj, lapply(seq(nrow(x)), function(i) x[i, ]))
    })

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


#' @include methods_insert.R
#' @include methods_peek.R
#' @include methods_pop.R
#' @include methods_size.R


#' @title Queue class
#'
#' @exportClass queue
#' @name queue-class
#' @rdname queue-class
#'
#' @description Implementation of a queue datastructure, i.e. a list
#'  implementation with FIFO principle. \code{queue} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}.
#'
#' @slot .data  object that bundles all important heap related objects
#' @examples
#'  # a queue with <character> elements
#'  queue <- new("queue", "character")
#'
#'  # a queue with <numeric> elements
#'  queue <- new("queue", "numeric")
#'
#'  # a queue with <integer> elements
#'  queue <- new("queue", "integer")
#'
setClass(
    "queue",
    slots = list(.data = "list"),
    prototype = prototype(.data = NULL)
)

#' @noRd
#' @importFrom methods new
setMethod(
    "initialize",
    "queue",
    function(.Object,
             key.class   = c("character", "numeric", "integer"))
    {
        .Object@.data <- list(key.class   = match.arg(key.class))

        if (key.class == "character")
        {
            queue <- methods::new(queue_s)
        }
        else if (key.class == "numeric")
        {
            queue <- methods::new(queue_d)
        }
        else
        {
            queue <- methods::new(queue_i)
        }
        .Object@.data$list <- queue
        .Object
    }
)

#' @title Add an element to a queue object
#'
#' @rdname insert-methods
#'
#' @examples
#'  # insert to a queue with <character> elements
#'  queue <- new("queue", "character")
#'
#'  queue <- insert(queue, "test")
setMethod(
    "insert",
    signature = signature(obj = "queue", x = "ANY", y = "missing"),
    function(obj, x, y="missing")
    {
        .check.key.class(obj, x)
        obj@.data$list$insert(x)
        return(obj)
    }
)

#' @title Pop (remove) and return the from the queue
#'
#' @rdname pop-methods
#'
#' @examples
#'  queue <- new("queue", "character")
#'  queue <- insert(queue, paste0("k", 1:10))
#'
#'  pop(queue)
setMethod(
    "pop",
    signature = signature(obj = "queue"),
    function(obj)
    {
        if (obj@.data$list$size())
            obj@.data$list$pop()
        else
            NULL
    }
)

#' @title Peek onto the first element of the queue
#'
#' @rdname peek-methods
#'
#' @examples
#'  queue <- new("queue", "character")
#'  queue <- insert(queue, paste0("k", 1:10))
#'
#'  peek(queue)
setMethod(
    "peek",
    signature = signature(obj = "queue"),
    function(obj)
    {
        if (obj@.data$list$size())
            obj@.data$list$peek()
        else
            NULL
    }
)

setMethod(
    "show",
    "queue",
    function(object)
    {
        cat(paste0("An object of class queue<",
                   object@.data$key.class, ">\n\n"))
        li <- peek(object)
        cat(paste0("First element -> ", ifelse(is.null(li), "NULL", li), "\n"))
    }
)

#' @export
#' @rdname size-methods
setMethod(
    "size",
    "queue",
    function(obj)
    {
        obj@.data$list$size()
    }
)

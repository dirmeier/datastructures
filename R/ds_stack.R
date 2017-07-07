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


#' @title Stack class
#'
#' @exportClass stack
#' @name stack-class
#' @rdname stack-class
#'
#' @description Implementation of a stack datastructure, i.e. a list
#'  implementation with LIFO principle. \code{stack} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}.
#'
#' @slot .data  object that bundles all important heap related objects
#' @examples
#'  # a stack with <character> elements
#'  stack <- new("stack", "character")
#'
#'  # a stack with <numeric> elements
#'  stack <- new("stack", "numeric")
#'
#'  # a stack with <integer> elements
#'  stack <- new("stack", "integer")
setClass(
    "stack",
    slots = list(.data = "list"),
    prototype = prototype(.data = NULL)
)

#' @noRd
#' @importFrom methods new
setMethod(
    "initialize",
    "stack",
    function(.Object,
             key.class   = c("character", "numeric", "integer"))
    {
        .Object@.data <- list(key.class   = match.arg(key.class))

        if (key.class == "character")
        {
            stack <- methods::new(stack_s)
        }
        else if (key.class == "numeric")
        {
            stack <- methods::new(stack_d)
        }
        else
        {
            stack <- methods::new(stack_i)
        }
        .Object@.data$list <- stack
        .Object
    }
)

#' @title Add an element to a stack object
#'
#' @rdname insert-methods
#'
#'
#' @examples
#'  # insert to a stack with <character> elements
#'  stack <- new("stack", "character")
#'
#'  stack <- insert(stack, "test")
setMethod(
    "insert",
    signature = signature(obj = "stack", x = "ANY", y = "missing"),
    function(obj, x, y="missing")
    {
        .check.key.class(obj, x)
        obj@.data$list$insert(x)
        return(obj)
    }
)

#' @title Pop (remove) and return the from the stack
#'
#' @rdname pop-methods
#'
#' @examples
#'  stack <- new("stack", "character")
#'  stack <- insert(stack, paste0("k", 1:10))
#'
#'  pop(stack)
setMethod(
    "pop",
    signature = signature(obj = "stack"),
    function(obj)
    {
        if (obj@.data$list$size())
            obj@.data$list$pop()
        else
            NULL
    }
)

#' @title Peek onto the first element of the stack
#'
#' @rdname peek-methods
#'
#' @examples
#'  stack <- new("stack", "character")
#'  stack <- insert(stack, paste0("k", 1:10))
#'
#'  peek(stack)
setMethod(
    "peek",
    signature = signature(obj = "stack"),
    function(obj)
    {
        if (obj@.data$list$size())
            obj@.data$list$peek()
        else
            NULL
    }
)

#' @noRd
setMethod(
    "show",
    "stack",
    function(object)
    {
        cat(paste0("An object of class stack<",
                   object@.data$key.class, ">\n\n"))
        li <- peek(object)
        cat(paste0("First element -> ", ifelse(is.null(li), "NULL", li), "\n"))
    }
)

#' @export
#' @rdname size-methods
setMethod(
    "size",
    "stack",
    function(obj)
    {
        obj@.data$list$size()
    }
)

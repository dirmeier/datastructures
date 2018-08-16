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


#' @include methods_peek.R
#' @include methods_pop.R
#' @include methods_size.R
#' @include methods_insert.R
#' @include methods_clear.R
NULL


#' @title Deque class
#'
#' @name deque-class
#' @rdname deque-class
#'
#' @description Abstract deque class
#'
#' @slot .deque  \code{C++} object representing a deque
#'
setClass(
    "deque",
    contains = "VIRTUAL",
    slots = list(.deque = "ANY"),
    prototype = prototype(.deque = NULL)
)


.clear.deque <- function(obj)
{
    obj@.deque$clear()
    obj
}

#' @noRd
.peek.deque <- function(obj)
{
    if (obj@.deque$size())
        obj@.deque$peek()
    else
      NULL
}


#' @noRd
.pop.deque <- function(obj)
{
    if (obj@.deque$size())
        obj@.deque$pop()
    else
      NULL
}


#' @noRd
.show.deque <- function(object)
{
    cat(paste0("An object of class ", class(object)[1], "<SEXP>\n\n"))
    li <- peek(object)
    cat(paste0("Peek: ", class(li), ", ...\n"))
}


#' @noRd
.size.deque <- function(obj)
{
    obj@.deque$size()
}


#' @noRd
.insert.deque <- function(obj, x)
{
    obj@.deque$insert(x)
    obj
}


#' @rdname peek-methods
setMethod("peek", "deque", .peek.deque)


#' @rdname pop-methods
setMethod("pop", "deque", .pop.deque)


setMethod("show", "deque", .show.deque)


#' @rdname size-methods
setMethod("size", "deque", .size.deque)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "deque", x = "ANY", y = "missing"),
  function(obj, x) .insert.deque(obj, list(x))
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "deque", x = "list", y = "missing"),
  function(obj, x)
  {
      x <- if (is.data.frame(x) || length(x) == 1) list(x) else x
      .insert.deque(obj, x)
  }
)


#' @rdname clear-methods
setMethod("clear", "deque", .clear.deque)

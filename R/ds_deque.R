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


#' @title Deque class
#'
#' @export
#' @name deque-class
#' @rdname deque-class
#'
#' @description Abstract deque class
#'
#' @slot .deque  \code{C++} object representing a deque
#' @slot .key.class  the class of the keys
#'
setClass(
    "deque",
    contains = "VIRTUAL",
    slots = list(.deque        = "ANY",
                 .key.class   = "character"),
    prototype = prototype(.deque       = NULL,
                          .key.class   = NA_character_)
)


#' @noRd
.peek.deque <- function(obj)
{
    if (obj@.deque$size())
        obj@.deque$peek()
    else
        NULL
}


#' @noRd
.pop.deque <-  function(obj)
{
    if (obj@.deque$size())
        obj@.deque$pop()
    else
        NULL
}


#' @noRd
.show.deque <- function(object)
{
    cat(paste0("An object of class ", class(object)[1], "<",
               object@.key.class, ">\n\n"))
    li <- peek(object)
    cat(paste0("First element -> ", ifelse(is.null(li), "NULL", li), "\n"))
}


#' @noRd
.size.deque <-  function(obj)
{
    obj@.deque$size()
}

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


#' @title Abstract heap class
#'
#' @name heap-class
#' @rdname heap-class
#'
#' @description Abstract heap class
#'
#' @slot .heap  \code{C++} object representing a heap
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass(
    "heap",
    contains = "VIRTUAL",
    slots = list(.heap        = "ANY",
                 .key.class   = "character",
                 .value.class = "character"),
    prototype = prototype(.heap        = NULL,
                          .key.class   = NA_character_,
                          .value.class = NA_character_)
)


#' @noRd
.insert.heap <- function(obj, x, y)
{
    .check.key.value.classes(obj, x, y)
    if (length(x) == 1)    { obj@.heap$insert_vectorial(x, y) }
    else if (is.vector(y)) { obj@.heap$insert_many(x, y) }
    else                   { obj@.heap$insert_many_vectorials(x, y)  }

    obj
}


#' @noRd
.peek.heap <- function(obj)
{
    if (obj@.heap$size())
        obj@.heap$peek()
    else
        NULL
}


#' @noRd
.pop.heap <- function(obj)
{
    if (obj@.heap$size())
        obj@.heap$pop()
    else
        NULL
}


#' @noRd
.show.heap <-   function(object)
{
    cat(paste0("An object of class ", class(object)[1], "<",
               object@.key.class, ",",
               object@.value.class, ">\n\n"))
    li <- peek(object)
    li.names <- names(li)
    li <- ifelse(is.null(li), "NULL", li)
    li.names <- ifelse(is.null(li.names), "NULL", li.names)
    cat(paste0(li.names, " -> ", li , "\n"))
}


#' @noRd
.size.heap <-  function(obj)
{
    obj@.heap$size()
}

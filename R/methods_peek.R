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


#' @title Have a look at the first element from an object without removing it
#'
#' @description Peeks into an object, i.e. takes the first element and returns
#'  it without removing it from the object.
#'
#' @export
#' @docType methods
#' @rdname peek-methods
#'
#' @param obj  the object to peek
#'
#' @return  returns the first element from \code{obj} as list
#'
setGeneric(
    "peek",
    function(obj)
    {
        standardGeneric("peek")
    },
    package = "datastructures"
)


#' @noRd
.peek.heap <- function(obj)
{
    if (obj@.heap$size())
        obj@.heap$peek()
    else
        NULL
}


#' @rdname peek-methods
setMethod("peek", "fibonacci_heap", .peek.heap)


#' @rdname peek-methods
setMethod("peek", "binomial_heap", .peek.heap)


#' @noRd
.peek.deque <- function(obj)
{
    if (obj@.deque$size())
        obj@.deque$peek()
    else
        NULL
}


#' @rdname peek-methods
setMethod("peek", "stack", .peek.deque)


#' @rdname peek-methods
setMethod("peek", "queue", .peek.deque)

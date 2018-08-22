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


#' @title Decreases the key of a node in a heap
#'
#' @description Decreases the key of a node in a heap and updates the complete
#'  heap. The key is decreases \code{from} a value \code{to} a value by that moving the
#'  node's position in the heap. If a node cannot uniquely be identified using
#'  the \code{to} key, a \code{\link{handle}} needs to be given in addition.
#'
#' @export
#' @docType methods
#' @rdname decrease_key-methods
#'
#' @param obj  a heap object
#' @param from  a key in the heap for which the node should be decreased
#' @param to  the new value of the heap
#' @param handle  the handle of the specific node that is decreased
#'
#' @return  returns extracted handles and values from \code{obj}
#'
#' @examples
#'
#'  # decreases the key of a heap
#'  f_heap <- fibonacci_heap("integer")
#'  f_heap <- insert(f_heap, 1:5, letters[1:5])
#'  peek(f_heap)
#'
#'  decrease_key(f_heap, 5L, -1L)
#'  peek(f_heap)
#'
#'  hand <- handle(f_heap, value=letters[3])
#'  decrease_key(f_heap, hand[[1]]$key, -2L)
#'  peek(f_heap)
#'
setGeneric(
    "decrease_key",
    function(obj, from, to, handle)
    {
        standardGeneric("decrease_key")
    },
    package = "datastructures"
)

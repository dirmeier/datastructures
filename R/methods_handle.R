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



#' @title Get the handles and values for nodes of a specific key in a heap.
#'
#' @description Returns a list of handles and values for node elements that have
#'  a specific key. That means for a given key, the reference to the node
#'  (the handle) as well as the value of the node are returned. If one key fits
#'  fits multiple nodes, all of the values and handles are returned. This is
#'  needed in order to uniquely identify a node if, for example,
#'  \code{decrease_key} on a specific node is going to be called.
#'
#' @export
#' @docType methods
#' @rdname handle-methods
#'
#' @param obj  a heap object
#' @param key  a key in the heap
#' @param value  a value in the heap
#'
#' @return  returns extracted handles and values from \code{obj}
#'
#' @examples
#'  # returns the handle of a heap
#'  f_heap <- fibonacci_heap("integer")
#'  f_heap <- insert(f_heap, 1:5, letters[1:5])
#'
#'  handle(f_heap, key=3L)
#'
#'  handle(f_heap, value=letters[3])
#'
setGeneric(
    "handle",
    function(obj, key, value)
    {
        standardGeneric("handle")
    },
    package = "datastructures"
)

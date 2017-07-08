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


#' @include ds_fibonacci_heap.R
#' @include ds_hashmap.R
#' @include ds_stack.R
#' @include ds_queue.R


#' @title Get the size of an object
#'
#' @description Computes the size of an object, i.e. the number of keys or
#'  <key, value> pairs depending on the object.
#'
#' @export
#' @docType methods
#' @rdname size-methods
#'
#' @param obj  the object to get the size from
#' @return  returns the size of an object
#'
setGeneric(
    "size",
    function(obj)
    {
        standardGeneric("size")
    },
    package = "datastructures"
)

#' @rdname size-methods
setMethod(
    "size",
    "fibonacci_heap",
    function(obj)
    {
        obj@.data$heap$size()
    }
)

#' @rdname size-methods
setMethod(
    "size",
    "hashmap",
    function(obj)
    {
        obj@.data$map$size()
    }
)

#' @rdname size-methods
setMethod(
    "size",
    "queue",
    function(obj)
    {
        obj@.data$list$size()
    }
)

#' @rdname size-methods
setMethod(
    "size",
    "stack",
    function(obj)
    {
        obj@.data$list$size()
    }
)

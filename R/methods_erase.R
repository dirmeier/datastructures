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


#' @title Erase an entry from a map
#'
#' @description Erase a vector of key-value pair from a map object.
#'
#' @export
#' @docType methods
#' @rdname erase-methods
#'
#' @param obj  the object to pop an element from
#' @param key  a vector of keys that should be removed
#' @param value optionally a list of values needs to be supplied for some data
#'  structures such as multimaps if entries should be removed.

#' @return  returns \code{obj} with removed values
#'
setGeneric(
    "erase",
    function(obj, key, value)
    {
        standardGeneric("erase")
    },
    package = "datastructures"
)

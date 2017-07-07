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


#' @title Pop a single element from an object
#'
#' @description Remove and return the first element from an object.
#'
#' @export
#' @docType methods
#' @rdname pop-methods
#'
#' @param obj  the object to pop an element from
#' @return  returns the first element
setGeneric(
    "pop",
    function(obj)
    {
        standardGeneric("pop")
    },
    package = "datastructures"
)

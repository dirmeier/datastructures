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


#' @title Add elements to an object
#'
#' @description Adds keys or <key, value> pairs to an object and returns the
#'  object. Depending on the datastructure used, either only keys are required
#'  or pairs of <keys, values>.
#'
#' @exportMethod insert
#' @docType methods
#' @rdname insert-methods
#'
#' @param obj  object to insert into
#' @param x  the values/keys to insert into
#' @param y  values to be inserted which are required for some datastructures
#'
#' @return  returns \code{obj} with inserted values
#'
setGeneric(
    "insert",
    function(obj, x, y)
    {
        standardGeneric("insert")
    },
    package = "datastructures"
)



#' @noRd
.insert.deque <- function(obj, x)
{
    .check.key.class(obj, x)
    obj@.deque$insert(x)

    obj
}


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "stack", x = "ANY", y = "missing"),
    function(obj, x) .insert.deque(obj, x)
)


#' @rdname insert-methods
setMethod(
    "insert",
    signature = signature(obj = "queue", x = "ANY", y = "missing"),
    function(obj, x) .insert.deque(obj, x)
)

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
#'  or pairs of <keys, values>. Insertion of elements with vectors, i.e. giving
#'  multiple arguments at the same time is faster than inserting elements
#'  iteratively.
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
#' @examples
#'
#'  # inserts values into a multimap
#'  m_map <- multimap()
#'  m_map <- insert(m_map, c("a", "b"), 1:2)
#'  m_map <- insert(m_map, c("a", "b"), list(1, list(a=1)))
#'  m_map["a"] <- rnorm(length(letters))
#'  m_map[c("a", "b", "c")] <- list(1, data.frame(a=2), environment())
#'
#'  # inserts values into a fibonacci_heap
#'  f_heap <- fibonacci_heap("integer")
#'  f_heap <- insert(f_heap, 1:2, 1:2)
#'  f_heap[3:4] <- list(1, list(a=1))
#'  f_heap <- insert(f_heap, 5:6, list(data.frame(a=rnorm(3)), diag(2)))
#'
#'  # inserts elements into a queue or stack
#'  s <- stack()
#'  s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))
#'
setGeneric(
    "insert",
    function(obj, x, y)
    {
        standardGeneric("insert")
    },
    package = "datastructures"
)

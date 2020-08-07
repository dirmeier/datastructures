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


#' @title Get values from an object
#'
#' @description Extracts the values from a data structure such as a \code{map}
#'  or \code{heap} object.
#'
#' @export
#' @docType methods
#' @rdname values-methods
#'
#' @param obj  object to extract values from
#'
#' @return  returns the extracted values as a \code{list} or, when primitive, as
#'  a \code{vector}. In case of a \code{heap} also returns \code{key} and \code{handle}
#'  of the heap node.
#'
#' @examples
#'
#' # shows the values of a hashmap
#' h_map <- hashmap("integer")
#' h_map <- insert(h_map, seq(2), list(data.frame(a = 1), 3))
#' values(h_map)
#'
#' # shows the values of a multimap
#' m_map <- multimap("integer")
#' m_map[seq(2)] <- list(diag(2), rnorm(3))
#' values(m_map)
#'
#' # shows the values of a heap
#' f_heap <- fibonacci_heap("integer")
#' f_heap <- insert(f_heap, 1:2, list(diag(2), rnorm(3)))
#' values(f_heap)
setGeneric(
  "values",
  function(obj) {
    standardGeneric("values")
  },
  package = "datastructures"
)

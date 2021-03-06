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


#' @title Remove all elements from a datastructure
#'
#' @description Removes every element that is stored in a data structure and
#'  resets everything.
#'
#' @export
#' @docType methods
#' @rdname clear-methods
#'
#' @param obj  the object to clear
#'
#' @examples
#'
#' # clears a multimap
#' m_map <- multimap()
#' m_map <- insert(m_map, c("a", "b"), 1:2)
#' m_map <- insert(m_map, c("a", "b"), list(1, list(a = 1)))
#' m_map <- clear(m_map)
#'
#'
#' # clears a heap
#' f_heap <- fibonacci_heap("integer")
#' f_heap <- insert(f_heap, 1:2, 1:2)
#' f_heap[3:4] <- list(1, list(a = 1))
#' f_heap <- clear(f_heap)
#'
#' # clears a \code{deque}
#' s <- stack()
#' s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))
#' s <- clear(s)
setGeneric(
  "clear",
  function(obj) {
    standardGeneric("clear")
  },
  package = "datastructures"
)

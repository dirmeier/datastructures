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
#'
#' @return  returns the size of \code{obj}
#'
#' @examples
#'
#' # get the size of a hashmap
#' h_map <- hashmap()
#' h_map[letters] <- rnorm(length(letters))
#' size(h_map)
#'
#' # get the size of a fibonacci heap
#' f_heap <- fibonacci_heap()
#' f_heap <- insert(f_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
#' size(f_heap)
#'
#' # get the size of a stack
#' s <- stack()
#' s <- insert(s, list(1))
#' size(s)
setGeneric(
  "size",
  function(obj) {
    standardGeneric("size")
  },
  package = "datastructures"
)

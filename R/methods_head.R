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


#' @title Have a look at the head of an object
#'
#' @description Shows the first few elements of a data structure.
#'
#' @export
#' @docType methods
#' @rdname head-methods
#'
#' @param x  the object to peek
#' @param ... other arguments that are only required for \code{utils::head}
#'
#' @return  returns the head of an object
#'
#' @examples
#'
#'  # shows the head of a hashmap
#'  h_map <- hashmap()
#'  h_map[letters] <- rnorm(length(letters))
#'  head(h_map)
#'
#'  # shows the head of a bimap
#'  b_map <- bimap("integer", "integer")
#'  b_map[seq(10)] <- seq(10, 1)
#'  head(b_map)
#'
head <- function(x, ...) {
    UseMethod("head")
}

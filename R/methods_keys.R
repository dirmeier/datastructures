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


#' @title Get keys from an object
#'
#' @description Extracts the keys from a \code{map} object.
#'
#' @export
#' @docType methods
#' @rdname keys-methods
#'
#' @param obj  object to extract keys from
#'
#' @return  returns the extracted keys as vector
#'
#' @examples
#'
#'  # returns the keys of a hashmap
#'  h_map <- hashmap("numeric")
#'  h_map[rnorm(3)] <- list(1, 2, 3)
#'  keys(h_map)
#'
#'  # returns the keys of a multimap
#'  m_map <- multimap("numeric")
#'  m_map[c(1, 2, 1)] <- list(rnorm(1), rgamma(1, 1), rexp(1))
#'  keys(m_map)
#'
setGeneric(
  "keys",
  function(obj) {
    standardGeneric("keys")
  }
)

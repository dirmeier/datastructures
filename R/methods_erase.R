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
#' @description Erase a vector of key-value pair from a \code{map} object.
#'
#' @export
#' @docType methods
#' @rdname erase-methods
#'
#' @param obj  the object to pop an element from
#' @param key  a vector of keys that should be removed
#' @param value optionally a list of values needs to be supplied for some data
#'  structures such as \code{multimap}s if a single key-value pair should removed. If
#'  not provided removes all key-value pairs with a specific key.

#' @return  returns \code{obj} with removed values
#' @examples
#'
#'  # erases keys from a hashmap or bimap
#'  h_map <- hashmap()
#'  h_map[letters] <- rnorm(length(letters))
#'  h_map <- erase(h_map, "a")
#'  h_map <- erase(h_map, letters[2:5])
#'
#'  # erases keys from a multimap
#'  m_map <- multimap()
#'  m_map[c("a", "a", "a", "b", "b", "c")] <- rep(1:2, 3)
#'  m_map <- erase(m_map, "a")
#'  m_map <- erase(m_map, "b", 1)
#'
setGeneric(
    "erase",
    function(obj, key, value)
    {
        standardGeneric("erase")
    },
    package = "datastructures"
)

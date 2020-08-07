#' # datastructures: Implementation of core datastructures for R.
#' #
#' # Copyright (C) Simon Dirmeier
#' #
#' # This file is part of datastructures.
#' #
#' # datastructures is free software: you can redistribute it and/or modify
#' # it under the terms of the GNU General Public License as published by
#' # the Free Software Foundation, either version 3 of the License, or
#' # (at your option) any later version.
#' #
#' # datastructures is distributed in the hope that it will be useful,
#' # but WITHOUT ANY WARRANTY; without even the implied warranty of
#' # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#' # GNU General Public License for more details.
#' #
#' # You should have received a copy of the GNU General Public License
#' # along with datastructures. If not, see <http://www.gnu.org/licenses/>.


#' @title Access elements from an object
#'
#' @description Extracts a set of <key, value> pairs. For \code{hashmaps}
#'  mappings from
#'  \deqn{f: keys -> values,}
#'  exist so argument \code{which} is per default \code{values} (since these
#'  are going to be retrieved). For \code{bimaps} also
#'  \deqn{f: values -> keys,}
#'  mappings exist, such that \code{which} can also be \code{keys} if the keys
#'  from the object should be retrieved.
#'
#' @export
#' @docType methods
#' @rdname at-methods
#'
#' @param obj  object to extract values from
#' @param x  the set of keys to match the values
#' @param which  choose either \code{values} if the values should get returned
#' @param ... other arguments
#'  or \code{keys} if the keys should get returned
#'
#' @return  returns extracted keys or values from \code{obj}
#' @examples
#'
#' # access values from a hashmap
#' h_map <- hashmap("integer")
#' h_map[seq(2)] <- list(data.frame(a = rexp(3), b = rnorm(3)), environment())
#' h_map[1L]
#'
#' # access values or keys from a bimap
#' b_map <- bimap("integer", "character")
#' b_map[seq(5)] <- letters[seq(5)]
#' at(b_map, c(1L, 3L))
#' at(b_map, c(1L, 3L), which = "values")
#' at(b_map, c("a", "c"), which = "keys")
#'
#' # access values from a multimap
#' m_map <- multimap("integer")
#' m_map[c(seq(5), seq(5))] <- letters[seq(10)]
#' at(m_map, 1L)
setGeneric(
  "at",
  function(obj, x, which = c("values", "keys"), ...) {
    standardGeneric("at")
  },
  package = "datastructures"
)

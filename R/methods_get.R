# datastructures: Implementation of core datastructures for R.  Copyright (C)
# Simon Dirmeier This file is part of datastructures.  datastructures is free
# software: you can redistribute it and/or modify it under the terms of the GNU
# General Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
# datastructures is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License along with
# datastructures. If not, see <http://www.gnu.org/licenses/>.


#' @title Get elements from an object
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
#' @rdname get-methods
#'
#' @param obj  object to extract values from
#' @param x  the set of keys to match the values
#' @param which  choose either \code{values} if the values should get returned
#'  or \code{keys} if the keys should get returned
#'
#' @return  returns extracted keys or values from \code{obj}
#'
setGeneric(
    "get",
    function(obj) standardGeneric("get"),
    package = "datastructures"
)

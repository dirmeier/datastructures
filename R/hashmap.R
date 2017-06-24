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


#' @title Hashmap class
#'
#' @exportClass hashmap
#' @name hashmap-class
#' @rdname hashmap-class
#'
#' @description Implementation of a hashmap datastructure, i.e. an unordered collection
#'  of key-value pairs. Inserting and accessing is amortized in \emph{O(1)}.
#'  \code{hashmap} wraps a C++ \code{unordered_map} using Rcpp modules.
#'
#' @slot .map an Rcpp module wrapping an \code{unordered_map}
setClass(
    "hashmap",
     slots     = list(.map      = "ANY"),
     prototype = prototype(.map = NULL)
)

#' @title Add key-value pairs to a \code{hashmap}-object
#'
#' @export
#' @docType methods
#' @rdname insert-methods
#'
#' @param obj  the hashmap you want to insert pairs to
#' @param keys  a scalar/vector of keys
#' @param values  a scalar/vector of values
#' @examples
#'   hashmap <- new("hashmap")
#'   insert(hashmap, "test", 1)
setGeneric(
    "insert",
    function(obj, keys, values)
    {
        standardGeneric("insert")
    },
    package="datastructures"
)

#' @rdname insert-methods
#' @aliases insert,character,character-method
setMethod(
    "insert",
    signature = signature(obj="hashmap", keys="character", values="character"),
    function(obj, keys, values)
    {
        if (is.null(obj@.map))
        {
            cat("flower")
            obj@.map <- methods::new(hashmap_ss)
        }
        else if (class(obj@.map) != "Rcpp_hashmap_ss")
        {
            stop(paste0("cannot insert <character,character> to ", class(obj@.map)[1]))
        }
        cat("sinserting")
        obj@.map$insert(keys, values)
        return(obj)
    }
)


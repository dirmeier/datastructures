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


#' @include ds_map.R
NULL


#' @title Hashmap class
#'
#' @export
#' @name hashmap-class
#' @rdname hashmap-class
#'
#' @description Implementation of a hashmap datastructure, i.e. an unordered
#' collection of key-value pairs:
#' \deqn{f: keys -> values,}
#' Inserting and accessing is amortized in \emph{O(1)}.
#' \code{hashmap} wraps a C++ \code{unordered_map} using Rcpp modules.
#' See \code{\linkS4class{bimap}} for mappings in both ways.
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("hashmap", contains = "map")

#' @noRd
#' @importFrom methods new callNextMethod
setMethod(
    "initialize",
    "hashmap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        .Object <- methods::callNextMethod(.Object,
                                           key.class   = key.class,
                                           value.class = value.class)
        key.class   <- .Object@.key.class
        value.class <- .Object@.value.class

        if (key.class == "character")
        {
            if (value.class == "character")    map <- methods::new(hashmap_ss)
            else if (value.class == "integer") map <- methods::new(hashmap_si)
            else                               map <- methods::new(hashmap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")    map <- methods::new(hashmap_ds)
            else if (value.class == "integer") map <- methods::new(hashmap_di)
            else                               map <- methods::new(hashmap_dd)
        }
        else
        {
            if (value.class == "character")    map <- methods::new(hashmap_is)
            else if (value.class == "integer") map <- methods::new(hashmap_ii)
            else                               map <- methods::new(hashmap_id)
        }

        .Object@.map <- map
        .Object
    }
)

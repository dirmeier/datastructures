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
#' @export
#' @name hashmap-class
#' @rdname hashmap-class
#'
#' @description Implementation of a hashmap datastructure, i.e. an unordered collection
#'  of key-value pairs. Inserting and accessing is amortized in \emph{O(1)}.
#'  \code{hashmap} wraps a C++ \code{unordered_map} using Rcpp modules.
#'
#' @slot .data  object that bundles all important map related objects
setClass(
    "hashmap",
     slots = list(.data = "list"),
     prototype = prototype(.data = NULL)
)

#' @importFrom methods new
setMethod(
    "initialize",
    "hashmap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        key.class   <- match.arg(key.class)
        value.class <- match.arg(value.class)
        .Object@.data <- list(key.class   = key.class,
                              value.class = value.class)

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

        .Object@.data$map <- map
        .Object
    }
)

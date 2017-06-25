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
#' @slot .list  object that bundles all important map related objects
#' @examples
#'  # a hashmap with <character, double> pairs
#'  hashmap <- new("hashmap", "character", "numeric")
#'
#'  # a hashmap with <character, integer> pairs
#'  hashmap <- new("hashmap", "character", "integer")
#'
#'  # a hashmap with <double, double> pairs
#'  hashmap <- new("hashmap", "numeric", "numeric")
#'
#'  # a hashmap with <integer, double> pairs
#'  hashmap <- new("hashmap", "integer", "numeric")
#'
#'  # a hashmap with <integer, character> pairs
#'  hashmap <- new("hashmap", "integer", "character")
setClass(
    "hashmap",
     slots = list(.data = "list"),
     prototype = prototype(.data = NULL)
)

#' @noRd
setMethod(
    "initialize",
    "hashmap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        .Object@.data <- list(key.class   = match.arg(key.class),
                              value.class = match.arg(value.class))

        if (key.class == "character")
        {
            if (value.class == "character")    map <- new(hashmap_ss)
            else if (value.class == "integer") map <- new(hashmap_si)
            else                               map <- new(hashmap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")    map <- new(hashmap_ds)
            else if (value.class == "integer") map <- new(hashmap_di)
            else                               map <- new(hashmap_dd)
        }
        else
        {
            if (value.class == "character")    map <- new(hashmap_is)
            else if (value.class == "integer") map <- new(hashmap_ii)
            else                               map <- new(hashmap_id)
        }
        .Object@.data$map <- map
        .Object
    }
)

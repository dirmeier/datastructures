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

#' @title Bimap class
#'
#' @export
#' @name bimap-class
#' @rdname bimap-class
#'
#' @description Implementation of a bimap data structure, i.e. an unordered
#' collection of key-value pairs. The notable difference to
#' \code{\linkS4class{hashmap}} is that the mapping is not only
#' \deqn{f: keys -> values,}
#' but also
#' \deqn{f: values -> keys.}
#' Inserting and accessing is amortized in \emph{O(1)}.
#' \code{bimap} wraps a \code{boost::bimap} using Rcpp modules.
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass("bimap", contains = "map")


#' @noRd
#' @importFrom methods new callNextMethod
setMethod(
    "initialize",
    "bimap",
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
            if (value.class == "character")    map <- methods::new(bimap_ss)
            else if (value.class == "integer") map <- methods::new(bimap_si)
            else                               map <- methods::new(bimap_sd)
        }
        else if (key.class == "numeric")
        {
            if (value.class == "character")    map <- methods::new(bimap_ds)
            else if (value.class == "integer") map <- methods::new(bimap_di)
            else                               map <- methods::new(bimap_dd)
        }
        else
        {
            if (value.class == "character")    map <- methods::new(bimap_is)
            else if (value.class == "integer") map <- methods::new(bimap_ii)
            else                               map <- methods::new(bimap_id)
        }

        .Object@.map <- map
        .Object
    }
)


#' @title Create a new \code{bimap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{bimap}} object,
#'  i.e. an unordered collection of key-value pairs with mappings
#'  \deqn{f: keys -> values,}
#'  and
#'  \deqn{f: values -> keys.}
#'
#' @param key.class  the primitive class type of the keys
#' @param value.class  the primitive class type of the values
#'
#' @return returns a new \code{bimap} object
#'
bimap <- function(
    key.class = c("character", "numeric", "integer"),
    value.class = c("character", "numeric", "integer"))
{
    methods::new("bimap", key.class, value.class)
}

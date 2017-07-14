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


#' @include zzz.R


#' @title Abstract heap class
#'
#' @name heap-class
#' @rdname heap-class
#'
#' @description Abstract heap class
#'
#' @slot .heap  \code{C++} object representing a heap
#' @slot .key.class  the class of the keys
#' @slot .value.class  the class of the values
#'
setClass(
    "heap",
    contains = "VIRTUAL",
    slots = list(.heap        = "ANY",
                 .key.class   = "character",
                 .value.class = "character"),
    prototype = prototype(.heap        = NULL,
                          .key.class   = NA_character_,
                          .value.class = NA_character_)
)

#' @noRd
#' @importFrom methods new
setMethod(
    "initialize",
    "heap",
    function(.Object,
             key.class   = c("character", "numeric", "integer"),
             value.class = c("character", "numeric", "integer"))
    {
        .Object@.key.class    <- match.arg(key.class)
        .Object@.value.class <- match.arg(value.class)

        .Object
    }
)

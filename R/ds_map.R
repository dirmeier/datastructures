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


#' @include methods_size.R
#' @include methods_head.R


#' @title Map class
#'
#' @name map-class
#' @rdname map-class
#'
#' @description Abstract map class
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#'
setClass(
  "map",
  contains = "VIRTUAL",
  slots = list(.map = "ANY", .key.class = "character"),
  prototype = prototype(.map = NULL, .key.class = NA_character_)
)


#' @noRd
.head.map <- function(obj)
{
  if (obj@.map$size())
    obj@.map$head()
  else NULL
}


#' @noRd
.show.map <- function(object)
 {
  clazz <- class(object)[1]
  pf <- ifelse(clazz == "bimap", " <--> ", " -> ")
  cat(paste0("An object of class ", clazz, "<",
             object@.key.class, ",T",
             ">\n\n"))
  li <- head(object)
  for (l in names(li))
  {
    e <- li[[l]]
    if (is.null(e)) e <- "NULL"
    cat(paste0(l, pf, class(e), "\n"))
  }
  if (is.null(li))
    cat(paste0("NULL", pf, "NULL", "\n"))
}


#' @noRd
.size.map <- function(obj)
{
  obj@.map$size()
}


#' @noRd
setMethod("show", "map", .show.map)


#' @rdname size-methods
setMethod("size", "map", .size.map)


#' @rdname head-methods
setMethod("head", "map", .head.map)

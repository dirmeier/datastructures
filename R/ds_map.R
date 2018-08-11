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
#' @include methods_remove.R
#' @include methods_clear.R

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
.clear.map <- function(obj)
{
    obj@.map$clear()
}


#' @noRd
.remove.map <- function(obj, key, value=NULL)
{
    .check.key.class(obj, key)
    if (is.null(value)) {
        obj@.map$remove(key)
    } else {
        if (length(key) != length(value))
            stop("dimensions of keys and values do not match")
        obj@.map$remove(key, value)
    }

    obj
}


#' @rdname remove-methods
setMethod(
    "remove",
    signature = signature(obj = "map", key = "vector", value = "vector"),
    function(obj, key, value)
    {
        if (length(key) == 1) value <- list(value)
        else if (length(key) == length(value) && is.vector(value))
            value <- as.list(value)
        .remove.map(obj, key, value)
    }
)


#' @rdname remove-methods
setMethod(
    "remove",
    signature = signature(obj = "map", key = "vector", value = "list"),
    function(obj, key, value)
    {
        value <- if (is.data.frame(value)) list(value) else value
        .remove.map(obj, key, value)
    }
)


#' @rdname remove-methods
setMethod(
    "remove",
    signature = signature(obj = "map", key = "vector", value = "ANY"),
    function(obj, key, value)
    {
        .remove.map(obj, key, list(value))
    }
)


#' @rdname remove-methods
setMethod(
    "remove",
    signature = signature(obj = "map", key = "vector", value = "missing"),
    function(obj, key) .remove.map(obj, key, NULL)
)


#' @rdname size-methods
setMethod("clear", "map", .clear.map)

#' @noRd
setMethod("show", "map", .show.map)


#' @rdname size-methods
setMethod("size", "map", .size.map)


#' @rdname head-methods
setMethod("head", "map", .head.map)

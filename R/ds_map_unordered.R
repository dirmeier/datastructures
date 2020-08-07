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
#' @include methods_insert.R
#' @include methods_at.R
#' @include methods_keys.R
#' @include methods_values.R
NULL


#' @title Abstract unordered map class
#'
#' @name unordered_map-class
#' @rdname unordered_map-class
#'
#' @description Abstract unordered map class
#'
#' @slot .map  \code{C++} object representing a mapping
#' @slot .key.class  the class of the keys
#'
setClass(
  "unordered_map",
  contains = c("map", "VIRTUAL"),
  prototype = prototype(.map = NULL, .key.class = NA_character_)
)


#' @noRd
#' @importFrom methods is
.insert.unordered_map <- function(obj, x, y) {
  if (length(x) != length(y)) {
    stop("dimensions of keys and values do not match", call. = FALSE)
  }

  .check.key.class(obj, x)
  if (methods::is(obj, "hashmap")) erase(obj, x)
  obj@.map$insert(x, y)

  obj
}


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "unordered_map", x = "vector", y = "vector"),
  function(obj, x, y) {
    if (length(x) == 1) {
      y <- list(y)
    } else if (length(x) == length(y) && is.vector(y)) {
      y <- as.list(y)
    }
    .insert.unordered_map(obj, x, y)
  }
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "unordered_map", x = "vector", y = "list"),
  function(obj, x, y) {
    if (length(x) == 1) y <- list(y)
    .insert.unordered_map(obj, x, y)
  }
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "unordered_map", x = "vector", y = "ANY"),
  function(obj, x, y) .insert.unordered_map(obj, x, list(y))
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to an unordered_map.
#'
#' @param x  x  an unorderd map object, such as a \code{\link{hashmap}} or
#'  \code{\link{multimap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(
    x = "unordered_map", i = "vector", j = "missing", value = "ANY"
  ),
  function(x, i, value) insert(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to an unordered_map.
#'
#' @param x  x  an unorderd map object, such as a \code{\link{hashmap}} or
#'  \code{\link{multimap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(
    x = "unordered_map", i = "vector", j = "missing", value = "vector"
  ),
  function(x, i, value) insert(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to an unordered_map.
#'
#' @param x  x  an unorderd map object, such as a \code{\link{hashmap}} or
#'  \code{\link{multimap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(
    x = "unordered_map", i = "vector", j = "missing", value = "list"
  ),
  function(x, i, value) insert(x, i, value)
)


#' @rdname at-methods
setMethod(
  "at",
  signature = signature(obj = "unordered_map", x = "vector", which = "missing"),
  function(obj, x) {
    .check.key.class(obj, x)
    obj@.map$get(x)
  }
)


#' @title Extract elements from an object
#'
#' @description Access <key, value> pairs of an unordered map using a
#'  set of keys.
#'
#' @param x  an unorderd map object, such as a \code{\link{hashmap}} or
#'  \code{\link{multimap}}
#' @param i  a vector of keys
setMethod(
  "[",
  signature = signature(
    x = "unordered_map", i = "vector", j = "missing", drop = "missing"
  ),
  function(x, i) at(x, i)
)


#' @rdname keys-methods
setMethod("keys", "unordered_map", function(obj) obj@.map$keys())


#' @rdname values-methods
setMethod("values", "unordered_map", function(obj) obj@.map$values())

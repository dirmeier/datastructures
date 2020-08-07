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


#' @include methods_insert.R
#' @include methods_peek.R
#' @include methods_pop.R
#' @include methods_size.R
#' @include methods_handle.R
#' @include methods_decrease.R
#' @include methods_values.R
#' @include methods_clear.R
NULL


#' @title Abstract heap class
#'
#' @name heap-class
#' @rdname heap-class
#'
#' @description Abstract heap class
#'
#' @slot .heap  \code{C++} object representing a heap
#' @slot .key.class  the class of the keys
#'
setClass(
  "heap",
  contains = "VIRTUAL",
  slots = list(.heap = "ANY", .key.class = "character"),
  prototype = prototype(
    .heap = NULL,
    .key.class = NA_character_
  )
)


#' @noRd
.insert.heap <- function(obj, x, y) {
  if (length(x) != length(y)) {
    stop("dimensions of keys and values do not match")
  }
  .check.key.class(obj, x)
  obj@.heap$insert(x, y)

  obj
}


#' @noRd
.peek.heap <- function(obj) {
  if (obj@.heap$size()) {
    obj@.heap$peek()
  } else {
    NULL
  }
}


#' @noRd
.pop.heap <- function(obj) {
  if (obj@.heap$size()) {
    obj@.heap$pop()
  } else {
    NULL
  }
}


#' @noRd
.show.heap <- function(object) {
  cat(paste0(
    "An object of class ", class(object)[1],
    "<", object@.key.class, ", SEXP>\n\n"
  ))
  li <- peek(object)
  li.names <- names(li)
  if (is.null(li.names)) {
    li.names <- "NULL"
  } else {
    li <- li[[1]]
  }
  cat(paste0("Peek: ", li.names, " -> ", class(li), ", ...\n"))
}


#' @noRd
.size.heap <- function(obj) {
  obj@.heap$size()
}


#' @noRd
.clear.heap <- function(obj) {
  obj@.heap$clear()
  obj
}


#' @noRd
#' @importFrom purrr map
.handle <- function(obj, key, value) {
  if (!is.null(key)) {
    .check.key.class(obj, key)
    ret <- obj@.heap$handles(key)
    ret <- purrr::map(
      names(ret),
      .f = function(x) list(handle = x, value = ret[[x]])
    )
  } else if (!is.null(value)) {
    ret <- obj@.heap$handle_values(value)
    ret <- purrr::map(names(ret),
      .f = function(x) list(handle = x, key = ret[[x]])
    )
  }

  ret
}


#' @noRd
.decrease_key <- function(obj, from, to, handle) {
  .check.key.class(obj, from)
  .check.key.class(obj, to)
  if (is.null(handle)) {
    handlex <- vector(mode = "character", length = length(from))
    for (i in seq_along(from))
    {
      handle.ids <- obj@.heap$handles(from[i])
      if (length(handle.ids) == 1) {
        handlex[i] <- names(handle.ids)[1]
      } else if (length(handle.ids) == 0) {
        stop(paste0("no handles found for '", from[i], "'."))
      } else {
        stop(paste0(
          "Multiple handles found for '", from[i], "'. ",
          "Please specify handles implicitely."
        ), call. = FALSE)
      }
    }
  } else {
    handlex <- handle
  }

  obj@.heap$decrease_key(from, to, handlex)

  obj
}


#' @noRd
#' @importFrom purrr map
.heap_values <- function(obj) {
  ret <- obj@.heap$values()
  ret
}


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "heap", x = "vector", y = "vector"),
  function(obj, x, y) {
    if (length(x) == 1) {
      y <- list(y)
    } else if (length(x) == length(y) && is.vector(y)) {
      y <- as.list(y)
    }
    .insert.heap(obj, x, y)
  }
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "heap", x = "vector", y = "matrix"),
  function(obj, x, y) {
    if (length(x) == 1) {
      y <- list(y)
    } else {
      stop("length(x) != 0")
    }
    .insert.heap(obj, x, y)
  }
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "heap", x = "vector", y = "list"),
  function(obj, x, y) {
    if (length(x) == 1) y <- list(y)
    .insert.heap(obj, x, y)
  }
)


#' @rdname insert-methods
setMethod(
  "insert",
  signature = signature(obj = "heap", x = "vector", y = "ANY"),
  function(obj, x, y) {
    if (length(x) == 1) {
      y <- list(y)
    } else {
      stop("length(x) != 1", call. = FALSE)
    }
    .insert.heap(obj, x, y)
  }
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a heap object, such as a \code{\link{fibonacci_heap}} or a
#'  \code{\link{binomial_heap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(x = "heap", i = "vector", j = "missing", value = "vector"),
  function(x, i, value) insert(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a heap object, such as a \code{\link{fibonacci_heap}} or a
#'  \code{\link{binomial_heap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(x = "heap", i = "vector", j = "missing", value = "list"),
  function(x, i, value) insert(x, i, value)
)


#' Insert parts to an object
#'
#' @description Inserts <key, value> pairs to a heap. The keys are
#'  determine the ordering of the heap, while the value is the actual value to
#'  store.
#'
#' @param x  a heap object, such as a \code{\link{fibonacci_heap}} or a
#'  \code{\link{binomial_heap}}
#' @param i  a vector of keys
#' @param value  a vector of values for the keys
setMethod(
  "[<-",
  signature = signature(x = "heap", i = "vector", j = "missing", value = "matrix"),
  function(x, i, value) insert(x, i, value)
)


#' @rdname handle-methods
setMethod(
  "handle",
  signature = signature(obj = "heap", key = "vector", value = "missing"),
  function(obj, key) .handle(obj, key, NULL)
)


#' @rdname handle-methods
setMethod(
  "handle",
  signature = signature(obj = "heap", key = "missing", value = "list"),
  function(obj, value) {
    if (is.data.frame(value)) {
      value <- list(value)
    } else if (is.list(value) &&
      length(value) == 1 &&
      !is.list(value[[1]])) {
      value <- list(value)
    }
    .handle(obj, NULL, value)
  }
)


#' @rdname handle-methods
setMethod(
  "handle",
  signature = signature(obj = "heap", key = "missing", value = "vector"),
  function(obj, value) {
    .handle(obj, NULL, list(value))
  }
)


#' @rdname handle-methods
setMethod(
  "handle",
  signature = signature(obj = "heap", key = "missing", value = "matrix"),
  function(obj, value) {
    .handle(obj, NULL, list(value))
  }
)

#' @rdname decrease_key-methods
setMethod(
  "decrease_key",
  signature = signature(
    obj = "heap", from = "vector", to = "vector", handle = "character"
  ),
  function(obj, from, to, handle) .decrease_key(obj, from, to, handle)
)


#' @rdname decrease_key-methods
setMethod(
  "decrease_key",
  signature = signature(
    obj = "heap", from = "vector", to = "vector", handle = "missing"
  ),
  function(obj, from, to) .decrease_key(obj, from, to, NULL)
)


#' @rdname peek-methods
setMethod("peek", "heap", .peek.heap)


#' @rdname pop-methods
setMethod("pop", "heap", .pop.heap)


#' @noRd
setMethod("show", "heap", .show.heap)


#' @rdname size-methods
setMethod("size", "heap", .size.heap)


#' @rdname values-methods
setMethod("values", "heap", .heap_values)


#' @rdname clear-methods
setMethod("clear", "heap", .clear.heap)

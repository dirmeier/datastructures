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


#' @title Binomial heap class
#'
#' @exportClass binomial_heap
#' @name binomial_heap-class
#' @rdname binomial_heap-class
#'
#' @description Implementation of a binomial heap data structure, i.e. a
#'  priority datastructure with \code{push} and \code{pop} in amortized
#'  \emph{O(log n)}. \code{binomial_heap} wraps a \code{boost::binomial_heap}
#'  using Rcpp modules. The heap consists of nodes with
#'  keys and values where the key determines the priority in the heap.
#'  Also see the \code{\linkS4class{binomial_heap}} class.
#'
#' @slot .heap  \code{C++} object representing a heap
#' @slot .key.class  the class of the keys
#'
#' @seealso  \code{\link{binomial_heap}} for creating a new \code{binomial_heap} object
#'
setClass("binomial_heap", contains = "heap")


#' @title Create a new \code{binomial_heap}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{binomial_heap}} object,
#'  i.e. a tree-like data structure satisfying the \emph{min-heap} property.
#'
#' @param key.class  the primitive class type of the keys
#'
#' @return returns a new \code{binomial_heap} object
#'
#' @examples
#' # creates a binomial_heap<character, SEXP>
#' b_heap <- binomial_heap()
#'
#' # creates a binomial_heap<numeric, SEXP>
#' b_heap <- binomial_heap("numeric")
#'
#' # creates a binomial_heap<character, SEXP>
#' b_heap <- binomial_heap("character")
binomial_heap <- function(
                          key.class = c("character", "numeric", "integer")) {
  key.class <- match.arg(key.class)
  heap <- switch(key.class,
    "character" = methods::new(binomial_heap_s),
    "numeric"   = methods::new(binomial_heap_d),
    "integer"   = methods::new(binomial_heap_i),
    stop("Error defining key class")
  )

  methods::new("binomial_heap",
    .key.class = key.class,
    .heap = heap
  )
}

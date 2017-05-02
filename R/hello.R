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


#' Do something
#'
#' @export
#'
#' @param X some object
#'
#' @examples
#'  f(matrix(rnorm(100), 10))
f <- function(X)
{
    UseMethod("f")
}

#' @export
#' @method f matrix
f.matrix <- function(X)
{
    return("welcome to R-bones\n")
}

#' Do another thing
#'
#' @description TODO
#'
#' @export
#' @docType methods
#' @rdname g-methods
#'
#' @param X  some object
#' @param Y some other object
setGeneric(
  "g",
  function(X, Y)
  {
    standardGeneric("g")
  },
  package="datastructures"
)

#' @rdname g-methods
#' @aliases g,matrix-method
#' @import data.table
#' @importFrom dplyr select filter
setMethod(
  "g",
  signature=signature(X="matrix"),
  function(X, Y)
  {
    return("this yeoman-generator is awesome\n")
  }
)

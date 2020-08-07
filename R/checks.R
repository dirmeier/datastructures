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


#' @noRd
.check.key.value.classes <- function(obj, x, y) {
  .check.key.class(obj, x)
  .check.value.class(obj, y)
}


#' @noRd
.check.value.class <- function(obj, y, vc = obj@.value.class) {
  if (any(is.null(y))) stop("y cannot be NULL")
  if (is.list(y)) {
    if (any(lapply(y, class) != vc)) stop(paste("class(y) is not", vc))
  }
  else {
    if (class(y) != vc) stop(paste("class(y) is not", vc))
  }
}


#' @noRd
.check.key.class <- function(obj, x, kc = obj@.key.class) {
  if (any(is.null(x))) stop("x/y cannot be NULL")
  if (any(is.na(x))) stop("x cannot be NA")
  if (is.list(x)) {
    if (any(lapply(x, class) != kc)) stop(paste("class(x) is not", kc))
  }
  else {
    if (class(x) != kc) stop(paste("class(x) is not", kc))
  }
}

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


#' @title Pop a single element from an object
#'
#' @description Remove and return the first element from a data structure that
#'  has a priority, such as a \code{heap} or \code{deque}.
#'
#' @export
#' @docType methods
#' @rdname pop-methods
#'
#' @param obj  the object to pop an element from

#' @return  returns the first element from \code{obj} as list
#'
#' @examples
#'
#'  # pops from a queue
#'  q <- queue()
#'  q <- insert(q, list(environment(), data.frame(a=1)))
#'  pop(q)
#'
#'  # pops from a stack
#'  s <- stack()
#'  s <- insert(s, list(environment(), data.frame(a=1)))
#'  pop(s)
#'
#'  # pops from a fibonacci heap
#'  b_heap <- binomial_heap()
#'  b_heap <- insert(b_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
#'  pop(b_heap)
#'
setGeneric(
    "pop",
    function(obj)
    {
        standardGeneric("pop")
    },
    package = "datastructures"
)

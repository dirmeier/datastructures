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


#' @title Queue class
#'
#' @export
#' @name queue-class
#' @rdname queue-class
#'
#' @description Implementation of a queue data structure, i.e. a list
#'  implementation with FIFO principle. \code{queue} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}. See \code{\linkS4class{stack}} for a class using
#'  the LIFO principle.
#'
#' @slot .deque  \code{C++} object representing a deque
#'
setClass("queue", contains = "deque")


#' @title Create a new \code{queue}
#'
#' @export
#' @importFrom methods new
#'
#' @description Instantiates a new \code{\linkS4class{queue}} object,
#'  i.e. a list implementation with FIFO principle.
#'
#' @return returns a new \code{queue} object
#'
#' @examples
#'
#'  # returns a new queue<SEXP>
#'  q <- queue()
queue <- function()
{
    queue <- methods::new(queue_sexp)
    methods::new("queue", .deque = queue)
}

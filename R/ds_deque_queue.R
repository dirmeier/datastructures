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


#' @include ds_deque.R
NULL


#' @title Queue class
#'
#' @export
#' @name queue-class
#' @rdname queue-class
#'
#' @description Implementation of a queue datastructure, i.e. a list
#'  implementation with FIFO principle. \code{queue} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}. See \code{\linkS4class{stack}} for a class using
#'  the LIFO principle.
#'
#' @slot .deque  \code{C++} object representing a deque
#' @slot .key.class  the class of the keys
#'
#' @examples
#' q <- methods::new("queue", "numeric")
#' q <- methods::new("queue", "character")
#' q <- methods::new("queue", "integer")
#'
setClass("queue", contains="deque")

#' @noRd
#' @importFrom methods new callNextMethod
setMethod(
    "initialize",
    "queue",
    function(.Object,
             key.class   = c("character", "numeric", "integer"))
    {
        .Object <- methods::callNextMethod(.Object, key.class   = key.class)
        key.class <- .Object@.key.class

        if (key.class == "character")
        {
            queue <- methods::new(queue_s)
        }
        else if (key.class == "numeric")
        {
            queue <- methods::new(queue_d)
        }
        else
        {
            queue <- methods::new(queue_i)
        }

        .Object@.deque <- queue
        .Object
    }
)

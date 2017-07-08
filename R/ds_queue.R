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
#' @description Implementation of a queue datastructure, i.e. a list
#'  implementation with FIFO principle. \code{queue} uses a \code{std::deque}
#'  as default container, so inserting, peeking and popping functions require
#'  constant \emph{O(1)}.
#'
#' @slot .data  object that bundles all important heap related objects
setClass(
    "queue",
    slots = list(.data = "list"),
    prototype = prototype(.data = NULL)
)

#' @noRd
#' @importFrom methods new
setMethod(
    "initialize",
    "queue",
    function(.Object,
             key.class   = c("character", "numeric", "integer"))
    {
        key.class   <- match.arg(key.class)
        .Object@.data <- list(key.class   = key.class)

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

        .Object@.data$list <- queue
        .Object
    }
)

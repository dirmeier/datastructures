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


setMethod(
    "show",
    "fibonacci_heap",
    function(object)
    {
        cat(paste0("An object of class fibonacci_heap<",
                   object@.data$key.class, ",",
                   object@.data$value.class, ">\n\n"))
        li <- peek(object)
        li <- ifelse(is.null(li), "NULL", li)
        li.names <- names(li)
        li.names <- ifelse(is.null(li.names), "NULL", li.names)
        cat(paste0(li.names, " -> ", li , "\n"))
    }
)

setMethod(
    "show",
    "hashmap",
    function(object)
    {
        cat(paste0("An object of class hashmap<",
                   object@.data$key.class, ",",
                   object@.data$value.class, ">\n\n"))
        li <- head(object)
        for (l in names(li))
        {
            e <- li[[l]]
            cat(paste0(l, " -> ",ifelse(is.null(e), "NULL", e), "\n"))
        }
    }
)

setMethod(
    "show",
    "stack",
    function(object)
    {
        cat(paste0("An object of class stack<",
                   object@.data$key.class, ">\n\n"))
        li <- peek(object)
        cat(paste0("First element -> ", ifelse(is.null(li), "NULL", li), "\n"))
    }
)

setMethod(
    "show",
    "queue",
    function(object)
    {
        cat(paste0("An object of class queue<",
                   object@.data$key.class, ">\n\n"))
        li <- peek(object)
        cat(paste0("First element -> ", ifelse(is.null(li), "NULL", li), "\n"))
    }
)

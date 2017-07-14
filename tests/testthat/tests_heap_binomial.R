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


context("binomial heap")

test_that("creates correct class", {
    bheap <- binomial_heap("numeric", "numeric")
    expect_equal(class(bheap@.heap)[1], "Rcpp_binomial_heap_dd")
})

test_that("binomial heap insert throws when inserting false values", {
    bheap <- binomial_heap("numeric", "numeric")
    expect_error(insert(bheap, c("s", "s"), c(4, 5)))
})

test_that("binomial heap peek shows correct value", {
    bheap <- binomial_heap("numeric", "numeric")
    r <- stats::rnorm(5)
    bheap <- insert(bheap, r, r)
    expect_equal(unlist(unname(peek(bheap))), min(r), tolerance=0.01)
})

test_that("binomial size is correct", {
    bheap <- binomial_heap("character", "integer")
    r <- paste0("k", 1:5)
    bheap <- insert(bheap, r, 1:5)
    expect_equal(size(bheap), 5)
})


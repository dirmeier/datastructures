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


testthat::test_that("binomial_heap is s4", {
    binomial_heap <- binomial_heap("character", "numeric")
    testthat::expect_s4_class(binomial_heap, "binomial_heap")
})

testthat::test_that("binomial_heap is s4", {
    bheap <- new("binomial_heap", "numeric", "character")
    testthat::expect_s4_class(bheap, "binomial_heap")
})

testthat::test_that("creates correct class", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    testthat::expect_equal(class(bheap@.heap)[1], "Rcpp_binomial_heap_dd")
})

testthat::test_that("binomial heap insert throws when inserting false values", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    testthat::expect_error(insert(bheap, c("s", "s"), c(4, 5)))
})

testthat::test_that("binomial heap peek shows correct value", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    r <- rnorm(5)
    bheap <- insert(bheap, r, r)
    testthat::expect_equal(unlist(unname(peek(bheap))), min(r), tolerance=0.01)
})

testthat::test_that("binomial size does not throw", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    r <- rnorm(5)
    bheap <- insert(bheap, r, r)
    testthat::expect_silent(size(bheap))
})

testthat::test_that("binomial heap pop does not throw", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    r <- rnorm(5)
    bheap <- insert(bheap, r, r)
    testthat::expect_silent(pop(bheap))
})

testthat::test_that("binomial heap does not throw", {
    bheap <- new("binomial_heap", "numeric", "numeric")
    r <- rnorm(5)
    bheap <- insert(bheap, r, r)
    invisible(pop(bheap))
    testthat::expect_silent(size(bheap))
})

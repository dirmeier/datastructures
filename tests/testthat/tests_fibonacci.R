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


context("fibonacci")


fheap <- new("fibonacci_heap", "numeric", "numeric")


testthat::test_that("creates correct class", {
    testthat::expect_s4_class(fheap@.data$heap, "Rcpp_fibonacci_heap_dd")
})

testthat::test_that("fibonacci heap insert throws when inserting false values", {
    testthat::expect_error(insert(fheap, c("s", "s"), c(4, 5)))
})

testthat::test_that("fibonacci heap peek shows correct value", {
    fheap <- new("fibonacci_heap", "numeric", "numeric")
    r <- rnorm(5)
    fheap <- insert(fheap, r, r)
    testthat::expect_equal(unlist(unname(peek(fheap))), min(r), tolerance=0.01)
})

testthat::test_that("fibonacci heap size is correct", {
    fheap <- new("fibonacci_heap", "numeric", "numeric")
    r <- rnorm(5)
    fheap <- insert(fheap, r, r)
    testthat::expect_equal(size(fheap), 5)
})

testthat::test_that("fibonacci heap size does not change upon peeking", {
    r <- rnorm(5)
    fheap <- insert(fheap, r, r)
    peek(fheap)
    testthat::expect_equal(size(fheap), 5)
})

testthat::test_that("fibonacci heap pop shows correct value", {
    fheap <- new("fibonacci_heap", "numeric", "numeric")
    r <- rnorm(5)
    fheap <- insert(fheap, r, r)
    testthat::expect_equal(unlist(unname(pop(fheap))), min(r), tolerance=0.01)
})

testthat::test_that("fibonacci heap size changes upon popping", {
    fheap <- new("fibonacci_heap", "numeric", "numeric")
    r <- rnorm(5)
    fheap <- insert(fheap, r, r)
    invisible(pop(fheap))
    testthat::expect_equal(size(fheap), 5 - 1)
})

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


library(datastructures)
context("fibonacci heap")

testthat::test_that("fibonacci_heap is s4", {
    fibonacci_heap <- datastructures::fibonacci_heap("integer", "numeric")
    testthat::expect_s4_class(fibonacci_heap, "fibonacci_heap")
})


testthat::test_that("fibonacci_heap is s4", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    testthat::expect_s4_class(fheap, "fibonacci_heap")
})

testthat::test_that("creates correct class", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    testthat::expect_equal(class(fheap@.heap)[1], "Rcpp_fibonacci_heap_dd")
})

testthat::test_that("fibonacci heap peek shows correct value", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fheap, r, r)
    testthat::expect_equal(unlist(unname(datastructures::peek(fheap))),
                           min(r), tolerance=0.01)
})

testthat::test_that("fibonacci heap size is correct", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fheap, r, r)
    testthat::expect_equal(datastructures::size(fheap), 5)
})

testthat::test_that("fibonacci heap peek dows not throw", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fheap, r, r)
    peek(fheap)
    testthat::expect_silent(datastructures::size(fheap))
})

testthat::test_that("fibonacci heap pop does not throw", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fheap, r, r)
    testthat::expect_silent(datastructures::pop(fheap))
})

testthat::test_that("fibonacci heap size does not throw", {
    fheap <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fheap, r, r)
    invisible(datastructures::pop(fheap))
    testthat::expect_silent(datastructures::size(fheap))
})

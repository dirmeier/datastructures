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


context("fibonacci heap")

testthat::test_that("fibonacci_heap is s4", {
    fh <- datastructures::fibonacci_heap("integer", "numeric")
    testthat::expect_s4_class(fh, "fibonacci_heap")
})

testthat::test_that("fibonacci_heap is s4", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    testthat::expect_s4_class(fh, "fibonacci_heap")
})

testthat::test_that("creates correct class", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    testthat::expect_equal(class(fh@.heap)[1], "Rcpp_fibonacci_heap_dd")
})

testthat::test_that("fibonacci heap peek shows correct value", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fheap <- datastructures::insert(fh, r, r)
    testthat::expect_equal(unlist(unname(datastructures::peek(fh))),
                           min(r), tolerance=0.01)
})

testthat::test_that("fibonacci heap size is correct", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fh <- datastructures::insert(fh, r, r)
    testthat::expect_silent(datastructures::size(fh))
})

testthat::test_that("fibonacci heap peek dows not throw", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fh <- datastructures::insert(fh, r, r)
    peek(fh)
    testthat::expect_silent(datastructures::size(fh))
})

testthat::test_that("fibonacci heap pop does not throw", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fh <- datastructures::insert(fh, r, r)
    testthat::expect_silent(datastructures::pop(fh))
})

testthat::test_that("fibonacci heap size does not throw", {
    fh <- methods::new("fibonacci_heap", "numeric", "numeric")
    r <- stats::rnorm(5)
    fh <- datastructures::insert(fh, r, r)
    invisible(datastructures::pop(fh))
    testthat::expect_silent(datastructures::size(fh))
})

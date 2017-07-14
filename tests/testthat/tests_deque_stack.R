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


context("stack")

testthat::test_that("stack is s4", {
    s <- datastructures::stack("character")
    testthat::expect_s4_class(s, "stack")
})

testthat::test_that("stack is s4", {
    s <- methods::new("stack", "integer")
    testthat::expect_s4_class(s, "stack")
})

testthat::test_that("creates correct class", {
    s <- methods::new("stack", "numeric")
    testthat::expect_equal(class(s@.deque)[1], "Rcpp_stack_d")
})

testthat::test_that("stack insert throws when inserting false values", {
    s <- methods::new("stack", "numeric")
    testthat::expect_error(datastructures::insert(s, c("s", "s")))
})

testthat::test_that("stack pops first element", {
    s <- methods::new("stack", "numeric")
    r <- stats::rnorm(5)
    s <- datastructures::insert(s, r)
    testthat::expect_equal(datastructures::pop(s), r[5], tolerance=0.001)
})

testthat::test_that("stack peeks first element", {
    s <- methods::new("stack", "numeric")
    r <- stats::rnorm(5)
    s <- datastructures::insert(s, r)
    testthat::expect_equal(datastructures::peek(s), r[5], tolerance=0.001)
})

testthat::test_that("stack size does not throw", {
    s <- methods::new("stack", "numeric")
    r <- stats::rnorm(5)
    s <- datastructures::insert(s, r)
    invisible(datastructures::pop(s))
    testthat::expect_silent(datastructures::size(s))
})

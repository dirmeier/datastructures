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

stack <- new("stack", "numeric")

testthat::test_that("stack is s4", {
    testthat::expect_s4_class(stack, "stack")
})

testthat::test_that("creates correct class", {
    testthat::expect_equal(class(stack@.data$list)[1], "Rcpp_stack_d")
})

testthat::test_that("stack insert throws when inserting false values", {
    testthat::expect_error(insert(stack, c("s", "s")))
})

testthat::test_that("stack pops first element", {
    stack <- new("stack", "numeric")
    r <- rnorm(5)
    stack <- insert(stack, r)
    testthat::expect_equal(pop(queue), r[5], tolerance=0.001)
})

testthat::test_that("queue peeks first element", {
    queue <- new("queue", "numeric")
    r <- rnorm(5)
    queue <- insert(queue, r)
    testthat::expect_equal(peek(stack), r[5], tolerance=0.001)
})

testthat::test_that("queue pop reduces size", {
    queue <- new("queue", "numeric")
    r <- rnorm(5)
    queue <- insert(queue, r)
    invisible(pop(queue))
    testthat::expect_equal(size(queue), 5 - 1)
})


testthat::test_that("queue peek does not reduce size", {
    queue <- new("queue", "numeric")
    r <- rnorm(5)
    queue <- insert(queue, r)
    invisible(peek(queue))
    testthat::expect_equal(size(queue), 5)
})


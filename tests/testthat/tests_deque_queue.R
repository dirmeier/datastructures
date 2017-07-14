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


context("queue")


testthat::test_that("queue is s4", {
    queue <- queue("character")
    testthat::expect_s4_class(queue, "queue")
})


testthat::test_that("queue is s4", {
    queue <- new("queue", "integer")
    testthat::expect_s4_class(queue, "queue")
})

testthat::test_that("creates correct class", {
    queue <- new("queue", "numeric")
    testthat::expect_equal(class(queue@.deque)[1], "Rcpp_queue_d")
})

testthat::test_that("queue insert throws when inserting false values", {
    queue <- new("queue", "numeric")
    testthat::expect_error(insert(queue, c("s", "s")))
})

testthat::test_that("queue pops first element", {
    queue <- new("queue", "numeric")
    r <- rnorm(5)
    queue <- insert(queue, r)
    testthat::expect_equal(pop(queue), r[1], tolerance=0.001)
})

testthat::test_that("queue peeks first element", {
    queue <- new("queue", "numeric")
    r <- rnorm(5)
    queue <- insert(queue, r)
    testthat::expect_equal(peek(queue), r[1], tolerance=0.001)
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

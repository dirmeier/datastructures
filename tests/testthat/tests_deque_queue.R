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
    q <- datastructures::queue("character")
    testthat::expect_s4_class(q, "queue")
})


testthat::test_that("queue is s4", {
    q <- methods::new("queue", "integer")
    testthat::expect_s4_class(q, "queue")
})

testthat::test_that("creates correct class", {
    q <- methods::new("queue", "numeric")
    testthat::expect_equal(class(q@.deque)[1], "Rcpp_queue_d")
})

testthat::test_that("queue insert throws when inserting false values", {
    q <- methods::new("queue", "numeric")
    testthat::expect_error(datastructures::insert(q, c("s", "s")))
})

testthat::test_that("queue pops first element", {
    q <- methods::new("queue", "numeric")
    r <- q::rnorm(5)
    queue <- datastructures::insert(q, r)
    testthat::expect_equal(pop(q), r[1], tolerance=0.001)
})

testthat::test_that("queue peeks first element", {
    q <- methods::new("queue", "numeric")
    r <- stats::rnorm(5)
    q <- datastructures::insert(q, r)
    testthat::expect_equal(peek(q), r[1], tolerance=0.001)
})

testthat::test_that("queue pop does not throw", {
    q <- methods::new("queue", "numeric")
    r <- stats::rnorm(5)
    q <- datastructures::insert(q, r)
    testthat::expect_silent(pop(q))
})

testthat::test_that("queue peek does not throw", {
    q <- methods::new("queue", "numeric")
    r <- stats::rnorm(5)
    q <- datastructures::insert(q, r)
    testthat::expect_silent(peek(q))
})

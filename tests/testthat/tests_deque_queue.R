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

test_that("creates correct class", {
    q <- queue("numeric")
    expect_equal(class(q@.deque)[1], "Rcpp_queue_d")
})

test_that("queue insert throws when inserting false values", {
    q <- queue("numeric")
    expect_error(insert(q, c("s", "s")))
})

test_that("queue pops first element", {
    q <- queue("numeric")
    r <- stats::rnorm(5)
    queue <- insert(q, r)
    expect_equal(pop(q), r[1], tolerance=0.1)
})

test_that("queue peeks first element", {
    q <- queue("numeric")
    r <- stats::rnorm(5)
    q <- insert(q, r)
    expect_equal(peek(q), r[1], tolerance=0.1)
})

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


context("deque")

qs <- c(queue, stack)

test_that("abstract class cannot get instantiated", {
    expect_error(methods::new("deque"))
})


test_that("deque shows", {
    for (s in qs) {
        expect_output(show(s("integer")))
    }
})


test_that("queue insert throws when inserting false values", {
    for (s in qs) {
        q <- s("numeric")
        expect_error(insert(q, c("s", "s")))
    }
})


test_that("queue pops first element as list", {
    for (s in qs) {
        q <- s("numeric")
        r <- as.list(stats::rnorm(5))
        queue <- insert(q, r)
        expect_equal(pop(q), r[[1]], tolerance=0.1)
    }
})


test_that("queue peeks first element as list", {
    for (s in qs) {
        q <- s("numeric")
        r <- as.list(stats::rnorm(5))
        q <- insert(q, r)
        expect_equal(peek(q), r[[1]], tolerance=0.1)
    }
})


test_that("queue peeks first element vectorial", {
    for (s in qs) {
        q <- s("numeric")
        r <- stats::rnorm(5)
        q <- insert(q, r)
        expect_equal(peek(q), r, tolerance=0.1)
    }
})

test_that("queue pops first element vectorial", {
    for (s in qs)
    q <- queue("numeric")
    r <- stats::rnorm(5)
    q <- insert(q, r)
    expect_equal(pop(q), r, tolerance=0.1)
})


test_that("queue peeks first element multiple elements in list", {
    for (s in qs) {
    q <- s("numeric")
    r <- stats::rnorm(5)
    q <- insert(q, list(r, 1))
    expect_equal(peek(q), r, tolerance=0.1)
})

test_that("queue pop first element multiple elements in list", {
    for (s in qs) {
        q <- queue("numeric")
        r <- stats::rnorm(5)
        q <- insert(q, list(r, 1))
        expect_equal(pop(q), r, tolerance=0.1)
    }
})


test_that("queue pop first element multiple elements in matrix", {
    for (s in qs) {
        q <- s("numeric")
        r <- matrix(stats::rnorm(6), 2)
        q <- insert(q, r)
        expect_equal(pop(q), r[1, ], tolerance=0.1)
    }
})

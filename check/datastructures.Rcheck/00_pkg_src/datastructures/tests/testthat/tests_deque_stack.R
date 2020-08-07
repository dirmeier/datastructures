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


test_that("stack pops first element as list", {
    s <- stack()
    r <- as.list(stats::rnorm(5))
    s <- insert(s, r)
    expect_equal(pop(s), r[[5]], tolerance=0.1)
})


test_that("stack peeks first elemen as list", {
    s <- stack()
    r <- as.list(stats::rnorm(5))
    s <- insert(s, r)
    expect_equal(peek(s), r[[5]], tolerance=0.1)
})

test_that("stack peeks first element vectorial", {
    q <- stack()
    r <- stats::rnorm(5)
    q <- insert(q, r)
    expect_equal(peek(q), r, tolerance=0.1)
})


test_that("stack pops first element vectorial", {
    q <- stack()
    r <- stats::rnorm(5)
    q <- insert(q, r)
    expect_equal(pop(q), r, tolerance=0.1)
})


test_that("stack peeks first element multiple elements in list", {
    q <- stack()
    r <- stats::rnorm(5)
    q <- insert(q, list(r, 1))
    expect_equal(peek(q), 1, tolerance=0.1)
})


test_that("stack pop first element multiple elements in list", {
    q <- stack()
    r <- stats::rnorm(5)
    q <- insert(q, list(r, 1))
    expect_equal(pop(q), 1, tolerance=0.1)
})


test_that("stack pop first element multiple elements in list", {
    q <- stack()
    r <- stats::rnorm(5)
    q <- insert(q, list(r, 1))
    expect_equal(pop(q), 1, tolerance=0.1)
})


test_that("stack can handle different values", {
    q <- stack()
    q <- insert(q, list(2, 1))
    q <- insert(q, data.frame(A=1))
    q <- insert(q, rnorm(10))
    expect_equal(length(pop(q)), 10)
    expect_true(is.data.frame(pop(q)))
    expect_equal(pop(q), 1)
    expect_equal(pop(q), 2)
})

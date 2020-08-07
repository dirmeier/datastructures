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


test_that("queue pops first element as list", {
  q <- queue()
  r <- as.list(stats::rnorm(5))
  queue <- insert(q, r)
  expect_equal(pop(q), r[[1]], tolerance = 0.1)
})


test_that("queue peeks first element as list", {
  q <- queue()
  r <- as.list(stats::rnorm(5))
  q <- insert(q, r)
  expect_equal(peek(q), r[[1]], tolerance = 0.1)
})


test_that("queue peeks first element vectorial", {
  q <- queue()
  r <- stats::rnorm(5)
  q <- insert(q, r)
  expect_equal(peek(q), r, tolerance = 0.1)
})


test_that("queue pops first element vectorial", {
  q <- queue()
  r <- stats::rnorm(5)
  q <- insert(q, r)
  expect_equal(pop(q), r, tolerance = 0.1)
})


test_that("queue peeks first element multiple elements in list", {
  q <- queue()
  r <- stats::rnorm(5)
  q <- insert(q, list(r, 1))
  expect_equal(peek(q), r, tolerance = 0.1)
})


test_that("queue pop first element multiple elements in list", {
  q <- queue()
  r <- stats::rnorm(5)
  q <- insert(q, list(r, 1))
  expect_equal(pop(q), r, tolerance = 0.1)
})


test_that("queue can handle different values", {
  q <- queue()
  q <- insert(q, list(2, 1))
  q <- insert(q, data.frame(A = 1))
  q <- insert(q, rnorm(10))
  expect_equal(pop(q), 2)
  expect_equal(pop(q), 1)
  expect_true(is.data.frame(pop(q)))
  expect_equal(length(pop(q)), 10)
})

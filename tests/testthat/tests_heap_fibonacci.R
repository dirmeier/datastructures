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

fh <- fibonacci_heap("numeric", "numeric")
r <- stats::rnorm(5)
fh <- insert(fh, r, r)

test_that("creates correct class", {
    expect_equal(class(fh@.heap)[1], "Rcpp_fibonacci_heap_dd")
})

test_that("fibonacci heap insert throws when inserting false values", {
    expect_error(insert(fh, c("s", "s"), c(4, 5)))
})

test_that("fibonacci heap peek shows correct value", {
    expect_equal(unlist(unname(peek(fh))), min(r), tolerance=0.01)
})

test_that("fibonacci heap size is correct", {
    expect_equal(size(fh), 5)
})

test_that("fibonacci heap pop first element multiple elements in matrix", {
    bheap <- fibonacci_heap("numeric", "numeric")
    r <- seq(0, 1, by=.1)
    m <- matrix(rnorm(length(r) * 2), length(r))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(pop(bheap))), m[1, ])
})


test_that("fibonacci heap peek first element multiple elements in matrix", {
    bheap <- fibonacci_heap("numeric", "numeric")
    r <- seq(0, 1, by=.1)
    m <- matrix(rnorm(length(r) * 2), length(r))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1, ])
})


test_that("fibonacci heap pop first element multiple elements in list", {
    bheap <- fibonacci_heap("character", "numeric")
    r <- letters[1:2]
    m <- list(1, 2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(pop(bheap))), m[[1]])
})


test_that("fibonacci heap peek first element multiple elements in list", {
    bheap <- fibonacci_heap("character", "numeric")
    r <- letters[1:2]
    m <- list(1, 2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[[1]])
})


test_that("fibonacci heap peek first element multiple elements vector", {
    bheap <- fibonacci_heap("character", "numeric")
    r <- letters[1:2]
    m <- rnorm(2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1])
})


test_that("fibonacci heap peek first element multiple elements vector", {
    bheap <- fibonacci_heap("character", "numeric")
    r <- letters[1:2]
    m <- rnorm(2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1])
})


test_that("fibo heap peek first element multiple elements as list", {
    bheap <- fibonacci_heap("character", "numeric")
    r <- letters[1:2]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[[1]])
})

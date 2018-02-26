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


context("binomial/fibonacci heap")

hs <- c(binomial_heap, fibonacci_heap)


test_that("heap insert throws when inserting false values",
{
  for (h in hs)
  {
    bheap <- h("numeric", "numeric")
    r <- stats::rnorm(5)
    expect_error(insert(bheap, c("s", "s"), c(4, 5)))
  }
})


test_that("heap peek shows correct value",
{
  for (h in hs)
  {
    bheap <- h("numeric", "numeric")
    r <- stats::rnorm(5)
    bheap <- insert(bheap, r, r)
    expect_equal(unlist(unname(peek(bheap))), min(r), tolerance=0.01)
  }
})


test_that("heap size is correct",
{
  for (h in hs)
  {
    bheap <- h("numeric", "numeric")
    r <- stats::rnorm(5)
    bheap <- insert(bheap, r, r)
    expect_equal(size(bheap), 5)
  }
})


test_that("heap pop first element multiple elements in matrix",
{
  for (h in hs)
  {
    bheap <- h("numeric", "numeric")
    r <- seq(0, 1, by=.1)
    m <- matrix(rnorm(length(r) * 2), length(r))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(pop(bheap))), m[1, ])
  }
})


test_that("heap peek first element multiple elements in matrix",
{
  for (h in hs)
  {
    bheap <- h("numeric", "numeric")
    r <- seq(0, 1, by=.1)
    m <- matrix(rnorm(length(r) * 2), length(r))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1, ])
  }
})


test_that("heap pop first element multiple elements in list",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[1:2]
    m <- list(1, 2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(pop(bheap))), m [[1]])
  }
})


test_that("heap peek first element multiple elements in list",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[1:2]
    m <- list(1, 2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[[1]])
  }
})


test_that("heap peek first element multiple elements vector",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[1:2]
    m <- rnorm(2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1])
  }
})


test_that("heap peek first element multiple elements vector",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[1:2]
    m <- rnorm(2)
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[1])
  }
})


test_that("heap peek first element multiple elements as list",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[1:2]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    expect_equal(unname(unlist(peek(bheap))), m[[1]])
  }
})


test_that("heap warns for non key element at decrease",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(1, 1)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    expect_error(decrease_key(heap, letters[3], letters[2]))
  }
})


test_that("heap stops for double key element at decrease",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(1, 1)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    expect_error(decrease_key(bheap, letters[1]))
  }
})


test_that("heap returns correct handles for two keys",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(1, 1)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    hand <- handle(bheap, letters[1])
    expect_equal(length(hand), 2)
  }
})


test_that("heaps throws from Rcpp when incorrect decrease vector lengths",
{
  for (s in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(3, 2)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    hand <- handle(bheap, letters[3])
    expect_error(decrease_key(bheap, from=letters[c(3, 2)], to="a"))
  }
})


test_that("heap decrease key works with handles",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(3, 3)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    hand <- handle(bheap, letters[3])
    decrease_key(bheap, from=letters[3], to="a", handle=hand[[1]]$handle)
    expect_equal(names(pop(bheap)), "a")
  }
})


test_that("heap computes decrease key correctly",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(2, 3)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    decrease_key(bheap, letters[3], letters[1])
    expect_equal(names(pop(bheap)), "a")
  }
})


test_that("heap returns correct handles for two keys after decrease",
{
  for (h in hs)
  {
    bheap <- h("character", "numeric")
    r <- letters[c(2, 3)]
    m <- as.list(rnorm(2))
    bheap <- insert(bheap, r, m)
    decrease_key(bheap, letters[3], letters[1])
    expect_equal(length(handle(bheap, letters[1])), 1)
    expect_equal(length(handle(bheap, letters[2])), 1)
    expect_equal(length(handle(bheap, letters[3])), 0)
  }
})


test_that("heap returns correct handles for value",
{
  for (h in hs)
  {
    bheap <- h("integer", "integer")
    r <- 1:3
    m <- list(1:3, 1:3, 1:3)
    bheap <- insert(bheap, r, m)
    h <- handle(bheap, value=1:3)
    expect_equal(length(h), 3)
    for (i in seq(h))
    {
      expect_true(h[[i]]$key %in% 1:3)
    }
  }
})

test_that("heap decrease key by value works",
{
  for (h in hs)
  {
    bheap <- h("integer", "integer")
    r <- 1:3
    m <- list(1:4, 1:5, 1:6)
    bheap <- insert(bheap, r, m)
    h <- handle(bheap, value=1:5)
    decrease_key(bheap, from=h[[1]]$key, to=0L)
    expect_equal(unlist(unname(peek(bheap))), 1:5)
  }
})

test_that("heap decrease key by value works for same values",
{
  for (h in hs)
  {
    bheap <- h("integer", "integer")
    r <- c(1L, 1L, 3L)
    m <- list(1:3, 1:3, 1:6)
    bheap <- insert(bheap, r, m)
    h <- handle(bheap, value=1:3)
    decrease_key(bheap, from=h[[1]]$key, to=0L, handle=h[[1]]$handle)
    expect_equal(length(handle(bheap, 1L)),  1)
  }
})

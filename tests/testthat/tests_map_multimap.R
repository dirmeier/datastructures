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


context("multimap")


test_that("multimap can store same keys", {
    h <- multimap("character")
    h <- insert(h, letters, seq(letters))
    h <- insert(h, letters, seq(letters))
    expect_equal(length(get(h, "a")), 2)
    expect_equal(unlist(get(h, "a")), c(1L, 1L))
})

test_that("multimap can store same keys", {
    h <- multimap("character")
    h <- insert(h, letters, seq(letters))
    h <- insert(h, letters, seq(letters))
    expect_equal(length(get(h, "a")), 2)
    expect_equal(unlist(get(h, "a")), c(1L, 1L))
})

test_that("multimap remove works", {
    h <- multimap()
    h <- insert(h, letters, letters)
    h <- remove(h, letters[1])
    expect_true(size(h) == 25)
    expect_error(h[letters[1]])
})

test_that("multimap does not overwrite", {
    h <- multimap()
    h <- insert(h, letters[1], "a")
    h <- insert(h, letters[1], "b")
    h <- insert(h, letters[1], "a")
    expect_equal(size(h), 3)
    expect_equal(length(h[letters[1]]), 3)
})

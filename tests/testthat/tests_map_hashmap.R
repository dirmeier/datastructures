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

library(datastructures)
context("hashmap")

testthat::test_that("hashmap is s4", {
    hashmap <- hashmap("integer", "character")
    testthat::expect_s4_class(hashmap, "hashmap")
})

testthat::test_that("hashmap is s4", {
    hashmap <- new("hashmap", "numeric", "numeric")
    testthat::expect_s4_class(hashmap, "hashmap")
})

testthat::test_that("creates correct class", {
    hashmap <- new("hashmap", "numeric", "numeric")
    testthat::expect_equal("Rcpp_hashmap_dd", class(hashmap@.map)[1])
})

testthat::test_that("hashmap insert throws when inserting false values", {
    hashmap <- new("hashmap", "numeric", "numeric")
    testthat::expect_error(insert(hashmap, c("s", "s"), c(4, 5)))
})

testthat::test_that("hashmap get throws when getting false values", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap <- insert(hashmap, c(1, 2), c(4, 5))
    testthat::expect_error(get(hashmap, "s"))
})

testthat::test_that("hashmap insert/get methods work", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap <- insert(hashmap, c(1, 2), c(4, 5))
    testthat::expect_equal(get(hashmap, 1), 4)
})

testthat::test_that("hashmap insert/get methods work multiple values", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap <- insert(hashmap, c(1, 2), c(4, 5))
    testthat::expect_equal(get(hashmap, c(1, 2)), c(4, 5))
})

testthat::test_that("hashmap operators work", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap[c(8, 9)] <- c(3, 4)
    testthat::expect_equal(hashmap[8], 3)
})

testthat::test_that("hashmap operators work multiple values", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap[c(8, 9)] <- c(3, 4)
    testthat::expect_equal(hashmap[c(8, 9)], c(3, 4))
})

testthat::test_that("hashmap has the correct size", {
    hashmap <- new("hashmap", "numeric", "numeric")
    hashmap[c(8, 9)] <- c(3, 4)
    testthat::expect_equal(size(hashmap), 2)
})

testthat::test_that("hashmap returns head", {
    hashmap <- new("hashmap", "numeric", "integer")
    hashmap <- insert(hashmap, c(1, 2),  3:4)
    testthat::expect_silent(head(hashmap)[[1]])
})

testthat::test_that("hashmap returns keys", {
    hashmap <- new("hashmap", "numeric", "integer")
    hashmap <- insert(hashmap, c(1, 2),  3:4)
    testthat::expect_true(keys(hashmap)[1] %in% 1:2)
})

testthat::test_that("hashmap returns values", {
    hashmap <- new("hashmap", "numeric", "integer")
    hashmap <- insert(hashmap, c(1, 2),  3:4)
    testthat::expect_true(values(hashmap)[1] %in% 3:4)
})




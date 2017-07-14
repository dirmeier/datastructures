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


context("bimap")

bimap <- new("bimap", "numeric", "numeric")

testthat::test_that("bimap is s4", {
    bimap <- bimap("integer", "integer")
    testthat::expect_s4_class(bimap, "bimap")
})

testthat::test_that("bimap is s4", {
    testthat::expect_s4_class(bimap, "bimap")
})

testthat::test_that("creates correct class", {
    testthat::expect_equal("Rcpp_bimap_dd", class(bimap@.map)[1])
})

testthat::test_that("bimap insert throws when inserting false values", {
    testthat::expect_error(insert(bimap, c("s", "s"), c(4, 5)))
})

testthat::test_that("bimap get throws when getting false values", {
    bimap <- insert(bimap, c(1, 2), c(4, 5))
    testthat::expect_error(get(bimap, "s"))
})

testthat::test_that("bimap insert/get methods work", {
    bimap <- insert(bimap, c(1, 2), c(4, 5))
    testthat::expect_equal(get(bimap, 1), 4)
})

testthat::test_that("bimap insert/get methods work with which argument", {
    bimap <- insert(bimap, c(1, 2), c(4, 5))
    testthat::expect_equal(get(bimap, 1, "values"), 4)
})

testthat::test_that("bimap insert/get methods work with which argument", {
    bimap <- insert(bimap, c(1, 2), c(4, 5))
    testthat::expect_equal(get(bimap, 4, "keys"), 1)
})

testthat::test_that("bimap insert/get methods work multiple values", {
    bimap <- new("bimap", "character", "character")
    bimap <- insert(bimap, paste0("k", 1:2), paste0("v", 1:2))
    testthat::expect_equal(get(bimap, paste0("k", 1:2)), paste0("v", 1:2))
})

testthat::test_that("bimap has the correct size", {
    bimap <- new("bimap", "numeric", "integer")
    bimap <- insert(bimap, c(1, 2),  3:4)
    testthat::expect_equal(size(bimap), 2)
})

testthat::test_that("bimap get keys works", {
    bimap <- new("bimap", "numeric", "integer")
    bimap <- insert(bimap, c(1, 2),  3:4)
    testthat::expect_equal(get(bimap, 3L, "keys"), 1)
})

testthat::test_that("bimap returns head", {
    bimap <- new("bimap", "numeric", "integer")
    bimap <- insert(bimap, c(1, 2),  3:4)
    testthat::expect_true(head(bimap)[[1]] %in% 3:4)
})

testthat::test_that("bimap returns keys", {
    bimap <- new("bimap", "numeric", "integer")
    bimap <- insert(bimap, c(1, 2),  3:4)
    testthat::expect_true(keys(bimap)[1] %in% 1:2)
})

testthat::test_that("bimap returns values", {
    bimap <- new("bimap", "numeric", "integer")
    bimap <- insert(bimap, c(1, 2),  3:4)
    testthat::expect_true(values(bimap)[1] %in% 3:4)
})


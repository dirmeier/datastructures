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

testthat::test_that("bimap is s4", {
    b <- datastructures::bimap("integer", "integer")
    testthat::expect_s4_class(b, "bimap")
})

testthat::test_that("bimap is s4", {
    b <- methods::new("bimap", "numeric", "numeric")
    testthat::expect_s4_class(b, "bimap")
})

testthat::test_that("creates correct class", {
    b <- methods::new("bimap", "numeric", "numeric")
    testthat::expect_equal("Rcpp_bimap_dd", class(b@.map)[1])
})

testthat::test_that("bimap insert throws when inserting false values", {
    testthat::expect_error(datastructures::insert(b, c("s", "s"), c(4, 5)))
})

testthat::test_that("bimap get throws when getting false values", {
    b <- methods::new("bimap", "numeric", "numeric")
    b <- datastructures::insert(b, c(1, 2), c(4, 5))
    testthat::expect_error(datastructures::get(b, "s"))
})

testthat::test_that("bimap insert/get methods work", {
    b <- methods::new("bimap", "numeric", "numeric")
    b <- datastructures::insert(b, c(1, 2), c(4, 5))
    testthat::expect_equal(datastructures::get(b, 1), 4)
})

testthat::test_that("bimap insert/get methods work with which argument", {
    b <- methods::new("bimap", "numeric", "numeric")
    b <- datastructures::insert(b, c(1, 2), c(4, 5))
    testthat::expect_equal(datastructures::get(b, 1, "values"), 4)
})

testthat::test_that("bimap insert/get methods work with which argument", {
    b <- methods::new("bimap", "numeric", "numeric")
    b <- datastructures::insert(b, c(1, 2), c(4, 5))
    testthat::expect_equal(datastructures::get(b, 4, "keys"), 1)
})

testthat::test_that("bimap insert/get methods work multiple values", {
    b <- methods::new("bimap", "character", "character")
    b <- datastructures::insert(b, paste0("k", 1:2), paste0("v", 1:2))
    testthat::expect_equal(datastructures::get(b, paste0("k", 1:2)),
                           paste0("v", 1:2))
})

testthat::test_that("bimap has the correct size", {
    b <- methods::new("bimap", "numeric", "integer")
    b <- datastructures::insert(b, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::size(b))
})

testthat::test_that("bimap get keys works", {
    b <- methods::new("bimap", "numeric", "integer")
    b <- datastructures::insert(b, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::get(b, 3L, "keys"))
})

testthat::test_that("bimap head does not throw", {
    b <- methods::new("bimap", "numeric", "integer")
    b <- datastructures::insert(b, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::head(b))
})

testthat::test_that("bimap keys does not throw", {
    b <- methods::new("bimap", "numeric", "integer")
    b <- datastructures::insert(b, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::keys(b))
})

testthat::test_that("bimap values does not throw", {
    b <- methods::new("bimap", "numeric", "integer")
    b <- datastructures::insert(b, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::values(b))
})


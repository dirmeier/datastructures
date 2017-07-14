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


context("hashmap")


testthat::test_that("hashmap is s4", {
    testthat::expect_silent(datastructures::hashmap("integer", "character"))
})

testthat::test_that("hashmap is s4", {
    testthat::expect_silent(methods::new("hashmap", "numeric", "numeric"))
})

testthat::test_that("creates correct class", {
    h <- methods::new("hashmap", "numeric", "numeric")
    testthat::expect_equal("Rcpp_hashmap_dd", class(h@.map)[1])
})

testthat::test_that("hashmap insert throws when inserting false values", {
    h <- new("hashmap", "numeric", "numeric")
    testthat::expect_error(datastructures::insert(h, c("s", "s"), c(4, 5)))
})

testthat::test_that("hashmap get throws when getting false values", {
    h <- new("hashmap", "numeric", "numeric")
    h <- insert(h, c(1, 2), c(4, 5))
    testthat::expect_error(datastructures::get(h, "s"))
})

testthat::test_that("hashmap insert/get methods work", {
    h <- methods::new("hashmap", "numeric", "numeric")
    h <- datastructures::insert(h, c(1, 2), c(4, 5))
    testthat::expect_equal(datastructures::get(h, 1), 4)
})

testthat::test_that("hashmap insert/get methods work multiple values", {
    h <- new("hashmap", "numeric", "numeric")
    h <- datastructures::insert(h, c(1, 2), c(4, 5))
    testthat::expect_equal(datastructures::get(h, c(1, 2)), c(4, 5))
})

testthat::test_that("hashmap size does not throw", {
    h <- methods::new("hashmap", "numeric", "numeric")
    h[c(8, 9)] <- c(3, 4)
    testthat::expect_equal(datastructures::size(h), 2)
})

testthat::test_that("hashmap head does not throw", {
    h <- methods::new("hashmap", "numeric", "integer")
    h <- datastructures::insert(h, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::head(h))
})

testthat::test_that("hashmap keys does not throw", {
    h <- methods::new("hashmap", "numeric", "integer")
    h <- datastructures::insert(h, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::keys(h))
})

testthat::test_that("hashmap values does not throw", {
    h <- methods::new("hashmap", "numeric", "integer")
    h <- datastructures::insert(h, c(1, 2),  3:4)
    testthat::expect_silent(datastructures::values(h))
})

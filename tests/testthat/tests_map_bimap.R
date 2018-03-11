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


b <- bimap("numeric", "numeric")
b <- insert(b, c(1, 2), c(4, 5))


test_that("creates correct class", {
    expect_equal("Rcpp_bimap_dd", class(b@.map)[1])
})


test_that("map shows", {
    expect_output(show(b))
})


test_that("bimap insert throws when inserting false values", {
    expect_error(insert(b, c("s", "s"), c(4, 5)))
})


test_that("bimap get throws when getting false values", {
    expect_error(get(b, "s"))
})


test_that("bimap insert/get methods work", {
    expect_equal(get(b, 1), 4)
})


test_that("bimap insert/get methods work with which argument", {
    expect_equal(get(b, 1, "values"), 4)
})


test_that("bimap insert/get methods work with which argument", {
    expect_equal(get(b, 4, "keys"), 1)
})

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

test_that("creates correct class", {
    h <- hashmap("numeric", "numeric")
    expect_equal("Rcpp_hashmap_dd", class(h@.map)[1])
})

test_that("hashmap insert throws when inserting false values", {
    h <- hashmap("numeric", "numeric")
    expect_error(insert(h, c("s", "s"), c(4, 5)))
})

test_that("hashmap get throws when getting false values", {
    h <- hashmap("numeric", "numeric")
    h <- insert(h, c(1, 2), c(4, 5))
    expect_error(get(h, "s"))
})

test_that("hashmap insert/get methods work", {
    h <- hashmap("numeric", "numeric")
    h <- insert(h, c(1, 2), c(4, 5))
    expect_equal(get(h, 1), 4)
})

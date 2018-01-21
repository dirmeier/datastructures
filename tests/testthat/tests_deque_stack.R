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


context("stack")

test_that("creates correct class", {
    s <- stack("numeric")
    expect_equal(class(s@.deque)[1], "Rcpp_stack_d")
})

test_that("stack insert throws when inserting false values", {
    s <- stack("numeric")
    expect_error(insert(s, c("s", "s")))
})

test_that("stack pops first element", {
    s <- stack("numeric")
    r <- as.list(stats::rnorm(5))
    s <- insert(s, r)
    expect_equal(pop(s), r[[5]], tolerance=0.1)
})

test_that("stack peeks first element", {
    s <- stack("numeric")
    r <- as.list(stats::rnorm(5))
    s <- insert(s, r)
    expect_equal(peek(s), r[[5]], tolerance=0.1)
})

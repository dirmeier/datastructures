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


test_that("hashmap replace works", {
    h <- hashmap("integer")
    h <- insert(h, 1L, 3)
    expect_equal(h[1L][[1]], 3)
    h <- insert(h, 2L, list(a=1))
    h <- insert(h, 1L, 2)
    expect_equal(h[1L][[1]], 2)
})

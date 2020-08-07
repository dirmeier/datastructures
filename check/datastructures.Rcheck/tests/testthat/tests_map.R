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


context("map")


maps <- c(multimap, bimap, hashmap)

test_that("abstract class cannot get instantiated", {
    expect_error(methods::new("map"))
})

test_that("maps clear correctly", {
    for (m in maps) {
        h <- m("character")
        h <- insert(h, letters[1], letters[1])
        h <- insert(h, letters[2], letters[2])
        h <- insert(h, letters[3], letters[3])
        h <- clear(h)
        expect_equal(size(h), 0)
    }
})

test_that("maps removes", {
    for (m in maps) {
        h <- m("character")
        h <- insert(h, letters[1], letters[1])
        h <- insert(h, letters[2], letters[2])
        h <- insert(h, letters[3], letters[3])
        h <- erase(h, letters[1])
        expect_error(h[letters[1]])
    }
})

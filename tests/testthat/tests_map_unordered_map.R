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


context("unordered map")


maps <- c(hashmap, multimap)


test_that("map shows", {
    expect_output(show(hashmap("numeric", "numeric")))
    expect_output(show(multimap("character", "numeric")))
})


test_that("unordered map insert throws when inserting false values", {
    for (cm in maps)
    {
        h <- cm("numeric", "numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_error(insert(h, c("s", "s"), c(4, 5)))
    }
})


test_that("unordered map retrieves correct values", {
    for (cm in maps)
    {
        h <- cm("numeric", "numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_true(all(sort(unlist(values(h))) %in% c(4, 5)))
    }
})


test_that("unordered map get throws when getting false values", {
    for (m in maps)
    {
        h <- m("numeric", "numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_error(get(h, "s"))
    }
})


test_that("unordered map insert/get methods work", {
    for (m in maps)
    {
        h <- m("numeric", "numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_equal(get(h, 1)[[1]], 4)
    }
})


test_that("unordered map insert/get matrix works", {
    for (cm in maps)
    {
        h <- cm("numeric", "numeric")
        m <- matrix(rnorm(10), 2)
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(get(h, 1)[[1]], m[1, ])
    }
})


test_that("unordered map insert list works", {
    for (cm in maps)
    {
        h <- cm("numeric", "character")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(get(h, 2)[[1]], m[[2]])
    }
})


test_that("unordered map insert vector works", {
    for (cm in maps)
    {
        h <- cm("numeric", "character")
        m <- letters[1:2]
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(get(h, 2)[[1]], m[2])
    }
})


test_that("unordered map head works", {
    for (cm in maps)
    {
        h <- cm("numeric", "character")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_output(show(head(h)))
    }
})


test_that("unordered map size works", {
    for (cm in maps)
    {
        h <- cm("numeric", "character")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(size(h), 2)
    }
})

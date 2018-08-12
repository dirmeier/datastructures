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
    expect_output(show(hashmap("numeric")))
    expect_output(show(multimap("character")))
})


test_that("unordered map insert throws when inserting false values", {
    for (cm in maps)
    {
        h <- cm("numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_error(insert(h, c("s", "s"), c(4, 5)))
    }
})


test_that("unordered map retrieves correct values", {
    for (cm in maps)
    {
        h <- cm("numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_true(all(sort(unlist(values(h))) %in% c(4, 5)))
    }
})


test_that("unordered map get throws when getting false values", {
    for (m in maps)
    {
        h <- m("numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_error(get(h, "s"))
    }
})


test_that("unordered map insert/get methods work", {
    for (m in maps)
    {
        h <- m("numeric")
        h <- insert(h, c(1, 2), c(4, 5))
        expect_equal(get(h, 1)[[1]], 4)
    }
})


test_that("unordered map insert list works", {
    for (cm in maps)
    {
        h <- cm("numeric")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(get(h, 2)[[1]], m[[2]])
    }
})


test_that("unordered map insert vector works", {
    for (cm in maps)
    {
        h <- cm("numeric")
        m <- letters[1:2]
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(get(h, 2)[[1]], m[2])
    }
})

test_that("unordered map can insert multiple values", {
    for (cm in maps)
    {
        h <- cm("character")

        h <- insert(h, "a", data.frame(A=rnorm(10)))
        h[letters[2:3]] <- rnorm(2)
        h <- insert(h, c("hallo", "hello"), list(a="A", b=list(a=3)))

        expect_true(is.data.frame(get(h, "a")[[1]]))
        expect_true(is.numeric(get(h, "b")[[1]]))
        expect_true(get(h, "hallo")[[1]] == "A")
        expect_true(is.list(get(h, "hello")[[1]]))
    }
})


test_that("unordered map head works", {
    for (cm in maps)
    {
        h <- cm("numeric")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_output(show(head(h)))
    }
})


test_that("unordered map size works", {
    for (cm in maps)
    {
        h <- cm("numeric")
        m <- as.list(letters[1:2])
        r <- c(1, 2)
        h <- insert(h, r, m)
        expect_equal(size(h), 2)
    }
})


test_that("unordered map removes", {
    for (m in maps) {
        h <- m("integer")
        h <- insert(h, 1L, environment())
        h <- insert(h, 2L, list(a=1))
        h <- insert(h, 3L, 2)
        h <- remove(h, 1L)
        expect_error(h[letters[1]])
    }
})



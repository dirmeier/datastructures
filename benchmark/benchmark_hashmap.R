library(microbenchmark)
library(datastructures)

f1 <- function(i)
{
    k <- paste0("k", 1:i)
    hashmap <- new("hashmap", "character", "character")
    hashmap <- insert(hashmap, k, paste0("v", 1:i))
}

f2 <- function(i)
{
    k <- paste0("k", 1:i)
    v <- paste0("v", 1:i)
    e <- new.env()
    for (el in seq_along(k))
    {
        e[[ k[el] ]] <- v[el]
    }
}

microbenchmark(
    hash = f1(1000),
    env  = f2(1000)
)

microbenchmark(
    hash = f1(10000),
    env  = f2(10000)
)

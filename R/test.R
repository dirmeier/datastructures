
# library(datastructures)
# s <- new(datastructures:::veci)
#
#
# s$push_back(2.7)
# class(s[[2]])
# s[[3]]
#
# t <- new(datastructures:::veci)
#
# t$push_back(2)

s <- new(datastructures:::hashmap_sd)

s[["simon"]] <- 1

s[["simon"]]

library(microbenchmark)

f1 <- function()
{
  s <- new(datastructures:::hashmap_si)
  for (i in seq_len(i))
  {
      s[[paste0("s", 1)]] <- i
  }
  for (i in seq_len(i))
  {
      s[[paste0("s", 1)]]
  }
}

f2 <- function()
{
    env <- new.env()
    for (i in seq_len(i))
    {
        env[[paste0("s", 1)]] <- 1
    }
    for (i in seq_len(i))
    {
        env[[paste0("s", 1)]]
    }
}

## ---- eval=TRUE, include=FALSE------------------------------------------------
  library(datastructures)
  library(purrr)
  fheap <- fibonacci_heap("numeric")

## -----------------------------------------------------------------------------
  fheap <- fibonacci_heap("numeric")
  bheap <- binomial_heap("numeric")

## -----------------------------------------------------------------------------
  keys   <- sample(seq(0, 1, by=.2))
  values <- paste0("V", keys)
  fheap  <- insert(fheap, keys, values)

  size(fheap)

## -----------------------------------------------------------------------------
  fheap  <- insert(fheap, -1, letters[1:5])
  peek(fheap)

## -----------------------------------------------------------------------------
  fheap  <- insert(fheap, -2, list(a=5))
  fheap  <- insert(fheap, -3, data.frame(A=rnorm(5), B=1:5))
                   
  peek(fheap)

## -----------------------------------------------------------------------------
  fheap  <- insert(fheap, c(-4, -5, -6), list(list(a=2), letters[1:4], "hallo"))

## -----------------------------------------------------------------------------
  peek(fheap)
  size(fheap)

## -----------------------------------------------------------------------------
  pop(fheap)
  size(fheap)

## -----------------------------------------------------------------------------
  fheap[-10] <- "V-1"
  peek(fheap)

## -----------------------------------------------------------------------------
  decrease_key(fheap, from=-10, to=-11)
  peek(fheap)

## -----------------------------------------------------------------------------
  decrease_key(fheap, from=c(-4, -5), to=c(-15, -13))
  peek(fheap)

## -----------------------------------------------------------------------------
  handle(fheap, -15)

## -----------------------------------------------------------------------------
  hand <- handle(fheap, -15)  
  decrease_key(fheap, -15, -20, hand[[1]]$handle)
  peek(fheap)

## -----------------------------------------------------------------------------
 handle(fheap, c(-3))

## -----------------------------------------------------------------------------
  hands <- handle(fheap, value="V1")
  decrease_key(fheap, from=hands[[1]]$key, to=-1000, hands[[1]]$handle)
  peek(fheap)

## -----------------------------------------------------------------------------
  hands <- handle(fheap, value=list("V1", list(a=2)))
  hands

## -----------------------------------------------------------------------------
  val <- values(fheap)
  val[1:2]

## -----------------------------------------------------------------------------
  fheap <- clear(fheap)
  fheap

## -----------------------------------------------------------------------------
  library('purrr')
  bheap <- binomial_heap("character")
  bheap <- insert(bheap, letters[c(2:6, 5, 5)], c(2:6, 5L, 7L))
  bheap <- insert(bheap, "x", data.frame(A="hi"))
  bheap <- insert(bheap, "x", list(a=2))
  peek(bheap)
  vector.keys <- handle(bheap, "x") %>%
    purrr::map_chr(.f = function(x) x$handle)
  vector.keys
  
  decrease_key(bheap, from="x", to="b", handle=vector.keys[1])
  peek(bheap)
  hand <- handle(bheap, key = "b")
  hand
  
  decrease_key(bheap, from="b", to="a", handle=hand[[2]]$handle)
  pop(bheap)
  pop(bheap)

## -----------------------------------------------------------------------------
  hash  <- hashmap("character")
  mm    <- multimap("character")
  bimap <- bimap("character", "integer")

## -----------------------------------------------------------------------------
  keys   <- paste0("V", 1:5)
  values <- 1:5
  
  hash   <- insert(hash, keys[1:4], values[1:4])
  mm     <- insert(mm, keys[c(2, 2)], list(list(a=1), data.frame(a=rnorm(5), 2, 3)))
  bimap  <- insert(bimap, keys[1:4], values[1:4])
  
  hash[keys[5]]  <- values[5]
  bimap[keys[5]] <- values[5]
  mm[keys[5]]    <- diag(5)

## -----------------------------------------------------------------------------
  at(hash, keys[1])
  hash[keys[1]]

  at(bimap, keys[1], "values")
  at(bimap, values[2], "keys")
  at(bimap, keys[1])
  
  at(mm, keys[2])
  mm[keys[5]]

## -----------------------------------------------------------------------------
  keys(bimap)
  values(hash)
  peek(bimap)

## -----------------------------------------------------------------------------
  hash <- erase(hash, keys[1])
  hash
  mm <- erase(mm, keys[2])
  mm

## -----------------------------------------------------------------------------
  mm <- insert(mm, keys[c(2, 2)], list(list(a=1), data.frame(a=rnorm(5), 2, 3)))
  mm <- erase(mm, keys[2], list(a=1))
  mm[ keys[2] ]

## -----------------------------------------------------------------------------
  bimap <- erase(bimap, value=values[1])
  bimap

## -----------------------------------------------------------------------------
  clear(bimap)
  size(bimap)
  clear(hash)
  size(hash)
  clear(mm)
  size(mm)

## -----------------------------------------------------------------------------
  qu <- queue()
  st <- stack()

## -----------------------------------------------------------------------------
  qu <- insert(qu, 1)
  qu <- insert(qu, list(rnorm(5), 1, diag(3)))
  st <- insert(st, as.list(rnorm(5)))
  st <- insert(st, data.frame(a=1:3, b=3:1))

## -----------------------------------------------------------------------------
  peek(qu)
  peek(st)

## -----------------------------------------------------------------------------
  pop(st)
  pop(st)

## -----------------------------------------------------------------------------
  size(qu)

## -----------------------------------------------------------------------------
  qu <- clear(qu)
  qu

## -----------------------------------------------------------------------------
  sessionInfo()


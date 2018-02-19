## ---- eval=TRUE, include=FALSE-------------------------------------------
  library(datastructures)

## ------------------------------------------------------------------------
  fheap <- fibonacci_heap("numeric", "character")
  bheap <- binomial_heap("numeric", "character")

## ------------------------------------------------------------------------
  keys   <- sample(seq(0, 1, by=.2))
  values <- paste0("V", keys)
  fheap  <- insert(fheap, keys, values)

  size(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, -1, letters)
  peek(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, c(-2, -3), matrix(letters, 2))
  peek(fheap)

## ------------------------------------------------------------------------
  fheap  <- insert(fheap, c(-4, -5), list("a", letters[1:4]))
  peek(fheap)

## ------------------------------------------------------------------------
  peek(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  pop(fheap)
  size(fheap)

## ------------------------------------------------------------------------
  fheap[-10] <- "V-1"
  peek(fheap)


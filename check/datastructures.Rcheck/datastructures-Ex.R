pkgname <- "datastructures"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('datastructures')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("at-methods")
### * at-methods

flush(stderr()); flush(stdout())

### Name: at
### Title: Access elements from an object
### Aliases: at at,bimap,vector,character-method
###   at,bimap,vector,missing-method at,unordered_map,vector,missing-method

### ** Examples


# access values from a hashmap
h_map <- hashmap("integer")
h_map[seq(2)] <- list(data.frame(a=rexp(3), b=rnorm(3)), environment())
h_map[1L]

# access values or keys from a bimap
b_map <- bimap("integer", "character")
b_map[seq(5)] <- letters[seq(5)]
at(b_map, c(1L, 3L))
at(b_map, c(1L, 3L), which="values")
at(b_map, c("a", "c"), which="keys")

# access values from a multimap
m_map <- multimap("integer")
m_map[c(seq(5), seq(5))] <- letters[seq(10)]
at(m_map, 1L)




cleanEx()
nameEx("bimap")
### * bimap

flush(stderr()); flush(stdout())

### Name: bimap
### Title: Create a new 'bimap'
### Aliases: bimap

### ** Examples

 # create a bimap with character <-> character bi-mapping
 b <- bimap()

 # create a bimap with character <-> integer bi-mapping
 b <- bimap("character", "integer")

 # create a bimap with integer <-> integer bi-mapping
 b <- bimap("integer", "numeric")




cleanEx()
nameEx("binomial_heap")
### * binomial_heap

flush(stderr()); flush(stdout())

### Name: binomial_heap
### Title: Create a new 'binomial_heap'
### Aliases: binomial_heap

### ** Examples

 # creates a binomial_heap<character, SEXP>
 b_heap <- binomial_heap()

 # creates a binomial_heap<numeric, SEXP>
 b_heap <- binomial_heap("numeric")

 # creates a binomial_heap<character, SEXP>
 b_heap <- binomial_heap("character")




cleanEx()
nameEx("clear-methods")
### * clear-methods

flush(stderr()); flush(stdout())

### Name: clear
### Title: Remove all elements from a datastructure
### Aliases: clear clear,deque-method clear,heap-method clear,map-method

### ** Examples


 # clears a multimap
 m_map <- multimap()
 m_map <- insert(m_map, c("a", "b"), 1:2)
 m_map <- insert(m_map, c("a", "b"), list(1, list(a=1)))
 m_map <- clear(m_map)


 # clears a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, 1:2)
 f_heap[3:4] <-  list(1, list(a=1))
 f_heap <- clear(f_heap)

 # clears a \code{deque}
 s <- stack()
 s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))
 s <- clear(s)




cleanEx()
nameEx("decrease_key-methods")
### * decrease_key-methods

flush(stderr()); flush(stdout())

### Name: decrease_key
### Title: Decreases the key of a node in a heap
### Aliases: decrease_key decrease_key,heap,vector,vector,character-method
###   decrease_key,heap,vector,vector,missing-method

### ** Examples


 # decreases the key of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:5, letters[1:5])
 peek(f_heap)

 decrease_key(f_heap, 5L, -1L)
 peek(f_heap)

 hand <- handle(f_heap, value=letters[3])
 decrease_key(f_heap, hand[[1]]$key, -2L)
 peek(f_heap)




cleanEx()
nameEx("erase-methods")
### * erase-methods

flush(stderr()); flush(stdout())

### Name: erase
### Title: Erase an entry from a map
### Aliases: erase erase,map,vector,missing-method
###   erase,bimap,missing,vector-method erase,multimap,vector,vector-method
###   erase,multimap,vector,list-method erase,multimap,vector,ANY-method

### ** Examples


 # erases keys from a hashmap or bimap
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 h_map <- erase(h_map, "a")
 h_map <- erase(h_map, letters[2:5])

 # erases keys from a multimap
 m_map <- multimap()
 m_map[c("a", "a", "a", "b", "b", "c")] <- rep(1:2, 3)
 m_map <- erase(m_map, "a")
 m_map <- erase(m_map, "b", 1)




cleanEx()
nameEx("fibonacci_heap")
### * fibonacci_heap

flush(stderr()); flush(stdout())

### Name: fibonacci_heap
### Title: Create a new 'fibonacci_heap'
### Aliases: fibonacci_heap

### ** Examples

 # creates a fibonacci_heap<character, SEXP>
 f_heap <- fibonacci_heap()

 # creates a fibonacci_heap<numeric, SEXP>
 f_heap <- fibonacci_heap("numeric")

 # creates a fibonacci_heap<character, SEXP>
 f_heap <- fibonacci_heap("character")




cleanEx()
nameEx("handle-methods")
### * handle-methods

flush(stderr()); flush(stdout())

### Name: handle
### Title: Get the handles and values for nodes of a specific key in a
###   heap.
### Aliases: handle handle,heap,vector,missing-method
###   handle,heap,missing,list-method handle,heap,missing,vector-method
###   handle,heap,missing,matrix-method

### ** Examples

 # returns the handle of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:5, letters[1:5])

 handle(f_heap, key=3L)

 handle(f_heap, value=letters[3])




cleanEx()
nameEx("hashmap")
### * hashmap

flush(stderr()); flush(stdout())

### Name: hashmap
### Title: Create a new 'hashmap'
### Aliases: hashmap

### ** Examples

 # creates a hashmap<character, SEXP>
 h <- hashmap()

 # creates a hashmap<integer, SEXP>
 h <- hashmap("integer")

 # creates a hashmap<numeric, SEXP>
 h <- hashmap("numeric")




cleanEx()
nameEx("insert-methods")
### * insert-methods

flush(stderr()); flush(stdout())

### Name: insert
### Title: Add elements to an object
### Aliases: insert insert,deque,ANY,missing-method
###   insert,deque,list,missing-method insert,heap,vector,vector-method
###   insert,heap,vector,matrix-method insert,heap,vector,list-method
###   insert,heap,vector,ANY-method insert,bimap,vector,vector-method
###   insert,unordered_map,vector,vector-method
###   insert,unordered_map,vector,list-method
###   insert,unordered_map,vector,ANY-method

### ** Examples


 # inserts values into a multimap
 m_map <- multimap()
 m_map <- insert(m_map, c("a", "b"), 1:2)
 m_map <- insert(m_map, c("a", "b"), list(1, list(a=1)))
 m_map["a"] <- rnorm(length(letters))
 m_map[c("a", "b", "c")] <- list(1, data.frame(a=2), environment())

 # inserts values into a fibonacci_heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, 1:2)
 f_heap[3:4] <- list(1, list(a=1))
 f_heap <- insert(f_heap, 5:6, list(data.frame(a=rnorm(3)), diag(2)))

 # inserts elements into a queue or stack
 s <- stack()
 s <- insert(s, list(1, vector(), list(3), data.frame(rnorm(3))))




cleanEx()
nameEx("keys-methods")
### * keys-methods

flush(stderr()); flush(stdout())

### Name: keys
### Title: Get keys from an object
### Aliases: keys keys,bimap-method keys,unordered_map-method

### ** Examples


 # returns the keys of a hashmap
 h_map <- hashmap("numeric")
 h_map[rnorm(3)] <- list(1, 2, 3)
 keys(h_map)

 # returns the keys of a multimap
 m_map <- multimap("numeric")
 m_map[c(1, 2, 1)] <- list(rnorm(1), rgamma(1, 1), rexp(1))
 keys(m_map)




cleanEx()
nameEx("multimap")
### * multimap

flush(stderr()); flush(stdout())

### Name: multimap
### Title: Create a new 'multimap'
### Aliases: multimap

### ** Examples

 # creates a new multimap<character, SEXP>
 m <- multimap()

 # creates a new multimap<numeric, SEXP>
 m <- multimap("numeric")

 # creates a new multimap<character, SEXP>
 m <- multimap("integer")




cleanEx()
nameEx("peek-methods")
### * peek-methods

flush(stderr()); flush(stdout())

### Name: peek
### Title: Have a look at the first element from an object without removing
###   it
### Aliases: peek peek,deque-method peek,heap-method peek,map-method

### ** Examples


 # peeks into a queue
 q <- queue()
 q <- insert(q, list(environment(), data.frame(a=1)))
 peek(q)

 # peeks into a fibonacci heap
 b_heap <- binomial_heap()
 b_heap <- insert(b_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 peek(b_heap)

 # peeks into a \code{hashmap}
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 peek(h_map)

 # peeks into a \code{bimap}
 b_map <- bimap("integer", "integer")
 b_map[seq(10)] <- seq(10, 1)
 peek(b_map)




cleanEx()
nameEx("pop-methods")
### * pop-methods

flush(stderr()); flush(stdout())

### Name: pop
### Title: Pop a single element from an object
### Aliases: pop pop,deque-method pop,heap-method

### ** Examples


 # pops from a queue
 q <- queue()
 q <- insert(q, list(environment(), data.frame(a=1)))
 pop(q)

 # pops from a stack
 s <- stack()
 s <- insert(s, list(environment(), data.frame(a=1)))
 pop(s)

 # pops from a fibonacci heap
 b_heap <- binomial_heap()
 b_heap <- insert(b_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 pop(b_heap)




cleanEx()
nameEx("queue")
### * queue

flush(stderr()); flush(stdout())

### Name: queue
### Title: Create a new 'queue'
### Aliases: queue

### ** Examples

 # returns a new queue<SEXP>
 q <- queue()




cleanEx()
nameEx("size-methods")
### * size-methods

flush(stderr()); flush(stdout())

### Name: size
### Title: Get the size of an object
### Aliases: size size,deque-method size,heap-method size,map-method

### ** Examples


 # get the size of a hashmap
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 size(h_map)

 # get the size of a fibonacci heap
 f_heap <- fibonacci_heap()
 f_heap <- insert(f_heap, letters[seq(3)], list(1, diag(3), rnorm(2)))
 size(f_heap)

 # get the size of a stack
 s <- stack()
 s <- insert(s, list(1))
 size(s)




cleanEx()
nameEx("stack")
### * stack

flush(stderr()); flush(stdout())

### Name: stack
### Title: Create a new 'stack'
### Aliases: stack

### ** Examples

 # creates a new stack<SEXP>
 s <- stack()




cleanEx()
nameEx("values-methods")
### * values-methods

flush(stderr()); flush(stdout())

### Name: values
### Title: Get values from an object
### Aliases: values values,heap-method values,bimap-method
###   values,unordered_map-method

### ** Examples


 # shows the values of a hashmap
 h_map <- hashmap("integer")
 h_map <- insert(h_map, seq(2), list(data.frame(a=1), 3))
 values(h_map)

 # shows the values of a multimap
 m_map <- multimap("integer")
 m_map[seq(2)] <- list(diag(2), rnorm(3))
 values(m_map)

 # shows the values of a heap
 f_heap <- fibonacci_heap("integer")
 f_heap <- insert(f_heap, 1:2, list(diag(2), rnorm(3)))
 values(f_heap)




### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')

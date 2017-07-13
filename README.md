# datastructures <img src="https://github.com/dirmeier/datastructures/blob/master/inst/heap/sticker.png" align="right" width="160px"/>

[![Project Status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![travis](https://travis-ci.org/dirmeier/datastructures.svg?branch=master)](https://travis-ci.org/dirmeier/datastructures)
[![appveyor](https://ci.appveyor.com/api/projects/status/1li41de0xhov5gc3?svg=true)](https://ci.appveyor.com/project/dirmeier/datastructures)
[![codecov](https://codecov.io/gh/dirmeier/datastructures/branch/master/graph/badge.svg)](https://codecov.io/gh/dirmeier/datastructures)
[![CRAN](http://www.r-pkg.org/badges/version/datastructures?color=brightgreen)](https://cran.r-project.org/package=datastructures)
[![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/datastructures?color=brightgreen)](https://cran.r-project.org/package=datastructures)

Implementation of core data structures for R.

## Introduction

Implementation of advanced data structures such as hashmaps, heaps, or queues in `R`. 
Advanced data structures are essential in many computer science and statistics 
problems, for example graph algorithms or string analysis. The package uses 
`Boost` and `STL` data types and extends these to `R` with `Rcpp` modules.

So far `datastructures` has implementations for:

* Fibonacci and binomial heaps,
* queues and stacks,
* hashmaps and bimaps.

As an introductory example, consider you want to compute shortest paths on a 
graph and decide to use a Fibonacci heap for keeping the distances. A Fibonacci heap is an efficient tree-like data structure
that satisfies the *min-heap property*. We can use it to quickly get the node with the shortest distance in *O(log n)* time like this:

```R
  fh <- methods::new("fibonacci_heap", "character", "numeric")
  node.labels    <- paste0("n", 10:1)
  node.distances <- seq(1, 0, length.out=length(node.labels))
  fh <- insert(fh, node.labels, node.distances)
  
  peek(fh)
  $n1
  [1] 0
```

## Installation

Download the tarball of the latest release an install it using:

```bash
  R CMD install <datastructures-x.y.z.tar.gz>
```

where `<datastructures-x.y.z.tar.gz>` is your downloaded tarball.

If you want to you can also use devtools, but I don't recommend it:

```R
  devtools::install_github("dirmeier/datastructures")
```

## Documentation

Load the library using `library(datastructures)`. We provide a vignette for 
the package that can be called using: `vignette("datastructures")`. If there 
are any questions let met know.

## Feature requests and contributing

If you want to have another datastructure added, say from `boost` or the `STL`,
just open up a new issue. Alternatively it would be great if you provided a PR.

## Author

* Simon Dirmeier <a href="mailto:mail@simon-dirmeier.net">mail@simon-dirmeier.net</a>

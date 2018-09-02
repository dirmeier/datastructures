# datastructures <img src="https://cdn.rawgit.com/dirmeier/datastructures/87d7cd08/inst/heap/heap.png" align="right" width="160px"/>


[![Project Status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Project Life](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![travis](https://travis-ci.org/dirmeier/datastructures.svg?branch=master)](https://travis-ci.org/dirmeier/datastructures)
[![appveyor](https://ci.appveyor.com/api/projects/status/1li41de0xhov5gc3?svg=true)](https://ci.appveyor.com/project/dirmeier/datastructures)
[![codecov](https://codecov.io/gh/dirmeier/datastructures/branch/master/graph/badge.svg)](https://codecov.io/gh/dirmeier/datastructures)
[![CRAN](http://www.r-pkg.org/badges/version/datastructures?color=brightgreen)](https://cran.r-project.org/package=datastructures)
[![Downloads](http://cranlogs.r-pkg.org/badges/grand-total/datastructures?color=brightgreen)](https://cran.r-project.org/package=datastructures)
[![joss](http://joss.theoj.org/papers/10.21105/joss.00910/status.svg)](https://doi.org/10.21105/joss.00910)
[![zenodo](https://zenodo.org/badge/DOI/10.5281/zenodo.1404281.svg)](https://doi.org/10.5281/zenodo.1404281)

Implementation of core data structures for R.

## Introduction

Implementation of advanced data structures such as hashmaps, heaps, or queues in `R`.
Advanced data structures are essential in many computer science and statistics
problems, for example graph algorithms or string analysis. The package uses
`Boost` and `STL` data types and extends these to `R` with `Rcpp` modules.

So far `datastructures` has implementations for:

* Fibonacci and binomial heaps,
* queues and stacks,
* hashmaps, multimaps and bimaps.

As an introductory example, imagine that you want to compute shortest paths on a
graph and decide to use a Fibonacci heap for keeping the distances. A Fibonacci heap is an efficient tree-like data structure
that satisfies the *min-heap property*. We can use it to quickly get the node with the shortest distance in *O(log n)* time like this:

```R
  fh <- fibonacci_heap("numeric")
  node.labels    <- paste0("n", 10:1)
  node.distances <- seq(1, 0, length.out=length(node.labels))
  fh <- insert(fh, node.distances, node.labels)

  peek(fh)
  $`0`
  [1] "n1"
```

`datastructures` also allows storing non-orimitive objects, like `data.frames`, `matrices` or `environments`.
For instance, we could use a hashmap for storing such objects:

```R
  hm <- hashmap("integer")
  keys <- 1:2
  values <- list(
    environment(),
    data.frame(A=rbeta(3, .5, .5), B=rgamma(3, 1)))
  hm[keys] <- values

  hm[1L]
  [[1]]
  <environment: R_GlobalEnv>
```

## Installation

Get the package from *CRAN* using:

```R
  install.packages("datastructures")
```

You can also download the tarball of the latest release and install with:

```bash
  R CMD install <datastructures-x.y.z.tar.gz>
```

where `<datastructures-x.y.z.tar.gz>` is your downloaded tarball. If you want
to you can also use devtools, but I don't recommend it since it might give unstable
versions:

```R
  devtools::install_github("dirmeier/datastructures")
```

## Documentation

Load the library using `library(datastructures)`. We provide a vignette for
the package that can be called using: `vignette("datastructures")`. If there
are any questions let met know.

## Citation

If you want to cite `datastructures`, please use the following entry:

> Dirmeier, Simon (2018). `datastructures`: An R package for organisation and storage of data. Journal of Open Source Software, 3(28), 910, https://doi.org/10.21105/joss.00910

## Feature requests and contributing

If you want to have another datastructure added, say from `boost` or the `STL`,
just open up a new issue. Alternatively it would be great if you provided a PR.

## Author

* Simon Dirmeier <a href="mailto:simon.dirmeier@web.de">simon.dirmeier@web.de</a>

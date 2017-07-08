# datastructures <img src="https://github.com/dirmeier/datastructures/blob/master/inst/heap/sticker.png" align="right" width="160px"/>

[![Project Status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![travis](https://travis-ci.org/dirmeier/datastructures.svg?branch=master)](https://travis-ci.org/dirmeier/datastructures)
[![appveyor](https://ci.appveyor.com/api/projects/status/1li41de0xhov5gc3?svg=true)](https://ci.appveyor.com/project/dirmeier/datastructures)
[![codecov](https://codecov.io/gh/dirmeier/datastructures/branch/master/graph/badge.svg)](https://codecov.io/gh/dirmeier/datastructures)

Implementation of core data structures for R.

## Introduction

Implementation of advanced data structures such as hashmaps, heaps, or queues. 
Advanced data structures are essential in many computer science and statistics 
problems, for example graph algorithms or string analysis. The package uses 
'Boost' and 'STL' data types and extends these to R with 'Rcpp' modules.

## Usage

Download the tarball of the latest release an install it using:

```R
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

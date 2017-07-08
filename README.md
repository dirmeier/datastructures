<h1 align="center"> datastructures </h1>

[![Project Status](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![travis](https://travis-ci.org/dirmeier/datastructures.svg?branch=master)](https://travis-ci.org/dirmeier/datastructures)
[![appveyor](https://ci.appveyor.com/api/projects/status/1li41de0xhov5gc3?svg=true)](https://ci.appveyor.com/project/dirmeier/datastructures)
[![codecov](https://codecov.io/gh/dirmeier/datastructures/branch/master/graph/badge.svg)](https://codecov.io/gh/dirmeier/datastructures)

Implementation of core datastructures for R.

## Introduction

This package implements some core datastructures such as hashmaps, heaps or
queues using Rcpp modules in `R`.

## Usage

Download the tarball of the latest release an install it using:

```R
  R CMD install <datastructures-x.y.z.tar.gz>
```

where `<datastructures-x.y.z.tar.gz>` is your downloaded tarball. If you insist 
you cana lso use devtools, but I don;t recommend it:

```R
  devtools::install_github("dirmeier/datastructures")
```

## Documentation

Load the library using `library(datastructures)`. We provide a vignette for 
the package that can be called using: `vignette("datastructure")`. If there 
are any questions let met know.

## Feature requests and contributing

If you want to have another datastructure added, ay from `boost` or the `STL`,
just open an issue. Alternatively it would be great if you provided a PR.

## Author

* Simon Dirmeier <a href="mailto:mail@simon-dirmeier.net">mail@simon-dirmeier.net</a>

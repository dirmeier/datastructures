% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ds_heap_binomial.R
\name{binomial_heap}
\alias{binomial_heap}
\title{Create a new \code{binomial_heap}}
\usage{
binomial_heap(key.class = c("character", "numeric", "integer"))
}
\arguments{
\item{key.class}{the primitive class type of the keys}
}
\value{
returns a new \code{binomial_heap} object
}
\description{
Instantiates a new \code{\linkS4class{binomial_heap}} object,
 i.e. a tree-like data structure satisfying the \emph{min-heap} property.
}
\examples{
 # creates a binomial_heap<character, SEXP>
 b_heap <- binomial_heap()

 # creates a binomial_heap<numeric, SEXP>
 b_heap <- binomial_heap("numeric")

 # creates a binomial_heap<character, SEXP>
 b_heap <- binomial_heap("character")

}

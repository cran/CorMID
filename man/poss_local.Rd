% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/poss_local.R
\name{poss_local}
\alias{poss_local}
\title{poss_local.}
\usage{
poss_local(vec = NULL, d = NULL, prec = 0.001, limits = NULL, ...)
}
\arguments{
\item{vec}{The starting vector sum(vec) should be 1.}

\item{d}{The maximum allowed deviation for each element in vec.}

\item{prec}{recision of allowed errors.}

\item{limits}{A 2-row matrix with lower and upper boundaries for the result vectors.}

\item{...}{Passed to function \code{seq}. Either by or length.out (see examples in test-poss_local.R).}
}
\value{
A matrix with rowSums\~1 and within the limits defined by vec and d.
}
\description{
\code{poss_local} will compute a matrix of possibilities.
}
\details{
Within the approximation process we need to check various hypotheses
 of MID and r combinations. A non-redundant set of posible combinations can
 be computed with this \code{poss_local}.
}
\keyword{internal}

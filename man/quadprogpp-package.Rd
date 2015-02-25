\name{quadprogpp-package}
\alias{quadprogpp-package}
\alias{quadprogpp}
\docType{package}
\title{
Quadratic Programming++ for R.
}
\description{
This package provides a fast Quadratic Programming implementation in R.
It wraps \emph{eiquadprog} c++ library with \link[RcppEigen]{RcppEigen} R package.
}
\details{
\tabular{ll}{
Package: \tab quadprogpp\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-02-23\cr
License: \tab GNU GPL v2.0 or later\cr
}

}
\author{
Maintainer: Farzad Noorian <farzad.noorian@sydney.edu.au>
}
\references{
\emph{eiquadprog} is a modified version of \emph{uQuadProg++} library, working with 
\emph{Eigen} data structures. See \url{http://www.labri.fr/perso/guenneba/code/QuadProg/}.
Copyright (2011) Benjamin Stephens and (2010) Gael Guennebaud.

\emph{uQuadProg++} is itself a port made by Angelo Furfaro of \emph{QuadProg++} originally
developed by Luca Di Gaspero, working with \emph{ublas} data structures.
See \url{http://www.diegm.uniud.it/digaspero/index.php?page=software}.
Copyright (2008) Angelo Furfaro and (2006) Luca Di Gaspero.

Implementations are based on the dual method by Goldfarb and Idnani:

D. Goldfarb and A. Idnani (1982).
Dual and Primal-Dual Methods for Solving Strictly Convex Quadratic Programs.
In J. P. Hennart (ed.), \emph{Numerical Analysis},
Springer-Verlag, Berlin, 226--239.

D. Goldfarb and A. Idnani (1983).
A numerically stable dual method for solving strictly convex quadratic programs.
\emph{Mathematical Programming}, \bold{27}, 1--33.

}
\seealso{
\code{\link{QP.Solve}}
}

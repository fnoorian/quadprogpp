\name{QP.Solve}
\alias{QP.Solve}

\title{
Quick Quadratic Programming using eiquadprog c++ library.
}

\description{
\code{QP.Solve} solves a quadratic programming in form of:

\eqn{
  \min 1/2 x^T G x + g_0^T x \\
  s.t. \\
  ~~~~ C_E^T x + c_{e0} = 0 \\
  ~~~~ C_I^T x + c_{i0} \ge 0
}{
min 

  1/2 x^T G x + g0^T x
  
s.t.

  CE^T x + ce0 = 0
  
  CI^T x + ci0 >= 0
}
}
\usage{
QP.Solve(G, g0, 
         CI = matrix(0, length(g0), 0), ci0 = vector(),
         CE = matrix(0, length(g0), 0), ce0 = vector())
}
\arguments{
  \item{G}{
    n by n matrix appearing in the quadratic function to be minimized.
  }
  \item{g0}{
    vector on length n appearing in the quadratic function to be minimized.
  }
  \item{CI}{
    n by m constraints matrix. Can be an empty matrix.
  }
  \item{ci0}{
    constraints constants, with size m. Can be an empty vector.
  }
  \item{CE}{
    n by p equalities matrix. Can be an empty matrix.
  }
  \item{ce0}{
    equalities vector, with size p. Can be an empty vector.
  }
}
\value{
  A vector containing the solution of the quadratic programming problem.
}

\seealso{
\code{\link{quadprog.solve.QP}}, \code{\link[quadprog:solve.QP]{quadprog package}}
}


\examples{
##
## Assume we want to minimize: 1/2 x^T x + d^T \%*\% x
## under the constraints:      A^T x + b0 >= 0
## with d = (0,-5,0)^T
##     b0 = (8,-2,0)^T
## and 
##          (-4  2  0) 
##      A = (-3  1 -2)
##          ( 0  0  1)
## we can use QP.Solve as follows:
##
Dmat <- diag(3)
dvec <- c(0,-5,0)
CI   <- matrix(c(-4,-3,0,2,1,0,0,-2,1),3,3)
ci0  <- c(8,-2,0)
QP.Solve(Dmat, dvec, CI, ci0)

## This is comparable to using solve.QP from quadprog package:
## solve.QP(Dmat, -dvec, CI, -ci0)
}

\keyword{optimize}

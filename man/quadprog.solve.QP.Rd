\name{quadprog.solve.QP}
\alias{quadprog.solve.QP}

\title{
  Quick Quadratic Programming using eiquadprog c++ library.
}

\description{
\code{quadprog.solve.QP} solves a quadratic programming in form of
\eqn{\min(-d^T b + 1/2 b^T D b)}{min(-d^T b + 1/2 b^T D b)} with the
  constraints \eqn{A^T b \ge b_0}.
}
\usage{
quadprog.solve.QP(Dmat, dvec, Amat, bvec, meq=0, factorized=FALSE)
}
\arguments{
  \item{Dmat}{
    matrix appearing in the quadratic function to be minimized.
  }
  \item{dvec}{
    vector appearing in the quadratic function to be minimized.
  }
  \item{Amat}{
    matrix defining the constraints under which we want to minimize the
    quadratic function.
  }
  \item{bvec}{
    vector holding the values of \eqn{b_0} (defaults to zero).
  }
  \item{meq}{
    the first \code{meq} constraints are treated as equality
    constraints, all further as inequality constraints (defaults to 0).
  }
  \item{factorized}{
    Not implemented. Must be set to false.
  }
}
\value{
  a list with the following components:
  \item{solution}{
    vector containing the solution of the quadratic programming problem.
  }
  \item{value}{
    not implemented. Contains NULL.
  }
  \item{unconstrained.solution}{
   not implemented. Contains NULL.
  }
  \item{iterations}{
    not implemented. Contains NULL.
  }
  \item{Lagrangian}{
    not implemented. Contains NULL.
  }
  \item{iact}{
    not implemented. Contains NULL.
  }
}
\details{
This function is a thin wrapper around \code{\link{QP.Solve}}, for compatibility
with \code{\link[quadprog:solve.QP]{quadprog package}}.
}

\references{
quadprog: Functions to solve Quadratic Programming Problems. R package version 1.5-5.
http://CRAN.R-project.org/package=quadprog
}   
\seealso{
\code{\link[quadprog:solve.QP]{quadprog package}}, \code{\link{QP.Solve}}
}


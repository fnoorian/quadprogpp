quadprog.solve.QP <- function(Dmat, dvec, Amat, bvec, meq=0, factorized=FALSE) {

  if (factorized) {
    stop("factorized parameter not supported")
  }

  n <- nrow(Dmat)

  # check the sizes
  if (ncol(Dmat) != n)
      stop("Dmat not square");
  if (length(dvec) != n)
      stop("g0 size incompatible with G");
  if (length(Amat) > 0) {
    if (nrow(Amat) != n)
        stop("Amat size incompatible with Dmat");
    if (ncol(Amat) != length(bvec))
        stop("Amat size incompatible with bvec");
  }

  # extract equalities and inequalities
  if (meq > 0) {
    eq_ind = 1:meq
    CE = Amat[, eq_ind, drop = FALSE]
    ce0 = bvec[eq_ind]
    CI = Amat[, -eq_ind, drop = FALSE]
    ci0 = bvec[-eq_ind]
  } else {
    CE = matrix(0, n, 0)
    ce0 = vector()
    CI = Amat
    ci0 = bvec
  }

  x <- QP.Solve(Dmat, -dvec, CI, -ci0, CE, ce0)

  return(list(solution = x,
              value = NULL,
              unconstrained.solution = NULL,
              iterations = NULL,
              Lagrangian = NULL,
              iact = NULL))
}


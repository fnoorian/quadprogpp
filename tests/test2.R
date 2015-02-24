require("quadprogpp")


## Assume we want to minimize: -(0 5 0) %*% b + 1/2 b^T b
## under the constraints:      A^T b >= b0
## with b0 = (-8,2,0)^T
## and      (-4  2  0) 
##      A = (-3  1 -2)
##          ( 0  0  1)
## we can use solve.QP as follows:
## s1 = solve.QP(Dmat, dvec, Amat, bvec) 

Dmat       <- matrix(0,3,3)
diag(Dmat) <- 1
dvec       <- c(0,5,0)
Amat       <- matrix(c(-4,-3,0,2,1,0,0,-2,1),3,3)
bvec       <- c(-8,2,0)


CE = matrix(0, nrow(Dmat), 0)
ce0 = vector()

s2 = QP.Solve(Dmat,-dvec, Amat, -bvec, CE, -ce0)
stopifnot(all(round(s2, 6) == c(0.476190, 1.047619, 2.095238)))



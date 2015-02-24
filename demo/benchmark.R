library("quadprog")
library("quadprogpp")

speed_fortran = c()
speed_cpp = c()
N_list = c(10, 20, 50, 100, 200, 500, 1000)
for (i in N_list) {
  N <- i

  ###########
  # Setup
  LS <- 200 * sin((1:N)*pi/N)

  B_max <- 1600
  U_max <- 90
  B_min <- 0.2 * B_max
  B0 <- B_max
  S <- matrix(1, N, N)
  S[upper.tri(S)] <- 0
  I <- diag(N)
  I1 <- matrix(1, 1, N)

  ###########
  # Matrices and Vectors
  D <- I
  d0 <- LS
  Amat <- cbind(-t(S), t(S), I, -I)
  bvec <- c((B_min - B0) * I1, (-B_max + B0) * I1, -U_max * I1, -U_max * I1)

  repeats <- (1000/N)

  cat("\n---------------------\n")
  cat("Quadratic Program:", N, " variables\n")
  cat("                  ", length(bvec), " constraints\n")
  cat("Repeating ", repeats, " times\n\n")

  ##########
  # do the optimisation
  cat("Using QuadProg (Fortran):\n")
  t1 <- system.time({
    for (j in 1:repeats) {
      sol <- solve.QP(D, d0, Amat, bvec)
    }
  })
  speed_fortran <- c(speed_fortran, t1[1] / repeats)
  print(t1)
  cat("\n")

  cat("Using QuadProgPP (C++-Eigen):\n")
  t2 <- system.time({
    for (j in 1:repeats) {
      sol2 <- QP.Solve(D, -d0, Amat, -bvec)
    }
  })
  speed_cpp <- c(speed_cpp, t2[1] / repeats)
  print(t2)

  ###########
  # compare results
  u1 <- round(sol$solution, 6)
  u2 <- round(sol2, 6)
  stopifnot(all(u1 == u2))
}

speedup <- data.frame(N = N_list,
                      QuadProgPP = speed_cpp,
                      QuadProg = speed_fortran,
                      Speedup = speed_fortran / speed_cpp)
print(speedup)

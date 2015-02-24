QP.Solve <- function(G, g0, 
                     CI = matrix(0, length(g0), 0), ci0 = vector(),
                     CE = matrix(0, length(g0), 0), ce0 = vector()) {
    .Call('quadprogpp_quadratic_solve', PACKAGE = 'quadprogpp', G, g0, CE, ce0, CI, ci0)
}


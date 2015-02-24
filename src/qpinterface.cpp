
#include <RcppEigen.h>

#include <iostream>
#include <sstream>
#include <string>

#include <Eigen/Dense>

#include "eiquadprog.hpp"

using namespace Rcpp;
using namespace Eigen;

// [[Rcpp::depends(RcppEigen)]]

/*
min 0.5 * x G x + g0 x
s.t.
    CE^T x + ce0 = 0
    CI^T x + ci0 >= 0

The matrix and vectors dimensions are as follows:
     G: n * n
		g0: n
				
		CE: n * p
	 ce0: p
				
	  CI: n * m
   ci0: m

     x: n
*/

struct QPException : public std::exception
{
   std::string s;
   QPException(const std::string &ss) : s(ss) {}
   ~QPException() throw () {} // Updated
   const char* what() const throw() { return s.c_str(); }
};

// [[Rcpp::export]]
Eigen::VectorXd rcppeigen_quadratic_solve(Eigen::MatrixXd & G,
                                          Eigen::VectorXd & g0,
                                          const Eigen::MatrixXd & CE,
                                          const Eigen::VectorXd & ce0,
                                          const Eigen::MatrixXd & CI,
                                          const Eigen::VectorXd & ci0) {
    const int n = G.rows();
    const int p = ce0.size();
    const int m = ci0.size();

    // check the sizes
    if (G.cols() != n)
        throw QPException("G not square");
    if (g0.size() != n)
        throw QPException("g0 size incompatible with G");
    if (p > 0) {
        if (CE.cols() != p)
            throw QPException("CE size incompatible with ce0");
        if (CE.rows() != n)
            throw QPException("CE size incompatible with G");
    }
    if (m > 0) {
        if (CI.rows() != n)
            throw QPException("CI size incompatible with G");
        if (CI.cols() != m)
            throw QPException("CI size incompatible with ci0");
    }

    Eigen::VectorXd x(n);
    double f = solve_quadprog(G, g0,  CE, ce0,  CI, ci0, x);

    if (f == std::numeric_limits<double>::infinity()) {
        throw QPException("Solution infeasible");
    }

    return x;
}


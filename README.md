quadprogpp: Quadratic Programming++ for R
=========================================
This package provides a fast Quadratic Programming implementation in R.
It wraps *eiquadprog* c++ library with *RcppEigen* R package.

### Speed-up 
A speed-up of 4x to 5x compared to package *quadprog* (Fortran implementation) 
was  observed.

See benchmark in the package demos:
> demo("benchmark", "quadprogpp")

### Development
A developmental repository is available on github:
<https://github.com/fnoorian/quadprogpp>

### Implementation Details
*eiquadprog* is a modified version of *uQuadProg++* library, working with Eigen 
data structures. See <http://www.labri.fr/perso/guenneba/code/QuadProg/>.
Copyright (2011) Benjamin Stephens and (2010) Gael Guennebaud.

*uQuadProg++* is itself a port made by Angelo Furfaro of *QuadProg++* originally
developed by Luca Di Gaspero, working with ublas data structures.
See <http://www.diegm.uniud.it/digaspero/index.php?page=software>.
Copyright (2008) Angelo Furfaro and (2006) Luca Di Gaspero.

References: D. Goldfarb, A. Idnani. A numerically stable dual method for solving
            strictly convex quadratic programs. Mathematical Programming 27 
            (1983) pp. 1-33.

### Contact Information
 * Farzad Noorian <farzad.noorian@sydney.edu.au> (Maintainer)

### License
All files in this package are distributed under GNU GPL v2.0 or later license. 
For full terms of this license visit <https://www.gnu.org/licenses/gpl-2.0.html>.

quadprogpp: Fast Quadratic Programming for R
============================================
This package provides a fast Quadratic Programming solver implementation in R.
It wraps *eiquadprog* C++ library, an *Eigen* fork of *QuadProg++*, with *RcppEigen* R package.

## Installation
The easiest way to install is to use *devtools* github installer.
If you don't have *devtools* package, install it first by using `install.packages("devtools")`.
> library("devtools")

> install_github("fnoorian/quadprogpp")

## Speed-up 
A speed-up of 3x to 5x compared to package *quadprog* (Fortran implementation) 
was observed.

See the benchmark in the package demos:
> demo("benchmark", "quadprogpp")

## Implementation Details
*eiquadprog* is a modified version of *uQuadProg++* library, working with Eigen 
linear algebra template library's data structures. See <http://www.labri.fr/perso/guenneba/code/QuadProg/>.
Copyright (2011) Benjamin Stephens and (2010) Gael Guennebaud.

*uQuadProg++* is itself a port made by Angelo Furfaro of *QuadProg++* originally
developed by Luca Di Gaspero, working with ublas data structures.
See <http://www.diegm.uniud.it/digaspero/index.php?page=software>.
Copyright (2008) Angelo Furfaro and (2006) Luca Di Gaspero.

#### References: 
D. Goldfarb, A. Idnani. A numerically stable dual method for solving
strictly convex quadratic programs. Mathematical Programming 27 (1983) pp. 1-33.

## Development and Contact Information
A developmental repository is available on github:
<https://github.com/fnoorian/quadprogpp>

Feel free to contact the package maintainer if you need help on compiling for Windows:
* Farzad Noorian <farzad.noorian@sydney.edu.au>

## License
All files in this package are free software; you can redistribute them
and/or modify them under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

These files are distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with these files; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA,
or visit <https://www.gnu.org/licenses/gpl-2.0.html>.

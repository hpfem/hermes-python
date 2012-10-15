%module umfpack_solver
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/umfpack_solver.h"
%}

%import ../config.i
#ifdef  WITH_UMFPACK
%import linear_matrix_solver.i
%import matrix.i
# endif
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/umfpack_solver.h"

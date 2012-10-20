%module umfpack_solver
%{
#include "solvers/umfpack_solver.h"
%}

%import ../config.i
#ifdef  WITH_UMFPACK
%import linear_matrix_solver.i
%import ../matrix.i
# endif
%include "solvers/umfpack_solver.h"

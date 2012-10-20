%module mumps_solver
%{
#include "solvers/mumps_solver.h"
%}

%import ../config.i
#ifdef HAVE_MUMPS
%import ../linear_matrix_solver.i
%import ../matrix.i
%include "solvers/mumps_solver.h"
#endif

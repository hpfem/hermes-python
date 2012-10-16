%module mumps_solver
%{
#include "/usr/local/include/hermes_common/solvers/mumps_solver.h"
%}

%import ../config.i
#ifdef HAVE_MUMPS
%import ../linear_matrix_solver.i
%import ../matrix.i
%include "/usr/local/include/hermes_common/solvers/mumps_solver.h"
#endif

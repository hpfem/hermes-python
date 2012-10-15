%module mumps_solver
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/mumps_solver.h"
%}

%import ../config.i
#ifdef HAVE_MUMPS
%import ../linear_matrix_solver.i
%import ../matrix.i
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/mumps_solver.h"
#endif

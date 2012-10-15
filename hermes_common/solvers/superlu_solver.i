%module superlu_solver
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/superlu_solver.h"
%}

%import ../config.i
#ifdef WITH_SUPERLU
%import matrix.i
%import linear_matrix_solver.i
#endif
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/superlu_solver.h"

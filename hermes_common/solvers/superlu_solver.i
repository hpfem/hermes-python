%module superlu_solver
%{
#include "/usr/local/include/hermes_common/solvers/superlu_solver.h"
%}

%import ../config.i
#ifdef WITH_SUPERLU
%import matrix.i
%import linear_matrix_solver.i
#endif
%include "/usr/local/include/hermes_common/solvers/superlu_solver.h"

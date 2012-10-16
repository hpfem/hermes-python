%module petsc_solver
%{
#include "/usr/local/include/hermes_common/solvers/petsc_solver.h"
%}

%import ../matrix.i
%import linear_matrix_solver.i
#ifdef WITH_PETSC
#endif
%include "/usr/local/include/hermes_common/solvers/petsc_solver.h"

%module petsc_solver
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/petsc_solver.h"
%}

%import ../matrix.i
%import linear_matrix_solver.i
#ifdef WITH_PETSC
#endif
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/petsc_solver.h"

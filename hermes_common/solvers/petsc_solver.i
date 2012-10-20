%module petsc_solver
%{
#include "solvers/petsc_solver.h"
%}

%import ../matrix.i
%import linear_matrix_solver.i
#ifdef WITH_PETSC
#endif
%include "solvers/petsc_solver.h"

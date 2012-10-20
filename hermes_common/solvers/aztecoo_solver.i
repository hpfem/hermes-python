%module aztecoo_solver
%{
#include "solvers/aztecoo_solver.h"
%}

%import ../config.i
#ifdef HAVE_AZTECOO
%import precond_ifpack.i
%import linear_matrix_solver.i
%import epetra.i
#endif
%include "solvers/aztecoo_solver.h"

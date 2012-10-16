%module aztecoo_solver
%{
#include "/usr/local/include/hermes_common/solvers/aztecoo_solver.h"
%}

%import ../config.i
#ifdef HAVE_AZTECOO
%import precond_ifpack.i
%import linear_matrix_solver.i
%import epetra.i
#endif
%include "/usr/local/include/hermes_common/solvers/aztecoo_solver.h"

%module amesos_solver
%{
#include "/usr/local/include/hermes_common/solvers/amesos_solver.h"
%}

%import ../config.i
#ifdef HAVE_AMESOS
%import ../compat.i
%import linear_matrix_solver.i
%import epetra.i
#endif
%include "/usr/local/include/hermes_common/solvers/amesos_solver.h"

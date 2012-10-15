%module amesos_solver
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/amesos_solver.h"
%}

%import ../config.i
#ifdef HAVE_AMESOS
%import ../compat.i
%import linear_matrix_solver.i
%import epetra.i
#endif
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/amesos_solver.h"

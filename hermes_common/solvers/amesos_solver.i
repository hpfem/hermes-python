%module amesos_solver

%{
#include "solvers/amesos_solver.h"

#include "config.h"
#include "solvers/linear_matrix_solver.h"
#include "solvers/epetra.h"
#include "compat.h"

%}


%import ../config.i
#ifdef HAVE_AMESOS
%import ../compat.i
%import linear_matrix_solver.i
%import epetra.i
#endif
%include "solvers/amesos_solver.h"

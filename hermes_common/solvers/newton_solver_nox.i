%module newton_solver_nox
%{
#include "solvers/newton_solver_nox.h"
%}

%import ../config.i
#if(defined HAVE_NOX && defined HAVE_EPETRA && defined HAVE_TEUCHOS)
%import ../exceptions.i
%include "solvers/newton_solver_nox.h"
#endif

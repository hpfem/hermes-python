%module newton_solver_nox
%{
#include "/usr/local/include/hermes_common/solvers/newton_solver_nox.h"
%}

%import ../config.i
#if(defined HAVE_NOX && defined HAVE_EPETRA && defined HAVE_TEUCHOS)
%import ../exceptions.i
%include "/usr/local/include/hermes_common/solvers/newton_solver_nox.h"
#endif

%module newton_solver_nox
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/newton_solver_nox.h"
%}

%import ../config.i
#if(defined HAVE_NOX && defined HAVE_EPETRA && defined HAVE_TEUCHOS)
%import ../exceptions.i
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/newton_solver_nox.h"
#endif

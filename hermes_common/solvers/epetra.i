%module epetra
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/epetra.h"
%}

%import ../config.i
#ifdef HAVE_PETRA
%import ../matrix.i
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/epetra.h"
#endif

%module epetra
%{
#include "/usr/local/include/hermes_common/solvers/epetra.h"
%}

%import ../config.i
#ifdef HAVE_PETRA
%import ../matrix.i
%include "/usr/local/include/hermes_common/solvers/epetra.h"
#endif

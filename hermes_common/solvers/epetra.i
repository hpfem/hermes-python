%module epetra
%{
#include "solvers/epetra.h"
%}

%import ../config.i
#ifdef HAVE_PETRA
%import ../matrix.i
%include "solvers/epetra.h"
#endif

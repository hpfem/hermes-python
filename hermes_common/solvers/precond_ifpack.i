%module precond_ifpack
%{
#include "solvers/precond_ifpack.h"
%}

%import ../config.i
#ifdef  HAVE_IFPACK
%import ../precond.i
%import ../epetra.i
# endif
%include "solvers/precond_ifpack.h"

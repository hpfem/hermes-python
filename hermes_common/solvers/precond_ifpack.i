%module precond_ifpack
%{
#include "/usr/local/include/hermes_common/solvers/precond_ifpack.h"
%}

%import ../config.i
#ifdef  HAVE_IFPACK
%import ../precond.i
%import ../epetra.i
# endif
%include "/usr/local/include/hermes_common/solvers/precond_ifpack.h"

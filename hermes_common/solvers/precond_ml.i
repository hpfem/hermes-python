%module precond_ml
%{
#include "/home/pavel/repos/hermes/hermes_common/include/solvers/precond_ml.h"
%}

%import ../config.i
#ifdef  HAVE_ML
%import precond.i
%import epetra.i
# endif
%include "/home/pavel/repos/hermes/hermes_common/include/solvers/precond_ml.h"

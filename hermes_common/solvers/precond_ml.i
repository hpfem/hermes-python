%module precond_ml
%{
#include "/usr/local/include/hermes_common/solvers/precond_ml.h"
%}

%import ../config.i
#ifdef  HAVE_ML
%import precond.i
%import epetra.i
# endif
%include "/usr/local/include/hermes_common/solvers/precond_ml.h"

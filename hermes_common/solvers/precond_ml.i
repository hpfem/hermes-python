%module precond_ml
%{
#include "solvers/precond_ml.h"
%}

%import ../config.i
#ifdef  HAVE_ML
%import precond.i
%import epetra.i
# endif
%include "solvers/precond_ml.h"

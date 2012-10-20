%module nonlinear_solver
%{
#include "solvers/nonlinear_solver.h"
%}

%import precond.i
%import dp_interface.i
%import ../mixins.i
%include "solvers/nonlinear_solver.h"

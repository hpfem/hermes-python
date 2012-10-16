%module nonlinear_solver
%{
#include "/usr/local/include/hermes_common/solvers/nonlinear_solver.h"
%}

%import precond.i
%import dp_interface.i
%import ../mixins.i
%include "/usr/local/include/hermes_common/solvers/nonlinear_solver.h"

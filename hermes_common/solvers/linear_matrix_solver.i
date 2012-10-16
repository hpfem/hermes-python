%module linear_matrix_solver
%{
#include "/usr/local/include/hermes_common/solvers/linear_matrix_solver.h"
%}

%import precond.i
%import dp_interface.i
%import ../exceptions.i
%import ../mixins.i
%include "/usr/local/include/hermes_common/solvers/linear_matrix_solver.h"

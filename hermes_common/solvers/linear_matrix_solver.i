%module linear_matrix_solver
%{
#include "solvers/linear_matrix_solver.h"
%}

%import precond.i
%import dp_interface.i
%import ../exceptions.i
%import ../mixins.i
%include "solvers/linear_matrix_solver.h"

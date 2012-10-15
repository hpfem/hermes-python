%module hermes_common
%{
#include "/home/pavel/repos/hermes/hermes_common/include/hermes_common.h"
%}

%import common.i
%import solvers/linear_matrix_solver.i
%import solvers/nonlinear_solver.i
%import solvers/amesos_solver.i
%import solvers/aztecoo_solver.i
%import solvers/epetra.i
%import solvers/mumps_solver.i
%import solvers/newton_solver_nox.i
%import solvers/petsc_solver.i
%import solvers/umfpack_solver.i
%import solvers/superlu_solver.i
%import solvers/precond.i
%import solvers/precond_ifpack.i
%import solvers/precond_ml.i
%import solvers/eigensolver.i
%import hermes_function.i
%import compat.i
%import callstack.i
%import vector.i
%import tables.i
%import array.i
%import qsort.i
%import ord.i
%import mixins.i
%import api.i
%include "/home/pavel/repos/hermes/hermes_common/include/hermes_common.h"

%module hermes_common

%{
#include "/usr/local/include/hermes_common/hermes_common.h"

#include "common.h"
#include "solvers/linear_matrix_solver.h"
#include "solvers/nonlinear_solver.h"
#include "solvers/amesos_solver.h"
#include "solvers/aztecoo_solver.h"
#include "solvers/epetra.h"
#include "solvers/mumps_solver.h"
#include "solvers/newton_solver_nox.h"
#include "solvers/petsc_solver.h"
#include "solvers/umfpack_solver.h"
#include "solvers/superlu_solver.h"
#include "solvers/precond.h"
#include "solvers/precond_ifpack.h"
#include "solvers/precond_ml.h"
#include "solvers/eigensolver.h"
#include "hermes_function.h"
#include "compat.h"
#include "callstack.h"
#include "vector.h"
#include "tables.h"
#include "array.h"
#include "qsort.h"
#include "ord.h"
#include "mixins.h"
#include "api.h"
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
%include "/usr/local/include/hermes_common/hermes_common.h"

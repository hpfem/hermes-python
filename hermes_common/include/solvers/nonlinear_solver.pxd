cdef extern from "solvers/nonlinear_solver.h" namespace "Hermes::Solvers":
  cdef cppclass NonlinearSolver[Scalar]: #abstract
    NonlinearSolver(DiscreteProblemInterface[Scalar]* dp, MatrixSolverType matrix_solver_type)
    NonlinearSolver(DiscreteProblemInterface[Scalar]* dp)
    void solve(Scalar* coeff_vec)
    double get_time()
    Scalar *get_sln_vector()
    void set_verbose_output(bool verbose_output_to_set)
    void set_iterative_method(char* iterative_method_name)
    void set_preconditioner(char* preconditioner_name)
    DiscreteProblemInterface[Scalar]* dp

cdef class PyNonlinearSolverReal:
  cdef NonlinearSolver[double] * thisptr

cdef class PyNonlinearSolverComplex:
  cdef NonlinearSolver[cComplex[double]] * thisptr
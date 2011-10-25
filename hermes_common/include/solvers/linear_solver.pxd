cdef extern from "solvers/linear_solver.h" namespace "Hermes::Solvers":
  enum FactorizationScheme:
    HERMES_FACTORIZE_FROM_SCRATCH
    HERMES_REUSE_MATRIX_REORDERING
    HERMES_REUSE_MATRIX_REORDERING_AND_SCALING
    HERMES_REUSE_FACTORIZATION_COMPLETELY

  cdef cppclass LinearSolver[Scalar]: #abstract
    bool solve()
    int get_matrix_size()
    Scalar *get_sln_vector()
    int get_error()
    double get_time()
    void set_factorization_scheme(FactorizationScheme reuse_scheme)
    void set_factorization_scheme()


  cdef cppclass DirectSolver[Scalar]: # virtual public LinearSolver<Scalar> abstract
    pass

  cdef cppclass IterSolver[Scalar]: # public virtual LinearSolver<Scalar> abstract
    int get_num_iters()
    double get_residual()
    void set_tolerance(double tol)
    void set_max_iters(int iters)
    void set_precond(char *name)
    #void set_precond(Teuchos::RCP<Precond<Scalar> > &pc)
    void set_precond(Precond[Scalar] *pc)

  cdef cppclass create_linear_solver[Scalar]:
    create_linear_solver(MatrixSolverType matrix_solver_type, Matrix[Scalar]* matrix, Vector[Scalar]* rhs)

cdef class PyLinearSolverReal:
  cdef LinearSolver[double] * thisptr

cdef class PyLinearSolverComplex:
  cdef LinearSolver[cComplex[double]] * thisptr


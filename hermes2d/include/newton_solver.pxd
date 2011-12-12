cdef extern from "newton_solver.h" namespace "Hermes::Hermes2D":
  cdef cppclass NewtonSolver[Scalar]: #public Hermes::NonlinearSolver<Scalar>
    NewtonSolver(DiscreteProblem[Scalar]* dp, MatrixSolverType matrix_solver_type)
    NewtonSolver(DiscreteProblem[Scalar]* dp)
    
    void solve(Scalar* coeff_vec, double newton_tol, int newton_max_iter, bool residual_as_function)
    void solve(Scalar* coeff_vec, double newton_tol, int newton_max_iter)
    void solve(Scalar* coeff_vec, double newton_tol)
    void solve(Scalar* coeff_vec)
    void solve()
    
    void solve_keep_jacobian(Scalar* coeff_vec, double newton_tol, int newton_max_iter, bool residual_as_function)
    void solve_keep_jacobian(Scalar* coeff_vec, double newton_tol, int newton_max_iter)
    void solve_keep_jacobian(Scalar* coeff_vec, double newton_tol)
    void solve_keep_jacobian(Scalar* coeff_vec)
    void solve_keep_jacobian()
    
    void set_max_allowed_residual_norm(double max_allowed_residual_norm_to_set)
    void set_iterative_method(char* iterative_method_name)
    void set_preconditioner(char* preconditioner_name)

    double get_setup_time()
    double get_assemble_time()
    double get_solve_time()

    void attach_timer(TimePeriod *timer)
    void reset_times()
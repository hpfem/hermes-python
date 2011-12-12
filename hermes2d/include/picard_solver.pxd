cdef extern from "picard_solver.h" namespace "Hermes::Hermes2D":
  cdef cppclass PicardSolver[Scalar]: #public Hermes::NonlinearSolver<Scalar>
    PicardSolver(DiscreteProblem[Scalar]* dp, Solution[Scalar]* slns_prev_iter, MatrixSolverType matrix_solver_type)
    PicardSolver(DiscreteProblem[Scalar]* dp, Solution[Scalar]* slns_prev_iter)
    PicardSolver(DiscreteProblem[Scalar]* dp, vector[pSolution] slns_prev_iter, MatrixSolverType matrix_solver_type)
    PicardSolver(DiscreteProblem[Scalar]* dp, vector[pSolution] slns_prev_iter)
    
    bool solve(double tol, int max_iter, int num_last_vectors_used, double anderson_beta)
    bool solve(double tol, int max_iter, int num_last_vectors_used)
    bool solve(double tol, int max_iter)
    
    void solve()
    
    void set_verbose_output_inner_newton(bool verbose_output_to_set)
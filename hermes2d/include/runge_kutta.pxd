cdef extern from "runge_kutta.h" namespace "Hermes::Hermes2D":
  cdef cppclass RungeKutta[Scalar]:
    RungeKutta(WeakForm[Scalar]* wf, vector[pSpace] spaces, ButcherTable* bt, MatrixSolverType matrix_solver_type, bool start_from_zero_K_vector, bool residual_as_vector)
    RungeKutta(WeakForm[Scalar]* wf, vector[pSpace] spaces, ButcherTable* bt, MatrixSolverType matrix_solver_type, bool start_from_zero_K_vector)
    RungeKutta(WeakForm[Scalar]* wf, vector[pSpace] spaces, ButcherTable* bt, MatrixSolverType matrix_solver_type)
    RungeKutta(WeakForm[Scalar]* wf, vector[pSpace] spaces, ButcherTable* bt)

    RungeKutta(WeakForm[Scalar]* wf, Space[Scalar]* space, ButcherTable* bt, MatrixSolverType matrix_solver_type, bool start_from_zero_K_vector, bool residual_as_vector)
    RungeKutta(WeakForm[Scalar]* wf, Space[Scalar]* space, ButcherTable* bt, MatrixSolverType matrix_solver_type, bool start_from_zero_K_vector)
    RungeKutta(WeakForm[Scalar]* wf, Space[Scalar]* space, ButcherTable* bt, MatrixSolverType matrix_solver_type)
    RungeKutta(WeakForm[Scalar]* wf, Space[Scalar]* space, ButcherTable* bt)

    void use_global_projections()

    void use_local_projections()

    void multiply_as_diagonal_block_matrix(SparseMatrix[Scalar]* matrix_left, int num_stages, Scalar* stage_coeff_vec, Scalar* vector_left)

    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff, double newton_max_allowed_residual_norm)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian, bool block_diagonal_jacobian)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns, bool freeze_jacobian)                      
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, vector[pSolution] error_fns)
                                        
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol, int newton_max_iter, double newton_damping_coeff, double newton_max_allowed_residual_norm)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian, bool block_diagonal_jacobian)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn, bool freeze_jacobian)                      
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, Solution[Scalar]* error_fn)
                      
    
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff, double newton_max_allowed_residual_norm)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian)
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new, bool freeze_jacobian)                      
    void rk_time_step_newton(double current_time, double time_step, vector[pSolution] slns_time_prev,
                      vector[pSolution] slns_time_new)
                                        
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol, int newton_max_iter, double newton_damping_coeff, double newton_max_allowed_residual_norm)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter, double newton_damping_coeff)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol,int newton_max_iter)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose, double newton_tol)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian,
                      bool verbose)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian, bool block_diagonal_jacobian)
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new, bool freeze_jacobian)                      
    void rk_time_step_newton(double current_time, double time_step, Solution[Scalar]* slns_time_prev,
                      Solution[Scalar]* slns_time_new)
                      
    void set_filters_to_reinit(vector[pFilter] filters_to_reinit)
    
cdef class PyRungeKuttaReal:
  cdef RungeKutta[double] * thisptr

cdef class PyRungeKuttaComplex:
  cdef RungeKutta[cComplex[double]] * thisptr
  
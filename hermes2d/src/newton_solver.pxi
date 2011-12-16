cdef class PyNewtonSolverReal(PyNonlinearSolverReal):
  def __cinit__(self, dp, matrix_solver_type=None):
    if (type(self)!=PyNewtonSolverReal):
      return
    if matrix_solver_type is not None:
      self.thisptr=new NewtonSolver[double]((<PyDiscreteProblemReal>dp).thisptr, matrix_solver_type)
    else:
      self.thisptr=new NewtonSolver[double]((<PyDiscreteProblemReal>dp).thisptr)
  def solve(self, coeff_vec = None, newton_tol = None, newton_max_iter = None, residual_as_function = None):
    cdef double * c_coeff_vec
    if coeff_vec:
      c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=coeff_vec[i]
      if newton_tol:
        if newton_max_iter:
          if residual_as_function:
            (<NewtonSolver[double]*>self.thisptr).solve(c_coeff_vec, newton_tol, newton_max_iter, residual_as_function)
          else:
            (<NewtonSolver[double]*>self.thisptr).solve(c_coeff_vec, newton_tol, newton_max_iter)
        else:
          (<NewtonSolver[double]*>self.thisptr).solve(c_coeff_vec, newton_tol)
      else:
        (<NewtonSolver[double]*>self.thisptr).solve(c_coeff_vec)
      delBuffer[double](c_coeff_vec)
    else:
      (<NewtonSolver[double]*>self.thisptr).solve()
  
  def solve_keep_jacobian(self, coeff_vec = None, newton_tol = None, newton_max_iter = None, residual_as_function = None):
    cdef double * c_coeff_vec
    if coeff_vec:
      c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=coeff_vec[i]
      if newton_tol:
        if newton_max_iter:
          if residual_as_function:
            (<NewtonSolver[double]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol, newton_max_iter, residual_as_function)
          else:
            (<NewtonSolver[double]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol, newton_max_iter)
        else:
          (<NewtonSolver[double]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol)
      else:
        (<NewtonSolver[double]*>self.thisptr).solve_keep_jacobian(c_coeff_vec)
      delBuffer[double](c_coeff_vec)
    else:
      (<NewtonSolver[double]*>self.thisptr).solve_keep_jacobian()        

  def set_max_allowed_residual_norm(self, max_allowed_residual_norm_to_set):
    (<NewtonSolver[double]*>self.thisptr).set_max_allowed_residual_norm(max_allowed_residual_norm_to_set)

  def set_iterative_method(self, iterative_method_name):
    (<NewtonSolver[double]*>self.thisptr).set_iterative_method(iterative_method_name)

  def set_preconditioner(self, preconditioner_name):
    (<NewtonSolver[double]*>self.thisptr).set_preconditioner(preconditioner_name)

  def get_setup_time(self):
    return (<NewtonSolver[double]*>self.thisptr).get_setup_time()
  def get_assemble_time(self):
    return (<NewtonSolver[double]*>self.thisptr).get_assemble_time()
  def get_solve_time(self):
    return (<NewtonSolver[double]*>self.thisptr).get_solve_time()

  def attach_timer(self, timer):
    (<NewtonSolver[double]*>self.thisptr).attach_timer((<PyTimePeriod>timer).thisptr)

  def reset_times(self):
    (<NewtonSolver[double]*>self.thisptr).reset_times()
    
    
cdef class PyNewtonSolverComplex(PyNonlinearSolverComplex):
  def __cinit__(self, dp, matrix_solver_type=None):
    if (type(self)!=PyNewtonSolverComplex):
      return
    if matrix_solver_type:
      self.thisptr=new NewtonSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr, matrix_solver_type)
    else:
      self.thisptr=new NewtonSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr)
  def solve(self, coeff_vec = None, newton_tol = None, newton_max_iter = None, residual_as_function = None):
    cdef cComplex[double] * c_coeff_vec
    if coeff_vec:
      c_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=cComplex[double](coeff_vec[i].real,coeff_vec[i].imag)
      if newton_tol:
        if newton_max_iter:
          if residual_as_function:
            (<NewtonSolver[cComplex[double]]*>self.thisptr).solve(c_coeff_vec, newton_tol, newton_max_iter, residual_as_function)
          else:
            (<NewtonSolver[cComplex[double]]*>self.thisptr).solve(c_coeff_vec, newton_tol, newton_max_iter)
        else:
          (<NewtonSolver[cComplex[double]]*>self.thisptr).solve(c_coeff_vec, newton_tol)
      else:
        (<NewtonSolver[cComplex[double]]*>self.thisptr).solve(c_coeff_vec)
      for i in range(len(coeff_vec)):
        delComplexes(c_coeff_vec)
    else:
      (<NewtonSolver[cComplex[double]]*>self.thisptr).solve()
  
  def solve_keep_jacobian(self, coeff_vec = None, newton_tol = None, newton_max_iter = None, residual_as_function = None):
    cdef cComplex[double] * c_coeff_vec
    if coeff_vec:
      c_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=cComplex[double](coeff_vec[i].real,coeff_vec[i].imag)
      if newton_tol:
        if newton_max_iter:
          if residual_as_function:
            (<NewtonSolver[cComplex[double]]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol, newton_max_iter, residual_as_function)
          else:
            (<NewtonSolver[cComplex[double]]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol, newton_max_iter)
        else:
          (<NewtonSolver[cComplex[double]]*>self.thisptr).solve_keep_jacobian(c_coeff_vec, newton_tol)
      else:
        (<NewtonSolver[cComplex[double]]*>self.thisptr).solve_keep_jacobian(c_coeff_vec)
      for i in range(len(coeff_vec)):
        delComplexes(c_coeff_vec)
    else:
      (<NewtonSolver[cComplex[double]]*>self.thisptr).solve_keep_jacobian()        

  def set_max_allowed_residual_norm(self, max_allowed_residual_norm_to_set):
    (<NewtonSolver[cComplex[double]]*>self.thisptr).set_max_allowed_residual_norm(max_allowed_residual_norm_to_set)

  def set_iterative_method(self, iterative_method_name):
    (<NewtonSolver[cComplex[double]]*>self.thisptr).set_iterative_method(iterative_method_name)

  def set_preconditioner(self, preconditioner_name):
    (<NewtonSolver[cComplex[double]]*>self.thisptr).set_preconditioner(preconditioner_name)

  def get_setup_time(self):
    return (<NewtonSolver[cComplex[double]]*>self.thisptr).get_setup_time()
  def get_assemble_time(self):
    return (<NewtonSolver[cComplex[double]]*>self.thisptr).get_assemble_time()
  def get_solve_time(self):
    return (<NewtonSolver[cComplex[double]]*>self.thisptr).get_solve_time()

  def attach_timer(self, timer):
    (<NewtonSolver[cComplex[double]]*>self.thisptr).attach_timer((<PyTimePeriod>timer).thisptr)

  def reset_times(self):
    (<NewtonSolver[cComplex[double]]*>self.thisptr).reset_times()
    
    

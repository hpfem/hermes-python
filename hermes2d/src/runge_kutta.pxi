cdef class PyRungeKuttaReal:
  def __cinit__(self, wf, spaces, bt, matrix_solver_type, start_from_zero_K_vector, residual_as_vector):
    if (type(self)!=PyRungeKuttaReal):
      return
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal s
    if isinstance(spaces,list):
      for s in spaces:
        cspaces(<Space[double]*> s.thisptr)
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, start_from_zero_K_vector, residual_as_vector)
          else:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, (<PyButcherTable>bt).thisptr)
    else:
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, start_from_zero_K_vector, residual_as_vector)
          else:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, (<PyButcherTable>bt).thisptr)

  def __dealloc__(self):
    del self.thisptr
    
    
  def use_global_projections(self):
    self.thisptr.use_global_projections()

  def use_local_projections(self):
    self.thisptr.use_local_projections()

  def multiply_as_diagonal_block_matrix(self, matrix_left, num_stages, stage_coeff_vec, vector_left):
    cdef double * c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
    for i in range(len(coeff_vec)):
      c_coeff_vec[i]=coeff_vec[i]
    cdef double * c_vector_left = <double*> newBuffer[double](len(vector_left))
    for i in range(len(vector_left)):
      c_vector_left[i]=vector_left[i]
    self.thisptr.multiply_as_diagonal_block_matrix(matrix_left, num_stages, cstage_coeff_vec, cvector_left)
    
  def rk_time_step_newton_time_error(self, current_time, time_step, slns_time_prev, slns_time_new, error_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionReal] cslns_time_prev
    cdef vector[pSolutionReal] cslns_time_new
    cdef vector[pSolutionReal] cerror_fns
    cdef PySolutionReal s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev(<Solution[double]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new(<Solution[double]*> s.thisptr)
      for s in error_fns:
        cerror_fns(<Solution[double]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm)
                  else:
                    self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff)
                else:
                  self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter)
              else:
                self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol)
            else:
              self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian, verbose)
          else:
            self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian, block_diagonal_jacobian)
        else:
          self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns, freeze_jacobian)
      else:
        self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, cerror_fns)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm)
                  else:
                    self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff)
                else:
                  self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter)
              else:
                self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol)
            else:
              self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose)
          else:
            self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian, block_diagonal_jacobian)
        else:
          self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr, freeze_jacobian)
      else:
        self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, (<PySolutionReal>error_fns).thisptr)
  
  def rk_time_step_newton(self, current_time, time_step, slns_time_prev, slns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionReal] cslns_time_prev
    cdef vector[pSolutionReal] cslns_time_new
    cdef PySolutionReal s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev(<Solution[double]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new(<Solution[double]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm)
                  else:
                    self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff)
                else:
                  self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter)
              else:
                self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol)
            else:
              self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian, verbose)
          else:
            self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian, block_diagonal_jacobian)
        else:
          self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new, freeze_jacobian)
      else:
        self.thisptr(current_time, time_step, cslns_time_prev, cslns_time_new)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm)
                  else:
                    self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff)
                else:
                  self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter)
              else:
                self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol)
            else:
              self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian, verbose)
          else:
            self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian, block_diagonal_jacobian)
        else:
          self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr, freeze_jacobian)
      else:
        self.thisptr(current_time, time_step, (<PySolutionReal>slns_time_prev).thisptr, (<PySolutionReal>slns_time_new).thisptr)
        
    def set_filters_to_reinit(filters_to_reinit):
      cdef vector[pSolutionComplex] cfilters_to_reinit
      cdef PyFilterReal f
      if solutions:
        for f in filters_to_reinit:
          cfilters_to_reinit.push_back(<Filter[double]*>f.thisptr)
      self.thisptr.set_filters_to_reinit(cfilters_to_reinit)
    
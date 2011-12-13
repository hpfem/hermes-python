cdef class PyRungeKuttaReal:
  def __cinit__(self, wf, spaces, bt, matrix_solver_type, start_from_zero_K_vector, residual_as_vector):
    if (type(self)!=PyRungeKuttaReal):
      return
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal s
    if isinstance(spaces,list):
      for s in spaces:
        cspaces.push_back(<Space[double]*> s.thisptr)
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector, <bool> residual_as_vector)
          else:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr)
    else:
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector, <bool> residual_as_vector)
          else:
            self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[double]((<PyWeakFormReal>wf).thisptr, (<PySpaceReal>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr)

  def __dealloc__(self):
    del self.thisptr
    
    
  def use_global_projections(self):
    self.thisptr.use_global_projections()

  def use_local_projections(self):
    self.thisptr.use_local_projections()

  def multiply_as_diagonal_block_matrix(self, matrix_left, num_stages, stage_coeff_vec, vector_left):
    cdef double * cstage_coeff_vec = <double*> newBuffer[double](len(stage_coeff_vec))
    for i in range(len(stage_coeff_vec)):
      cstage_coeff_vec[i]=stage_coeff_vec[i]
    cdef double * cvector_left = <double*> newBuffer[double](len(vector_left))
    for i in range(len(vector_left)):
      cvector_left[i]=vector_left[i]
    self.thisptr.multiply_as_diagonal_block_matrix(<SparseMatrix[double]*>(<PySparseMatrixReal>matrix_left).thisptr, num_stages, cstage_coeff_vec, cvector_left)
    
  def rk_time_step_newton_time_error(self, current_time, time_step, slns_time_prev, slns_time_new, error_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionReal] cslns_time_prev
    cdef vector[pSolutionReal] cslns_time_new
    cdef vector[pSolutionReal] cerror_fns
    cdef PySolutionReal s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev.push_back(<Solution[double]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new.push_back(<Solution[double]*> s.thisptr)
      for s in error_fns:
        cerror_fns.push_back(<Solution[double]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <Solution[double]*> (<PySolutionReal>error_fns).thisptr)
  
  def rk_time_step_newton(self, current_time, time_step, slns_time_prev, slns_time_new, freeze_jacobian,  block_diagonal_jacobian,  verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionReal] cslns_time_prev
    cdef vector[pSolutionReal] cslns_time_new
    cdef PySolutionReal s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev.push_back(<Solution[double]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new.push_back(<Solution[double]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[double]*> (<PySolutionReal>slns_time_prev).thisptr, <Solution[double]*> (<PySolutionReal>slns_time_new).thisptr)
        
    def set_filters_to_reinit(filters_to_reinit):
      cdef vector[pFilterReal] cfilters_to_reinit
      cdef PyFilterReal f
      for f in filters_to_reinit:
        cfilters_to_reinit.push_back(<Filter[double]*>f.thisptr)
      self.thisptr.set_filters_to_reinit(cfilters_to_reinit)    
      
      
cdef class PyRungeKuttaComplex:
  def __cinit__(self, wf, spaces, bt, matrix_solver_type, start_from_zero_K_vector, residual_as_vector):
    if (type(self)!=PyRungeKuttaComplex):
      return
    cdef vector[pSpaceComplex] cspaces
    cdef PySpaceComplex s
    if isinstance(spaces,list):
      for s in spaces:
        cspaces.push_back(<Space[cComplex[double]]*> s.thisptr)
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector, <bool> residual_as_vector)
          else:
            self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, cspaces, <ButcherTable*> (<PyButcherTable>bt).thisptr)
    else:
      if matrix_solver_type:
        if start_from_zero_K_vector:
          if residual_as_vector:
            self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, (<PySpaceComplex>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector, <bool> residual_as_vector)
          else:
            self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, (<PySpaceComplex>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type, <bool> start_from_zero_K_vector)
        else:
          self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, (<PySpaceComplex>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new RungeKutta[cComplex[double]]((<PyWeakFormComplex>wf).thisptr, (<PySpaceComplex>spaces).thisptr, <ButcherTable*> (<PyButcherTable>bt).thisptr)

  def __dealloc__(self):
    del self.thisptr
    
    
  def use_global_projections(self):
    self.thisptr.use_global_projections()

  def use_local_projections(self):
    self.thisptr.use_local_projections()

  def multiply_as_diagonal_block_matrix(self, matrix_left, num_stages, stage_coeff_vec, vector_left):
    cdef cComplex[double] * cstage_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(stage_coeff_vec))
    for i in range(len(stage_coeff_vec)):
      cstage_coeff_vec[i]=cComplex[double](stage_coeff_vec[i].real,stage_coeff_vec[i].imag)
    cdef cComplex[double] * cvector_left = <cComplex[double]*> newBuffer[cComplex[double]](len(vector_left))
    for i in range(len(vector_left)):
      cvector_left[i]=cComplex[double](vector_left[i].real,vector_left[i].imag)
    self.thisptr.multiply_as_diagonal_block_matrix(<SparseMatrix[cComplex[double]]*>(<PySparseMatrixComplex>matrix_left).thisptr, num_stages, cstage_coeff_vec, cvector_left)
    
  def rk_time_step_newton_time_error(self, current_time, time_step, slns_time_prev, slns_time_new, error_fns, freeze_jacobian, block_diagonal_jacobian, verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionComplex] cslns_time_prev
    cdef vector[pSolutionComplex] cslns_time_new
    cdef vector[pSolutionComplex] cerror_fns
    cdef PySolutionComplex s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev.push_back(<Solution[cComplex[double]]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new.push_back(<Solution[cComplex[double]]*> s.thisptr)
      for s in error_fns:
        cerror_fns.push_back(<Solution[cComplex[double]]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, cerror_fns)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>error_fns).thisptr)
  
  def rk_time_step_newton(self, current_time, time_step, slns_time_prev, slns_time_new, freeze_jacobian,  block_diagonal_jacobian,  verbose, newton_tol, newton_max_iter, newton_damping_coeff, newton_max_allowed_residual_norm):
    cdef vector[pSolutionComplex] cslns_time_prev
    cdef vector[pSolutionComplex] cslns_time_new
    cdef PySolutionComplex s
    if isinstance(slns_time_prev,list):
      for s in slns_time_prev:
        cslns_time_prev.push_back(<Solution[cComplex[double]]*> s.thisptr)
      for s in slns_time_new:
        cslns_time_new.push_back(<Solution[cComplex[double]]*> s.thisptr)
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, cslns_time_prev, cslns_time_new)
    else:
      if freeze_jacobian:
        if block_diagonal_jacobian:
          if verbose:
            if newton_tol:
              if newton_max_iter:
                if newton_damping_coeff:
                  if newton_max_allowed_residual_norm:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff, <double> newton_max_allowed_residual_norm)
                  else:
                    self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter, <double> newton_damping_coeff)
                else:
                  self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol, <int> newton_max_iter)
              else:
                self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose, <double> newton_tol)
            else:
              self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian, <bool> verbose)
          else:
            self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian, <bool> block_diagonal_jacobian)
        else:
          self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr, <bool> freeze_jacobian)
      else:
        self.thisptr.rk_time_step_newton(<double> current_time, <double> time_step, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_prev).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>slns_time_new).thisptr)
        
    def set_filters_to_reinit(filters_to_reinit):
      cdef vector[pFilterComplex] cfilters_to_reinit
      cdef PyFilterComplex f
      for f in filters_to_reinit:
        cfilters_to_reinit.push_back(<Filter[cComplex[double]]*>f.thisptr)
      self.thisptr.set_filters_to_reinit(cfilters_to_reinit)    
      
      
      
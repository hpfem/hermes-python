cdef class PyAdaptReal:
  def __cinit__(self, spaces, proj_norms = None):
    if type(self)!=PyAdaptReal:
      return

    cdef vector[pSpaceReal]ss
    cdef PySpaceReal s
    cdef vector[ProjNormType] pp
    cdef ProjNormType p
    
    if proj_norms is not None:
      if isinstance(proj_norms,list):
        for p in proj_norms:
          pp.push_back(p.thisptr)
        if isinstance(spaces, list):
          for s in spaces:
            ss.push_back(s.thisptr)
          self.thisptr = new Adapt[double](ss, pp)
      else:
        p = proj_norms
        s = spaces
        self.thisptr = new Adapt[double](s.thisptr, p)

  def __dealloc__(self):
    del self.thisptr
    
  def set_error_form(self, i, j, form):
    self.thisptr.set_error_form(i,j, (<PyMatrixFormVolErrorReal>form).thisptr)
  def  set_error_form(self, form):
    self.thisptr.set_error_form((<PyMatrixFormVolErrorReal>form).thisptr)
  def  set_norm_form(self, i, j, form):
    self.thisptr.set_norm_form(i,j,(<PyMatrixFormVolErrorReal>form).thisptr)
  def  set_norm_form(self, form):
    self.thisptr.set_norm_form((<PyMatrixFormVolErrorReal>form).thisptr)
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,):
    self.thisptr.calc_err_est((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt)
  def  calc_err_est(self, sln, rsln):
    self.thisptr.calc_err_est((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr)
    

  def  calc_err_est(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef vector[pSolutionReal] vector_csol_coarse
    cdef PySolutionReal sol_coarse = PySolutionReal(init = False)
    cdef vector[pSolutionReal] vector_csol_fine
    cdef PySolutionReal sol_fine = PySolutionReal(init = False)
    cdef vector[double] * ccomponent_errors = new vector[double]()
    cdef vector[double] e
      
    for sol_coarse in slns:
      vector_csol_coarse.push_back(sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(sol_fine.thisptr)
      
    if component_errors is not None:
      for e in component_errors:
        ccomponent_errors.push_back(e)
      if solutions_for_adapt is not None:
        if error_flags is not None:
          return self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, component_errors, solutions_for_adapt, error_flags)
        else:
          return self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, component_errors, solutions_for_adapt)
      else:
        return self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, component_errors)
      del ccomponent_errors
    else:
      return self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine)
  
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_exact((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt):
    self.thisptr.calc_err_exact((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt)
  def  calc_err_exact(self, sln, rsln):
    self.thisptr.calc_err_exact((<PySolutionReal>sln).thisptr, (<PySolutionReal>rsln).thisptr)

  def  calc_err_exact(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef vector[pSolutionReal] vector_csol_coarse
    cdef PySolutionReal sol_coarse = PySolutionReal(init = False)
    cdef vector[pSolutionReal] vector_csol_fine
    cdef PySolutionReal sol_fine = PySolutionReal(init = False)
    
    for sol_coarse in slns:
      vector_csol_coarse.push_back(sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(sol_fine.thisptr)
      
    if component_errors is not None:
      if solutions_for_adapt is not None:
        if error_flags is not None:
          return self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, component_errors, solutions_for_adapt, error_flags)
        else:
          return self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, component_errors, solutions_for_adapt)
      else:
        return self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, component_errors)
    else:
      return self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine)
    
  def  adapt(self, refinement_selectors, thr, strat, regularize, to_be_processed):
    self.thisptr.adapt(refinement_selectors, thr, strat, regularize, to_be_processed)
  def  adapt(self, refinement_selectors, thr, strat, regularize):
    self.thisptr.adapt(refinement_selectors, thr, strat, regularize)
  def  adapt(self, refinement_selectors, thr):
    self.thisptr.adapt(refinement_selectors, thr)
  def  adapt(self, refinement_selectors, thr, strat):
    self.thisptr.adapt(refinement_selectors, thr, strat)

  def  adapt(self, refinement_selector, thr, strat, regularize, to_be_processed):
    self.thisptr.adapt(refinement_selector, thr, strat, regularize, to_be_processed)
  def  adapt(self, refinement_selector, thr, strat, regularize):
    self.thisptr.adapt(refinement_selector, thr, strat, regularize)
  def  adapt(self, refinement_selector, thr, strat):
    self.thisptr.adapt(refinement_selector, thr, strat)
  def  adapt(self, refinement_selector, thr):
    self.thisptr.adapt(refinement_selector, thr)

  def  unrefine(self, thr):
    self.thisptr.unrefine(thr)

  def  get_element_error_squared(self, component, id):
    self.thisptr.get_element_error_squared(component, id)
    
cdef class PyMatrixFormVolErrorReal:
  def __cinit__(self, type):
    if (type(self)!=PyMatrixFormVolErrorReal):
      return 
    if type:
      self.thisptr=new Adapt[double].MatrixFormVolError(type)
    else:
      self.thisptr=new Adapt[double].MatrixFormVolError()
  def value(self, n, wt, u_ext, u, v, e, ext):
    return self.thisptr.value(n, wt, u_ext, u, v, e, ext)
  def ord(self, n, wt, u_ext, u, v, e, ext):
    return self.thisptr.ord(n, wt, u_ext, u, v, e, ext)    

cdef class PyAdaptComplex:
  def __cinit__(self, spaces, proj_norms = None):
    if type(self)!=PyAdaptComplex:
      return

    cdef vector[pSpaceComplex]ss
    cdef pSpaceComplex s
    cdef vector[ProjNormType] pp
    cdef ProjNormType p
    
    if proj_norms is not None:
      if isinstance(proj_norms,list):
        for p in proj_norms:
          pp.push_back(p.thisptr)
        if isinstance(spaces, list):
          for s in spaces:
            ss.push_back(s.thisptr)
          thisptr = new Adapt[cComplex[double]](ss, pp)
        else:
          s = spaces
          thisptr = new Adapt[cComplex[double]](s, pp)
      else:
        p = proj_norms
        if isinstance(spaces, list):
          for s in spaces:
            ss.push_back(s.thisptr)
          thisptr = new Adapt[cComplex[double]](ss, p)
        else:
          s = spaces
          thisptr = new Adapt[cComplex[double]](s, p)

  def __dealloc__(self):
    del self.thisptr
    
  def set_error_form(self, i, j, form):
    self.thisptr.set_error_form(i,j,(<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_error_form(self, form):
    self.thisptr.set_error_form((<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_norm_form(self, i, j, form):
    self.thisptr.set_norm_form(i,j,(<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_norm_form(self, form):
    self.thisptr.set_norm_form((<PyMatrixFormVolErrorComplex>form).thisptr)
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr.thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,):
    self.thisptr.calc_err_est((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr.thisptr, <bool>solutions_for_adapt)
  def  calc_err_est(self, sln, rsln):
    self.thisptr.calc_err_est((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr.thisptr)

  def  calc_err_est(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef vector[pSolutionComplex] vector_csol_coarse
    cdef PySolutionComplex sol_coarse = PySolutionComplex(init = False)
    cdef vector[pSolutionComplex] vector_csol_fine
    cdef PySolutionComplex sol_fine = PySolutionComplex(init = False)
    
    for sol_coarse in slns:
      vector_csol_coarse.push_back(sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(sol_fine.thisptr)
      
    if component_errors is not None:
      return self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, component_errors_solutions_for_adapt, error_flags)
  
    
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_exact((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt):
    self.thisptr.calc_err_exact((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt)
  def  calc_err_exact(self, sln, rsln):
    self.thisptr.calc_err_exact((<PySolutionComplex>sln).thisptr, (<PySolutionComplex>rsln).thisptr)

  def  calc_err_exact(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef vector[pSolutionComplex] vector_csol_coarse
    cdef PySolutionComplex sol_coarse = PySolutionComplex(init = False)
    cdef vector[pSolutionComplex] vector_csol_fine
    cdef PySolutionComplex sol_fine = PySolutionComplex(init = False)
    
    for sol_coarse in slns:
      vector_csol_coarse.push_back(sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(sol_fine.thisptr)
      
    if component_errors is not None:
      return self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, component_errors_solutions_for_adapt, error_flags)

    
  def  adapt(self, refinement_selectors, thr, strat, regularize, to_be_processed):
    self.thisptr.adapt(refinement_selectors, thr, strat, regularize, to_be_processed)
  def  adapt(self, refinement_selectors, thr, strat, regularize):
    self.thisptr.adapt(refinement_selectors, thr, strat, regularize)
  def  adapt(self, efinement_selectors, thr):
    self.thisptr.adapt(refinement_selectors, thr)
  def  adapt(self, refinement_selectors, thr, strat):
    self.thisptr.adapt(refinement_selectors, thr, strat)

  def  adapt(self, refinement_selector, thr, strat, regularize, to_be_processed):
    self.thisptr.adapt(refinement_selector, thr, strat, regularize, to_be_processed)
  def  adapt(self, refinement_selector, thr, strat, regularize):
    self.thisptr.adapt(refinement_selector, thr, strat, regularize)
  def  adapt(self, refinement_selector, thr, strat):
    self.thisptr.adapt(refinement_selector, thr, strat)
  def  adapt(self, refinement_selector, thr):
    self.thisptr.adapt(refinement_selector, thr)

  def  unrefine(self, thr):
    self.thisptr.unrefine(thr)

  def  get_element_error_squared(self, component, id):
    self.thisptr.get_element_error_squared(component, id)
    
cdef class PyMatrixFormVolErrorComplex:
  def __cinit__(self, type):
    if (type(self)!=PyMatrixFormVolErrorComplex):
      return 
    if type:
      self.thisptr=new Adapt[cComplex[double]].MatrixFormVolError(type)
    else:
      self.thisptr=new Adapt[cComplex[double]].MatrixFormVolError()
  def value(self, n, wt, u_ext, u, v, e, ext):
    return self.thisptr.value(n, wt, u_ext, u, v, e, ext)
  def ord(self, n, wt, u_ext, u, v, e, ext):
    return self.thisptr.ord(n, wt, u_ext, u, v, e, ext)    

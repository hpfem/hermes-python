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
    self.thisptr.set_error_form(i,j,form)
  def  set_error_form(self, form):
    self.thisptr.set_error_form(form)
  def  set_norm_form(self, i, j, form):
    self.thisptr.set_norm_form(i,j,form)
  def  set_norm_form(self, form):
    self.thisptr.set_norm_form(form)
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est(sln, rsln, solutions_for_adapt,  error_flags)
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,):
    self.thisptr.calc_err_est(sln, rsln, solutions_for_adapt)
  def  calc_err_est(self, sln, rsln):
    self.thisptr.calc_err_est(sln, rsln)
    
  def  calc_err_est(self, slns, rslns,  component_errors, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est(slns, rslns,  component_errors, solutions_for_adapt,  error_flags)
  def  calc_err_est(self, slns, rslns,  component_errors, solutions_for_adapt):
    self.thisptr.calc_err_est(slns, rslns,  component_errors, solutions_for_adapt)
  def  calc_err_est(self, slns, rslns,  component_errors):
    self.thisptr.calc_err_est(slns, rslns,  component_errors)
  def  calc_err_est(self, slns, rslns):
    self.thisptr.calc_err_est(slns, rslns)
    
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_exact(sln, rsln, solutions_for_adapt,  error_flags)
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt):
    self.thisptr.calc_err_exact(sln, rsln, solutions_for_adapt)
  def  calc_err_exact(self, sln, rsln):
    self.thisptr.calc_err_exact(sln, rsln)

  def  calc_err_exact(slns, rslns, component_errors, solutions_for_adapt, error_flags):
    self.thisptr.calc_err_exact(slns, rslns, component_errors, solutions_for_adapt, error_flags)
  def  calc_err_exact(slns, rslns, component_errors, solutions_for_adapt):
    self.thisptr.calc_err_exact(slns, rslns, component_errors, solutions_for_adapt)
  def  calc_err_exact(slns, rslns, component_errors):
    self.thisptr.calc_err_exact(slns, rslns, component_errors)
  def  calc_err_exact(slns, rslns):
    self.thisptr.calc_err_exact(slns, rslns)
    
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
    self.thisptr.set_error_form(i,j,form)
  def  set_error_form(self, form):
    self.thisptr.set_error_form(form)
  def  set_norm_form(self, i, j, form):
    self.thisptr.set_norm_form(i,j,form)
  def  set_norm_form(self, form):
    self.thisptr.set_norm_form(form)
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est(sln, rsln, solutions_for_adapt,  error_flags)
  def  calc_err_est(self, sln, rsln, solutions_for_adapt,):
    self.thisptr.calc_err_est(sln, rsln, solutions_for_adapt)
  def  calc_err_est(self, sln, rsln):
    self.thisptr.calc_err_est(sln, rsln)
    
  def  calc_err_est(self, slns, rslns,  component_errors, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_est(slns, rslns,  component_errors, solutions_for_adapt,  error_flags)
  def  calc_err_est(self, slns, rslns,  component_errors, solutions_for_adapt):
    self.thisptr.calc_err_est(slns, rslns,  component_errors, solutions_for_adapt)
  def  calc_err_est(self, slns, rslns,  component_errors):
    self.thisptr.calc_err_est(slns, rslns,  component_errors)
  def  calc_err_est(self, slns, rslns):
    self.thisptr.calc_err_est(slns, rslns)
    
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt,  error_flags):
    self.thisptr.calc_err_exact(sln, rsln, solutions_for_adapt,  error_flags)
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt):
    self.thisptr.calc_err_exact(sln, rsln, solutions_for_adapt)
  def  calc_err_exact(self, sln, rsln):
    self.thisptr.calc_err_exact(sln, rsln)

  def  calc_err_exact(self, slns, rslns, component_errors, solutions_for_adapt, error_flags):
    self.thisptr.calc_err_exact(slns, rslns, component_errors, solutions_for_adapt, error_flags)
  def  calc_err_exact(self, slns, rslns, component_errors, solutions_for_adapt):
    self.thisptr.calc_err_exact(slns, rslns, component_errors, solutions_for_adapt)
  def  calc_err_exact(self, slns, rslns, component_errors):
    self.thisptr.calc_err_exact(slns, rslns, component_errors)
  def  calc_err_exact(self, slns, rslns):
    self.thisptr.calc_err_exact(slns, rslns)
    
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

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
    else:
      if isinstance(spaces, list):
        for s in spaces:
          ss.push_back(s.thisptr)
        self.thisptr = new Adapt[double](ss)
      else:
        s = spaces
        self.thisptr = new Adapt[double](s.thisptr)

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
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt = None,  error_flags = None):
    if solutions_for_adapt is not None:
      if error_flags is not None:
        return self.thisptr.calc_err_est(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
      else:
        return self.thisptr.calc_err_est(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt)
    else:
      return self.thisptr.calc_err_est(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr)
    

  def calc_err_est(self, slns, rslns, component_errors = None, solutions_for_adapt = None, error_flags = None):
    cdef double result
    cdef vector[pSolutionReal] vector_csol_coarse
    cdef PySolutionReal sol_coarse = PySolutionReal(init = False)
    cdef vector[pSolutionReal] vector_csol_fine
    cdef PySolutionReal sol_fine = PySolutionReal(init = False)
    cdef vector[double]* ccomponent_errors = <vector[double]*> newBuffer[vector[double]](len(slns))
      
    for sol_coarse in slns:
      vector_csol_coarse.push_back(<Solution[double]*>sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(<Solution[double]*>sol_fine.thisptr)

    if component_errors is not None:
      for i in range(len(component_errors)):
        for j in range(len(component_errors[i])):
          ccomponent_errors[i].push_back(component_errors[(i, j)])
          
      if solutions_for_adapt is not None:
        if error_flags is not None:
          result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt, error_flags)
        else:
          result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt)
      else:
        result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors)
    else:
      result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine)
    
    del ccomponent_errors
    return result
  
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt = None,  error_flags = None):
    if solutions_for_adapt is not None:
      if error_flags is not None:
        return self.thisptr.calc_err_exact(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
      else:
        return self.thisptr.calc_err_exact(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr, <bool>solutions_for_adapt)
    else:
      return self.thisptr.calc_err_exact(<Solution[double]*> (<PySolutionReal>sln).thisptr, <Solution[double]*> (<PySolutionReal>rsln).thisptr)
  
  def  calc_err_exact(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef double result
    cdef vector[pSolutionReal] vector_csol_coarse
    cdef PySolutionReal sol_coarse = PySolutionReal(init = False)
    cdef vector[pSolutionReal] vector_csol_fine
    cdef PySolutionReal sol_fine = PySolutionReal(init = False)
    cdef vector[double]* ccomponent_errors = <vector[double]*> newBuffer[vector[double]](len(sol_coarse))
    
    for sol_coarse in slns:
      vector_csol_coarse.push_back(<Solution[double]*>sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(<Solution[double]*>sol_fine.thisptr)
      
    if component_errors is not None:
      for i in range(len(component_errors)):
        for j in range(len(component_errors[i])):
          ccomponent_errors[i].push_back(component_errors[(i, j)])
          
      if solutions_for_adapt is not None:
        if error_flags is not None:
          result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt, error_flags)
        else:
          result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt)
      else:
        result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors)
    else:
      result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine)
      
    del ccomponent_errors
    return result

  def  adapt(self, selectors, double thr, strat = None, regularize = None, to_be_processed = None):
    cdef vector[pSelectorReal] cselectors
    if isinstance(selectors, list):
      for s in selectors:
        cselectors.push_back((<PySelectorReal> s).thisptr)
      if strat:
        if regularize:
          if to_be_processed:
            self.thisptr.adapt(cselectors, thr, <int> strat, <int> regularize, <double> to_be_processed)
          else:
            self.thisptr.adapt(cselectors, thr, <int> strat, <int> regularize)
        else:
          self.thisptr.adapt(cselectors, thr, <int> strat)
      else:
        self.thisptr.adapt(cselectors, thr)
    else:
      if strat:
        if regularize:
          if to_be_processed:
            self.thisptr.adapt((<PySelectorReal> selectors).thisptr, thr, <int> strat, <int> regularize, <double> to_be_processed)
          else:
            self.thisptr.adapt((<PySelectorReal> selectors).thisptr, thr, <int> strat, <int> regularize)
        else:
          self.thisptr.adapt((<PySelectorReal> selectors).thisptr, thr, <int> strat)
      else:
        self.thisptr.adapt((<PySelectorReal> selectors).thisptr, thr)

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
    cdef double result = 0
    cdef double* cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal>u_ext[i]).thisptr

    result = self.thisptr.value(n, cwt, cu_ext, (<PyFuncReal> u).thisptr, (<PyFuncReal> v).thisptr, (<PyGeomReal> e).thisptr, (<PyExtDataReal> ext).thisptr)
      
    for i in range(len(u_ext)):
      del cu_ext[i]
    return result
        
  def ord(self, n, wt, u_ext, u, v, e, ext):
    cdef double* cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = ((<PyFuncOrd> u_ext[i]).thisptr)
  
    cdef PyOrd result = PyOrd(self.thisptr.ord(n, cwt, cu_ext, (<PyFuncOrd> u).thisptr, (<PyFuncOrd> v).thisptr, (<PyGeomOrd> e).thisptr, (<PyExtDataOrd> ext).thisptr).get_order())
    
    for i in range(len(u_ext)):
      del cu_ext[i]
    return result
    
    
cdef class PyAdaptComplex:
  def __cinit__(self, spaces, proj_norms = None):
    if type(self)!=PyAdaptComplex:
      return

    cdef vector[pSpaceComplex]ss
    cdef PySpaceComplex s
    cdef vector[ProjNormType] pp
    cdef ProjNormType p
    
    if proj_norms is not None:
      if isinstance(proj_norms,list):
        for p in proj_norms:
          pp.push_back(p.thisptr)
        if isinstance(spaces, list):
          for s in spaces:
            ss.push_back(s.thisptr)
          self.thisptr = new Adapt[cComplex[double]](ss, pp)
      else:
        p = proj_norms
        s = spaces
        self.thisptr = new Adapt[cComplex[double]](s.thisptr, p)
    else:
      if isinstance(spaces, list):
        for s in spaces:
          ss.push_back(s.thisptr)
        self.thisptr = new Adapt[cComplex[double]](ss)
      else:
        s = spaces
        self.thisptr = new Adapt[cComplex[double]](s.thisptr)

  def __dealloc__(self):
    del self.thisptr
    
  def set_error_form(self, i, j, form):
    self.thisptr.set_error_form(i,j, (<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_error_form(self, form):
    self.thisptr.set_error_form((<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_norm_form(self, i, j, form):
    self.thisptr.set_norm_form(i,j,(<PyMatrixFormVolErrorComplex>form).thisptr)
  def  set_norm_form(self, form):
    self.thisptr.set_norm_form((<PyMatrixFormVolErrorComplex>form).thisptr)
    
  def  calc_err_est(self, sln, rsln, solutions_for_adapt = None,  error_flags = None):
    if solutions_for_adapt is not None:
      if error_flags is not None:
        return self.thisptr.calc_err_est(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
      else:
        return self.thisptr.calc_err_est(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt)
    else:
      return self.thisptr.calc_err_est(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr)

  def calc_err_est(self, slns, rslns, component_errors = None, solutions_for_adapt = None, error_flags = None):
    cdef double result
    cdef vector[pSolutionComplex] vector_csol_coarse
    cdef PySolutionComplex sol_coarse = PySolutionComplex(init = False)
    cdef vector[pSolutionComplex] vector_csol_fine
    cdef PySolutionComplex sol_fine = PySolutionComplex(init = False)
    cdef vector[double]* ccomponent_errors = <vector[double]*> newBuffer[vector[double]](len(slns))
      
    for sol_coarse in slns:
      vector_csol_coarse.push_back(<Solution[cComplex[double]]*>sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(<Solution[cComplex[double]]*>sol_fine.thisptr)

    if component_errors is not None:
      for i in range(len(component_errors)):
        for j in range(len(component_errors[i])):
          ccomponent_errors[i].push_back(component_errors[(i, j)])
          
      if solutions_for_adapt is not None:
        if error_flags is not None:
          result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt, error_flags)
        else:
          result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt)
      else:
        result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine, ccomponent_errors)
    else:
      result = self.thisptr.calc_err_est(vector_csol_coarse, vector_csol_fine)
    
    del ccomponent_errors
    return result
  
  def  calc_err_exact(self, sln, rsln, solutions_for_adapt = None,  error_flags = None):
    if solutions_for_adapt is not None:
      if error_flags is not None:
        return self.thisptr.calc_err_exact(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt,  <unsigned> error_flags)
      else:
        return self.thisptr.calc_err_exact(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr, <bool>solutions_for_adapt)
    else:
      return self.thisptr.calc_err_exact(<Solution[cComplex[double]]*> (<PySolutionComplex>sln).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex>rsln).thisptr)

  def  calc_err_exact(self, slns, rslns,  component_errors = None, solutions_for_adapt = None,  error_flags = None):
    cdef double result
    cdef vector[pSolutionComplex] vector_csol_coarse
    cdef PySolutionComplex sol_coarse = PySolutionComplex(init = False)
    cdef vector[pSolutionComplex] vector_csol_fine
    cdef PySolutionComplex sol_fine = PySolutionComplex(init = False)
    cdef vector[double]* ccomponent_errors = <vector[double]*> newBuffer[vector[double]](len(sol_coarse))
    
    for sol_coarse in slns:
      vector_csol_coarse.push_back(<Solution[cComplex[double]]*>sol_coarse.thisptr)
      
    for sol_fine in slns:
      vector_csol_fine.push_back(<Solution[cComplex[double]]*>sol_fine.thisptr)
      
    if component_errors is not None:
      for i in range(len(component_errors)):
        for j in range(len(component_errors[i])):
          ccomponent_errors[i].push_back(component_errors[(i, j)])
          
      if solutions_for_adapt is not None:
        if error_flags is not None:
          result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt, error_flags)
        else:
          result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors, <bool>solutions_for_adapt)
      else:
        result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine, ccomponent_errors)
    else:
      result = self.thisptr.calc_err_exact(vector_csol_coarse, vector_csol_fine)
      
    del ccomponent_errors
    return result

  def  adapt(self, selectors, double thr, strat = None, regularize = None, to_be_processed = None):
    cdef vector[pSelectorComplex] cselectors
    if isinstance(selectors, list):
      for s in selectors:
        cselectors.push_back((<PySelectorComplex> s).thisptr)
      if strat:
        if regularize:
          if to_be_processed:
            self.thisptr.adapt(cselectors, thr, <int> strat, <int> regularize, <double> to_be_processed)
          else:
            self.thisptr.adapt(cselectors, thr, <int> strat, <int> regularize)
        else:
          self.thisptr.adapt(cselectors, thr, <int> strat)
      else:
        self.thisptr.adapt(cselectors, thr)
    else:
      if strat:
        if regularize:
          if to_be_processed:
            self.thisptr.adapt((<PySelectorComplex> selectors).thisptr, thr, <int> strat, <int> regularize, <double> to_be_processed)
          else:
            self.thisptr.adapt((<PySelectorComplex> selectors).thisptr, thr, <int> strat, <int> regularize)
        else:
          self.thisptr.adapt((<PySelectorComplex> selectors).thisptr, thr, <int> strat)
      else:
        self.thisptr.adapt((<PySelectorComplex> selectors).thisptr, thr)

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
    cdef double* cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex>u_ext[i]).thisptr

    cdef cComplex[double] result = self.thisptr.value(n, cwt, cu_ext, (<PyFuncComplex> u).thisptr, (<PyFuncComplex> v).thisptr, (<PyGeomReal> e).thisptr, (<PyExtDataComplex> ext).thisptr)
     
    for i in range(len(u_ext)):
      del cu_ext[i]
    return pcomplex(result)
        
  def ord(self, n, wt, u_ext, u, v, e, ext):
    cdef double* cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = ((<PyFuncOrd> u_ext[i]).thisptr)
  
    cdef PyOrd result = PyOrd(self.thisptr.ord(n, cwt, cu_ext, (<PyFuncOrd> u).thisptr, (<PyFuncOrd> v).thisptr, (<PyGeomOrd> e).thisptr, (<PyExtDataOrd> ext).thisptr).get_order())
    
    for i in range(len(u_ext)):
      del cu_ext[i]
    return result

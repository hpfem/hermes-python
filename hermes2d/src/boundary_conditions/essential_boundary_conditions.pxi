cdef class PyEssentialBoundaryConditionReal:
  """Abstract class"""
  def __dealloc__(self):
    del self.thisptr

  def get_value_type(self):
    return self.thisptr.get_value_type()

  def value(self,double x, double y, double n_x, double n_y, double t_x, double t_y):
    return self.thisptr.value(x, y, n_x, n_y, t_x, t_y)

  def set_current_time(self,double time):
    self.thisptr.set_current_time(time)

  def get_current_time(self):
    return self.thisptr.get_current_time()

cdef class PyEssentialBoundaryConditionComplex:
  """Abstract class"""
  def __dealloc__(self):
    del self.thisptr

  def get_value_type(self):
    return self.thisptr.get_value_type()

  def value(self,double x, double y, double n_x, double n_y, double t_x, double t_y):
    cdef cComplex[double] v = self.thisptr.value(x, y, n_x, n_y, t_x, t_y)
    r = complex(v.real(),v.imag())
    return r

  def set_current_time(self,double time):
    self.thisptr.set_current_time(time)

  def get_current_time(self):
    return self.thisptr.get_current_time()



cdef class PyDefaultEssentialBCConstReal(PyEssentialBoundaryConditionReal):
  def __cinit__(self,markers,value_const):
    cdef vector[string] v
    cdef string s
    cdef EssentialBoundaryCondition[double]* b
    if (type(self)!=PyDefaultEssentialBCConstReal):
      return
    if isinstance(markers,list):
      for m in markers:
        s.assign(<char*>m)
        v.push_back(s)
      self.thisptr=<EssentialBoundaryCondition[double]* > new DefaultEssentialBCConst[double](v, <double> value_const)
    else:
      s.assign(<char*>markers)
      self.thisptr=<EssentialBoundaryCondition[double]* > new DefaultEssentialBCConst[double](s,<double> value_const)

cdef class PyDefaultEssentialBCConstComplex(PyEssentialBoundaryConditionComplex):
  def __cinit__(self,markers,value_const):
    cdef cComplex[double] *value 
    cdef vector[string] v
    cdef string s
    cdef EssentialBoundaryCondition[cComplex[double]]* b
    if (type(self)!=PyDefaultEssentialBCConstReal):
      return
    value = new cComplex[double](value_const.real,value_const.imag)
    if isinstance(markers,list):
      for m in markers:
        s.assign(<char*>m)
        v.push_back(s)

      self.thisptr=<EssentialBoundaryCondition[cComplex[double]]* > new DefaultEssentialBCConst[cComplex[double]](v, value[0])
    else:
      s.assign(<char*>markers)
      self.thisptr=<EssentialBoundaryCondition[cComplex[double]]* > new DefaultEssentialBCConst[cComplex[double]](s, value[0])
    del value

cdef class PyDefaultEssentialBCNonConstReal(PyEssentialBoundaryConditionReal):
  def __cinit__(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if (type(self)!=PyDefaultEssentialBCNonConstReal):
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cmarkers, (<ExactSolutionScalar[double]*> (<PyExactSolutionScalarReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cmarker, (<ExactSolutionScalar[double]*> (<PyExactSolutionScalarReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cmarker)
        return
  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionScalarReal r = PyExactSolutionScalarReal(init = False)
      r.thisptr = <Transformable*> (<DefaultEssentialBCNonConst[double]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionScalarReal value):
      (<DefaultEssentialBCNonConst[double]*> self.thisptr).exact_solution = <ExactSolutionScalar[double]*> value.thisptr
    
cdef class PyDefaultEssentialBCNonConstHcurlReal(PyEssentialBoundaryConditionReal):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyExactSolutionVectorReal:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cmarkers, (<ExactSolutionVector[double]*> (<PyExactSolutionVectorReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cmarker, (<ExactSolutionVector[double]*> (<PyExactSolutionVectorReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cmarker)
        return 
  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionVectorReal r = PyExactSolutionVectorReal(init = False)
      r.thisptr = <Transformable*> (<DefaultEssentialBCNonConstHcurl[double]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionVectorReal value):
      (<DefaultEssentialBCNonConstHcurl[double]*> self.thisptr).exact_solution = <ExactSolutionVector[double]*> value.thisptr

cdef class PyEssentialBCsReal:
  def __cinit__(self, essential_bcs = None, init = True):
    cdef vector[pEssentialBoundaryConditionReal] cessential_bcs
    cdef PyEssentialBoundaryConditionReal bc
    if not init:
      return
    if type(self)!=PyEssentialBCsReal:
      return
    if essential_bcs is not None:
      if isinstance(essential_bcs,list):
        for bc in essential_bcs:
          cessential_bcs.push_back(bc.thisptr)
        self.thisptr = new EssentialBCs[double](cessential_bcs)
      else:
        self.thisptr = new EssentialBCs[double]((<PyEssentialBoundaryConditionReal> essential_bcs).thisptr)
    else:
      self.thisptr = new EssentialBCs[double]()

  def __dealloc__(self):
    del self.thisptr

  def add_boundary_conditions(self, essential_bcs):
    cdef vector[pEssentialBoundaryConditionReal] cessential_bcs
    cdef PyEssentialBoundaryConditionReal bc
    for bc in essential_bcs:
      cessential_bcs.push_back(bc.thisptr)
    self.thisptr.add_boundary_conditions(cessential_bcs)
  def add_boundary_condition(self, PyEssentialBoundaryConditionReal essential_bc):
    self.thisptr.add_boundary_condition(essential_bc.thisptr)
  def get_boundary_condition(self, char* marker):
    cdef string cmarker
    cdef PyEssentialBoundaryConditionReal r = PyEssentialBoundaryConditionReal()
    cmarker.assign(marker)
    r.thisptr = self.thisptr.get_boundary_condition(cmarker)
  def set_current_time(self, double time):
    self.thisptr.set_current_time(time)


cdef class PyDefaultEssentialBCNonConstComplex(PyEssentialBoundaryConditionComplex):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if (type(self)!=PyDefaultEssentialBCNonConstComplex):
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConst[cComplex[double] ](cmarkers, (<ExactSolutionScalar[cComplex[double] ]*> (<PyExactSolutionScalarComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConst[cComplex[double] ](cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConst[cComplex[double] ](cmarker, (<ExactSolutionScalar[cComplex[double] ]*> (<PyExactSolutionScalarComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConst[cComplex[double] ](cmarker)
        return
  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionScalarComplex r = PyExactSolutionScalarComplex(init = False)
      r.thisptr = <Transformable*> (<DefaultEssentialBCNonConst[cComplex[double]]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionScalarComplex value):
      (<DefaultEssentialBCNonConst[cComplex[double]]*> self.thisptr).exact_solution = <ExactSolutionScalar[cComplex[double]]*> value.thisptr

    
cdef class PyDefaultEssentialBCNonConstHcurlComplex(PyEssentialBoundaryConditionComplex):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyExactSolutionVectorComplex:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConstHcurl[cComplex[double] ](cmarkers, (<ExactSolutionVector[cComplex[double] ]*> (<PyExactSolutionVectorComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConstHcurl[cComplex[double] ](cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConstHcurl[cComplex[double] ](cmarker, (<ExactSolutionVector[cComplex[double] ]*> (<PyExactSolutionVectorComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new DefaultEssentialBCNonConstHcurl[cComplex[double] ](cmarker)
        return 
  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionVectorComplex r = PyExactSolutionVectorComplex(init = False)
      r.thisptr = <Transformable*> (<DefaultEssentialBCNonConstHcurl[cComplex[double]]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionVectorComplex value):
      (<DefaultEssentialBCNonConstHcurl[cComplex[double]]*> self.thisptr).exact_solution = <ExactSolutionVector[cComplex[double]]*> value.thisptr

cdef class PyEssentialBCsComplex:
  def __cinit__(self, essential_bcs = None, init = True):
    cdef vector[pEssentialBoundaryConditionComplex] cessential_bcs
    cdef PyEssentialBoundaryConditionComplex bc
    if not init:
      return
    if type(self)!=PyEssentialBCsComplex:
      return
    if essential_bcs is not None:
      if isinstance(essential_bcs,list):
        for bc in essential_bcs:
          cessential_bcs.push_back(bc.thisptr)
        self.thisptr = new EssentialBCs[cComplex[double]](cessential_bcs)
      else:
        self.thisptr = new EssentialBCs[cComplex[double]]((<PyEssentialBoundaryConditionComplex> essential_bcs).thisptr)
    else:
      self.thisptr = new EssentialBCs[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  def add_boundary_conditions(self, essential_bcs):
    cdef vector[pEssentialBoundaryConditionComplex] cessential_bcs
    cdef PyEssentialBoundaryConditionComplex bc
    for bc in essential_bcs:
      cessential_bcs.push_back(bc.thisptr)
    self.thisptr.add_boundary_conditions(cessential_bcs)
  def add_boundary_condition(self, PyEssentialBoundaryConditionComplex essential_bc):
    self.thisptr.add_boundary_condition(essential_bc.thisptr)
  def get_boundary_condition(self, char* marker):
    cdef string cmarker
    cdef PyEssentialBoundaryConditionComplex r = PyEssentialBoundaryConditionComplex()
    cmarker.assign(marker)
    r.thisptr = self.thisptr.get_boundary_condition(cmarker)
  def set_current_time(self, double time):
    self.thisptr.set_current_time(time)

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
  def __cinit__(self,markers, PyExactSolutionScalarReal exact_solution):
    cdef vector[string] cmarkers
    cdef string cm
    if (type(self)!=PyDefaultEssentialBCNonConstReal):
      return
    if isinstance(markers,list):
      for m in markers:
        cm.assign(<char*>m)
        cmarkers.push_back(cm)
      self.thisptr=<EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cmarkers, <ExactSolutionScalar[double]*> exact_solution.thisptr) 
    else:
      cm.assign(<char*> markers)
      self.thisptr=<EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConst[double](cm, <ExactSolutionScalar[double]*> exact_solution.thisptr) 

  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionScalarReal r = PyExactSolutionScalarReal(init = False)
      r.thisptr = <Solution[double]*> (<DefaultEssentialBCNonConst[double]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionScalarReal value):
      (<DefaultEssentialBCNonConst[double]*> self.thisptr).exact_solution = <ExactSolutionScalar[double]*> value.thisptr


cdef class PyDefaultEssentialBCNonConstHcurlReal(PyEssentialBoundaryConditionReal):
  def __cinit__(self, markers, PyExactSolutionVectorReal exact_solution2, init = True):
    cdef vector[string] cmarkers
    cdef string cm
    if not init:
      return;
    if type(self)!=PyExactSolutionVectorReal:
      return
    if isinstance(markers,list):
      for m in markers:
        cm.assign(<char*>m)
        cmarkers.push_back(cm)
      self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cmarkers,<ExactSolutionVector[double]*> exact_solution2.thisptr) 
    else:
      cm.assign(<char*>markers)
      self.thisptr = <EssentialBoundaryCondition[double]*> new DefaultEssentialBCNonConstHcurl[double](cm,<ExactSolutionVector[double]*> exact_solution2.thisptr) 
  property exact_solution2:
    def __get__(self):
      cdef PyExactSolutionVectorReal r = PyExactSolutionVectorReal(init = False)
      r.thisptr = <Solution[double]*> (<DefaultEssentialBCNonConstHcurl[double]*> self.thisptr).exact_solution2
      return r
    def __set__(self,PyExactSolutionVectorReal value):
      (<DefaultEssentialBCNonConstHcurl[double]*> self.thisptr).exact_solution2 = <ExactSolutionVector[double]*> value.thisptr

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
  def __cinit__(self,markers, PyExactSolutionScalarComplex exact_solution):
    cdef vector[string] cmarkers
    cdef string cm
    if (type(self)!=PyDefaultEssentialBCNonConstComplex):
      return
    if isinstance(markers,list):
      for m in markers:
        cm.assign(<char*>m)
        cmarkers.push_back(cm)
      self.thisptr=<EssentialBoundaryCondition[cComplex[double]]*> new DefaultEssentialBCNonConst[cComplex[double]](cmarkers, <ExactSolutionScalar[cComplex[double]]*> exact_solution.thisptr) 
    else:
      cm.assign(<char*> markers)
      self.thisptr=<EssentialBoundaryCondition[cComplex[double]]*> new DefaultEssentialBCNonConst[cComplex[double]](cm, <ExactSolutionScalar[cComplex[double]]*> exact_solution.thisptr) 

  property exact_solution:
    def __get__(self):
      cdef PyExactSolutionScalarComplex r = PyExactSolutionScalarComplex(init = False)
      r.thisptr = <Solution[cComplex[double]]*> (<DefaultEssentialBCNonConst[cComplex[double]]*> self.thisptr).exact_solution
      return r
    def __set__(self,PyExactSolutionScalarComplex value):
      (<DefaultEssentialBCNonConst[cComplex[double]]*> self.thisptr).exact_solution = <ExactSolutionScalar[cComplex[double]]*> value.thisptr


cdef class PyDefaultEssentialBCNonConstHcurlComplex(PyEssentialBoundaryConditionComplex):
  def __cinit__(self, markers, PyExactSolutionVectorComplex exact_solution2, init = True):
    cdef vector[string] cmarkers
    cdef string cm
    if not init:
      return;
    if type(self)!=PyExactSolutionVectorComplex:
      return
    if isinstance(markers,list):
      for m in markers:
        cm.assign(<char*>m)
        cmarkers.push_back(cm)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double]]*> new DefaultEssentialBCNonConstHcurl[cComplex[double]](cmarkers,<ExactSolutionVector[cComplex[double]]*> exact_solution2.thisptr) 
    else:
      cm.assign(<char*>markers)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double]]*> new DefaultEssentialBCNonConstHcurl[cComplex[double]](cm,<ExactSolutionVector[cComplex[double]]*> exact_solution2.thisptr) 
  property exact_solution2:
    def __get__(self):
      cdef PyExactSolutionVectorComplex r = PyExactSolutionVectorComplex(init = False)
      r.thisptr = <Solution[cComplex[double]]*> (<DefaultEssentialBCNonConstHcurl[cComplex[double]]*> self.thisptr).exact_solution2
      return r
    def __set__(self,PyExactSolutionVectorComplex value):
      (<DefaultEssentialBCNonConstHcurl[cComplex[double]]*> self.thisptr).exact_solution2 = <ExactSolutionVector[cComplex[double]]*> value.thisptr

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

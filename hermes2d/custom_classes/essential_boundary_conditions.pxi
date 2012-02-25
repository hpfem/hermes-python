cdef class PyCustomDefaultEssentialBCNonConstReal(PyDefaultEssentialBCNonConstReal):
  def __cinit__(self, markers = None, PyExactSolutionScalarReal exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyCustomDefaultEssentialBCNonConstReal:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarkers, (<ExactSolutionScalar[double]*> exact_solution.thisptr))
      return
    else:
      cmarker.assign(<char*> markers)
      self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarker, (<ExactSolutionScalar[double]*> exact_solution.thisptr))
      return

cdef class PyCustomDefaultEssentialBCNonConstHcurlReal(PyDefaultEssentialBCNonConstHcurlReal):
  def __cinit__(self, markers = None, PyExactSolutionVectorReal exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyCustomDefaultEssentialBCNonConstHcurlReal:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarkers, (<ExactSolutionVector[double]*> exact_solution.thisptr))
      return
    else:
      cmarker.assign(<char*> markers)
      self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarker, (<ExactSolutionVector[double]*> exact_solution.thisptr))
      return

cdef class PyCustomDefaultEssentialBCNonConstComplex(PyDefaultEssentialBCNonConstComplex):
  def __cinit__(self, markers = None, PyExactSolutionScalarComplex exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyCustomDefaultEssentialBCNonConstComplex:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarkers, (<ExactSolutionScalar[cComplex[double] ]*> exact_solution.thisptr))
      return
    else:
      cmarker.assign(<char*> markers)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarker, (<ExactSolutionScalar[cComplex[double] ]*> exact_solution.thisptr))
      return

cdef class PyCustomDefaultEssentialBCNonConstHcurlComplex(PyDefaultEssentialBCNonConstHcurlComplex):
  def __cinit__(self, markers = None, PyExactSolutionVectorComplex exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if type(self)!=PyCustomDefaultEssentialBCNonConstHcurlComplex:
      return
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarkers, (<ExactSolutionVector[cComplex[double] ]*> exact_solution.thisptr))
      return
    else:
      cmarker.assign(<char*> markers)
      self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarker, (<ExactSolutionVector[cComplex[double] ]*> exact_solution.thisptr))
      return
########################

cdef public double pyDefaultEssentialBCNonConstReal_value(object self, double x, double y, double n_x, double n_y, double t_x, double t_y):
  return self.value(x, y, n_x, n_y, t_x, t_y)
  
cdef public double pyDefaultEssentialBCNonConstHcurlReal_value(object self, double x, double y, double n_x, double n_y, double t_x, double t_y):
  return self.value(x, y, n_x, n_y, t_x, t_y)
  
cdef public cComplex[double] pyDefaultEssentialBCNonConstComplex_value(object self, double x, double y, double n_x, double n_y, double t_x, double t_y):
  return ccomplex(self.value(x, y, n_x, n_y, t_x, t_y))
  
cdef public cComplex[double] pyDefaultEssentialBCNonConstHcurlComplex_value(object self, double x, double y, double n_x, double n_y, double t_x, double t_y):
  return ccomplex(self.value(x, y, n_x, n_y, t_x, t_y))
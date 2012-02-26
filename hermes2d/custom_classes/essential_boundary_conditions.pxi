cdef class PyCustomDefaultEssentialBCNonConstReal(PyDefaultEssentialBCNonConstReal):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarkers, (<ExactSolutionScalar[double]*> (<PyExactSolutionScalarReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarker, (<ExactSolutionScalar[double]*> (<PyExactSolutionScalarReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConst[double](self, cmarker)
        return

cdef class PyCustomDefaultEssentialBCNonConstHcurlReal(PyDefaultEssentialBCNonConstHcurlReal):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarkers, (<ExactSolutionVector[double]*> (<PyExactSolutionVectorReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarker, (<ExactSolutionVector[double]*> (<PyExactSolutionVectorReal> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[double]*> new CustomDefaultEssentialBCNonConstHcurl[double](self, cmarker)
        return

cdef class PyCustomDefaultEssentialBCNonConstComplex(PyDefaultEssentialBCNonConstComplex):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarkers, (<ExactSolutionScalar[cComplex[double] ]*> (<PyExactSolutionScalarComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarker, (<ExactSolutionScalar[cComplex[double] ]*> (<PyExactSolutionScalarComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConst[cComplex[double] ](self, cmarker)
        return

cdef class PyCustomDefaultEssentialBCNonConstHcurlComplex(PyDefaultEssentialBCNonConstHcurlComplex):
  def super(self, markers = None, exact_solution = None, *args):
    cdef vector[string] cmarkers
    cdef string cmarker 
    if isinstance(markers,list):
      for s in markers:
        cmarker.assign(<char*> s)
        cmarkers.push_back(cmarker)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarkers, (<ExactSolutionVector[cComplex[double] ]*> (<PyExactSolutionVectorComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarkers)
        return
    else:
      cmarker.assign(<char*> markers)
      if exact_solution is not None:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarker, (<ExactSolutionVector[cComplex[double] ]*> (<PyExactSolutionVectorComplex> exact_solution).thisptr))
        return
      else:
        self.thisptr = <EssentialBoundaryCondition[cComplex[double] ]*> new CustomDefaultEssentialBCNonConstHcurl[cComplex[double] ](self, cmarker)
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
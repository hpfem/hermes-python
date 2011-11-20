cdef class PyHcurlSpaceReal(PySpaceReal):
  def __cinit__(self, PyMesh mesh, boundary_conditions = None, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyHcurlSpaceReal:
      return
    if not isinstance(boundary_conditions, PyEssentialBCsReal):
      p_init = boundary_conditions
      boundary_conditions = None 
    if boundary_conditions is not None:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr)
    else:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new HcurlSpace[double](mesh.thisptr)

  def load(self, char *filename, PyMesh mesh, essential_bcs = None, shapeset = None):
    if isinstance(essential_bcs, PyShapeset):
      shapeset = essential_bcs
      essential_bcs = None
    if essential_bcs is not None:
      if shapeset is not None:
        (<HcurlSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HcurlSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr)
    else:
      if shapeset is not None:
        (<HcurlSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HcurlSpace[double]*> self.thisptr).load(filename, mesh.thisptr)

cdef class PyHcurlSpaceComplex(PySpaceComplex):
  def __cinit__(self, PyMesh mesh, boundary_conditions = None, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyHcurlSpaceComplex:
      return
    if not isinstance(boundary_conditions, PyEssentialBCsComplex):
      p_init = boundary_conditions
      boundary_conditions = None 
    if boundary_conditions is not None:
      if shapeset is not None:
        self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr, <int> p_init)
        return
      self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr)
    else:
      if shapeset is not None:
        self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr, <int> p_init)
        return
      self.thisptr = <Space[cComplex[double]]*> new HcurlSpace[cComplex[double]](mesh.thisptr)

  def load(self, char *filename, PyMesh mesh, essential_bcs = None, shapeset = None):
    if isinstance(essential_bcs, PyShapeset):
      shapeset = essential_bcs
      essential_bcs = None
    if essential_bcs is not None:
      if shapeset is not None:
        (<HcurlSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsComplex> essential_bcs).thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HcurlSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsComplex> essential_bcs).thisptr)
    else:
      if shapeset is not None:
        (<HcurlSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HcurlSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr)

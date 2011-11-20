cdef class PyHdivSpaceReal(PySpaceReal):
  def __cinit__(self, PyMesh mesh, boundary_conditions = None, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyHdivSpaceReal:
      return
    if not isinstance(boundary_conditions, PyEssentialBCsReal):
      p_init = boundary_conditions
      boundary_conditions = None 
    if boundary_conditions is not None:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr)
    else:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new HdivSpace[double](mesh.thisptr)

  def load(self, char *filename, PyMesh mesh, essential_bcs = None, shapeset = None):
    if isinstance(essential_bcs, PyShapeset):
      shapeset = essential_bcs
      essential_bcs = None
    if essential_bcs is not None:
      if shapeset is not None:
        (<HdivSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HdivSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr)
    else:
      if shapeset is not None:
        (<HdivSpace[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HdivSpace[double]*> self.thisptr).load(filename, mesh.thisptr)

cdef class PyHdivSpaceComplex(PySpaceComplex):
  def __cinit__(self, PyMesh mesh, boundary_conditions = None, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyHdivSpaceComplex:
      return
    if not isinstance(boundary_conditions, PyEssentialBCsComplex):
      p_init = boundary_conditions
      boundary_conditions = None 
    if boundary_conditions is not None:
      if shapeset is not None:
        self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr, <int> p_init)
        return
      self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr, (<PyEssentialBCsComplex> boundary_conditions).thisptr)
    else:
      if shapeset is not None:
        self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr, <int> p_init)
        return
      self.thisptr = <Space[cComplex[double]]*> new HdivSpace[cComplex[double]](mesh.thisptr)

  def load(self, char *filename, PyMesh mesh, essential_bcs = None, shapeset = None):
    if isinstance(essential_bcs, PyShapeset):
      shapeset = essential_bcs
      essential_bcs = None
    if essential_bcs is not None:
      if shapeset is not None:
        (<HdivSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsComplex> essential_bcs).thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HdivSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsComplex> essential_bcs).thisptr)
    else:
      if shapeset is not None:
        (<HdivSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<HdivSpace[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr)

cdef class PyL2SpaceReal(PySpaceReal):
  def __cinit__(self, PyMesh mesh, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyL2SpaceReal:
      return
    if shapeset is not None:
      self.thisptr = <Space[double]*> new L2Space[double](mesh.thisptr, p_init, (<PyShapeset> shapeset).thisptr)
      return
    if p_init is not None:
      self.thisptr = <Space[double]*> new L2Space[double](mesh.thisptr, p_init)
      return
    self.thisptr = <Space[double]*> new L2Space[double](mesh.thisptr)
  def load(self, char *filename, PyMesh mesh, shapeset = None):
    if shapeset is not None:
      (<L2Space[double]*> self.thisptr).load(filename,  mesh.thisptr, (<PyShapeset>shapeset).thisptr)
    else:
      (<L2Space[double]*> self.thisptr).load(filename,  mesh.thisptr)

cdef class PyL2SpaceComplex(PySpaceComplex):
  def __cinit__(self, PyMesh mesh, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyL2SpaceComplex:
      return
    if shapeset is not None:
      self.thisptr = <Space[cComplex[double]]*> new L2Space[cComplex[double]](mesh.thisptr, p_init, (<PyShapeset> shapeset).thisptr)
      return
    if p_init is not None:
      self.thisptr = <Space[cComplex[double]]*> new L2Space[cComplex[double]](mesh.thisptr, p_init)
      return
    self.thisptr = <Space[cComplex[double]]*> new L2Space[cComplex[double]](mesh.thisptr)
  def load(self, char *filename, PyMesh mesh, shapeset = None):
    if shapeset is not None:
      (<L2Space[cComplex[double]]*> self.thisptr).load(filename,  mesh.thisptr, (<PyShapeset>shapeset).thisptr)
    else:
      (<L2Space[cComplex[double]]*> self.thisptr).load(filename,  mesh.thisptr)

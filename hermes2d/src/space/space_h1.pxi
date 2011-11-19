cdef class PyH1SpaceReal(PySpaceReal):
  def __cinit__(self,PyMesh mesh, boundary_conditions = None, p_init = None, shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyH1SpaceReal:
      return
    if isinstance(p_init,PyShapeset):
      shapeset = p_init
      p_init = None
    if not isinstance(boundary_conditions,PyEssentialBCsReal):
      p_init = boundary_conditions
      boundary_conditions = None

    if boundary_conditions is not None:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr, (<PyEssentialBCsReal> boundary_conditions).thisptr)
    else:
      if shapeset is not None:
        self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr, <int> p_init, (<PyShapeset> shapeset).thisptr)
        return
      if p_init is not None:
        self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr, <int> p_init)
        return
      self.thisptr = <Space[double]*> new H1Space[double](mesh.thisptr)

  def fix_vertex(self, int id, value = None):
    if value is not None:
      (<H1Space[double]*> self.thisptr).fix_vertex(id, value)
    else:
      (<H1Space[double]*> self.thisptr).fix_vertex(id)
  def load(self, char *filename, PyMesh mesh, essential_bcs = None, shapeset = None):
    if isinstance(essential_bcs,PyShapeset):
      shapeset = essential_bcs
      essential_bcs = None
    if essential_bcs is not None:
      if shapeset is not None:
        (<H1Space[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<H1Space[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyEssentialBCsReal> essential_bcs).thisptr)
    else:
      if shapeset is not None:
        (<H1Space[double]*> self.thisptr).load(filename, mesh.thisptr, (<PyShapeset> shapeset).thisptr)
      else:
        (<H1Space[double]*> self.thisptr).load(filename, mesh.thisptr)

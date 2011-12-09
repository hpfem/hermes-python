cdef class PyVectorView(PyView):
  def __cinit__(self,title = None, wg = None, init = True):
    if not init:
      return
    if type(self)!=PyVectorView:
      return
    if wg is not None:
      self.thisptr = <View*> new VectorView(title, (<PyWinGeom> wg).thisptr)
      return
    if title is not None:
      self.thisptr = <View*> new VectorView(title)
      return
    self.thisptr = <View*> new VectorView()
    return
  def show_vector(self, PyMeshFunctionReal sln, double eps = 0.0004):
    if eps is not None:
      (<VectorView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps)
    else:
      (<VectorView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr)
  def show_two_scalars_default(self, PyMeshFunctionReal xsln, PyMeshFunctionReal ysln, eps = None):
    if eps is not None:
      (<VectorView*> self.thisptr).show(<MeshFunction[double]*> xsln.thisptr, <MeshFunction[double]*> ysln.thisptr, eps)
    else:
      (<VectorView*> self.thisptr).show(<MeshFunction[double]*> xsln.thisptr, <MeshFunction[double]*> ysln.thisptr)
      return
  def show_two_scalars(self, PyMeshFunctionReal xsln, PyMeshFunctionReal ysln, double eps, int xitem, int yitem):
    (<VectorView*> self.thisptr).show(<MeshFunction[double]*> xsln.thisptr, <MeshFunction[double]*> ysln.thisptr, eps, xitem, yitem)
    return
  def set_grid_type(self, hexa):
    (<VectorView*> self.thisptr).set_grid_type(hexa)
    return
    
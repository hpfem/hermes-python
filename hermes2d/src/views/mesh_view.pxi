cdef class PyMeshView(PyView):
  def __cinit__(self, title=None, wg=None):
    if type(self)!=PyMeshView:
      return
    if wg is not None:
      self.thisptr= <View*> new MeshView(<char*> title, (<PyWinGeom> wg).thisptr )
      return
    if title is not None:
      self.thisptr= <View*> new MeshView(<char*> title)
      return

    self.thisptr= <View*> new MeshView()
  def show(self, PyMesh mesh):
    (<MeshView*> self.thisptr).show(mesh.thisptr)


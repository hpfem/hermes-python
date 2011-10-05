cdef class PyMeshReaderH2DXML:
  def __cinit__(self):
    self.thisptr = new MeshReaderH2DXML()
  def __dealloc__(self):
    del self.thisptr

  def load(self,filename, PyMesh mesh):
    return self.thisptr.load(filename,mesh.thisptr)

  def save(self,filename, PyMesh mesh):
    return self.thisptr.save(filename,mesh.thisptr)



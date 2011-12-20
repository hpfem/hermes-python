cdef class PyMeshReaderH1DXML:
  def __cinit__(self):
    self.thisptr = new MeshReaderH1DXML()
  def __dealloc__(self):
    del self.thisptr

  def load(self,char * filename, mesh):
    return self.thisptr.load(filename,(<PyMesh>mesh).thisptr)

  def save(self,char * filename, mesh):
    return self.thisptr.save(filename,(<PyMesh>mesh).thisptr)
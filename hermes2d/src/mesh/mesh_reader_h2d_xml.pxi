cdef class PyMeshReaderH2DXML:
  def __cinit__(self):
    self.thisptr = new MeshReaderH2DXML()
  def __dealloc__(self):
    del self.thisptr

  def load(self,char * filename, mesh):
    cdef vector[Mesh*] v
    cdef PyMesh m
    if isinstance(mesh,list):
      for m in mesh:
        v.push_back(m.thisptr)
      return self.thisptr.load(filename,v)
    else:
      return self.thisptr.load(filename,(<PyMesh>mesh).thisptr)
      
  def load_stream(self,char * stream, mesh):
    return self.thisptr.load_stream(stream,(<PyMesh>mesh).thisptr)

  def save(self,char * filename, mesh):
    cdef vector[Mesh*] v
    cdef PyMesh m
    if isinstance(mesh,list):
      for m in mesh:
        v.push_back(m.thisptr)
      return self.thisptr.save(filename,v)
    else:
      return self.thisptr.save(filename,(<PyMesh>mesh).thisptr)
      
  def save_stream(self, mesh):
    return self.thisptr.save_stream((<PyMesh>mesh).thisptr)
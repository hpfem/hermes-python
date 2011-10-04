cdef class PyMesh:
  def __cinit__(self):
    self.thisptr = new Mesh()
  def __dealloc__(self):
    del self.thisptr



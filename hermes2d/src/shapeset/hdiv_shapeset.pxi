cdef class PyHdivShapeset:
  def __cinit__(self):
    if (type(self)!=PyHdivShapeset): 
      return
    self.thisptr=new HdivShapeset()
    
  def __dealloc__(self):
    del self.thisptr
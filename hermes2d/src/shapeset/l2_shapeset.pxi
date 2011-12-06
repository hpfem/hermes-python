cdef class PyL2Shapeset:
  def __cinit__(self):
    if (type(self)!=PyL2Shapeset): 
      return
    self.thisptr=new L2Shapeset()
    
  def __dealloc__(self):
    del self.thisptr
cdef class PyH1Shapeset:
  def __cinit__(self):
    if (type(self)!=PyH1Shapeset): 
      return
    self.thisptr=new H1Shapeset()
    
  def __dealloc__(self):
    del self.thisptr
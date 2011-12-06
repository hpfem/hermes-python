cdef class PyHcurlShapeset:
  def __cinit__(self):
    if (type(self)!=PyHcurlShapeset): 
      return
    self.thisptr=new HcurlShapeset()
    
  def __dealloc__(self):
    del self.thisptr
cdef class PySurfPos:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!= PySurfPos:
      return
    self.thisptr = <SurfPos*> newBuffer[SurfPos](1)
  def __dealloc__(self):
    delBuffer[SurfPos](self.thisptr)

  property marker:
    def __set__(self, int value):
      self.thisptr.marker = value
    def __get__(self):
      return self.thisptr.marker
  property surf_num:
    def __set__(self, int value):
      self.thisptr.surf_num = value
    def __get__(self):
      return self.thisptr.surf_num
  property base:
    def __set__(self, PyElement value):
      self.thisptr.base = value.thisptr
    def __get__(self):
      cdef PyElement r = PyElement(init=False)
      r.thisptr = self.thisptr.base
      return r
  property v1:
    def __set__(self, int value):
      self.thisptr.v1 = value
    def __get__(self):
      return self.thisptr.v1
  property v2:
    def __set__(self, int value):
      self.thisptr.v2 = value
    def __get__(self):
      return self.thisptr.v2
  property t:
    def __set__(self, double value):
      self.thisptr.t = value
    def __get__(self):
      return self.thisptr.t
  property lo:
    def __set__(self, double value):
      self.thisptr.lo = value
    def __get__(self):
      return self.thisptr.lo
  property hi:
    def __set__(self, double value):
      self.thisptr.hi = value
    def __get__(self):
      return self.thisptr.hi

cdef class PyUniData:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!= PyUniData:
      return
    self.thisptr = <UniData*> newBuffer[UniData](1)
  def __dealloc__(self):
    delBuffer[UniData](self.thisptr)
  property e:
    def __set__(self, PyElement value):
      self.thisptr.e = value.thisptr
    def __get__(self):
      cdef PyElement r = PyElement(init=False)
      r.thisptr = self.thisptr.e
      return r
  property idx:
    def __set__(self, uint64_t value):
      self.thisptr.idx = value
    def __get__(self):
      return self.thisptr.idx

cdef class PyTraverse:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!= PyTraverse:
      return
    self.thisptr = new Traverse()
  def __dealloc__(self):
    del self.thisptr


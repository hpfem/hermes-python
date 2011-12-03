cdef class PyNurbs:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyNurbs:
      return
    self.thisptr = <Nurbs*> newBuffer[Nurbs](1)
    self.thisptr.ref = 0
    self.thisptr.twin = False
    self.thisptr.pt = NULL
  def __dealloc__(self):
    delBuffer[Nurbs](self.thisptr)

  def unref(self ):
    self.thisptr.unref()
  property degree:
    def __set__(self, int value):
      self.thisptr.degree = value
    def __get__(self):
      return self.thisptr.degree
  property np:
    def __set__(self, int value):
      self.thisptr.np = value
    def __get__(self):
      return self.thisptr.np
  property pt:
    def __set__(self, value):
      cdef int i
      if self.thisptr.pt != NULL:
        delBuffer[double3](self.thisptr.pt)
      self.thisptr.np = len(value)
      self.thisptr.pt = <double3*> newBuffer[double3](self.thisptr.np)
      for i in range(self.thisptr.np):
        self.thisptr.pt[i][0] = value[i][0]
        self.thisptr.pt[i][1] = value[i][1]
        self.thisptr.pt[i][2] = value[i][2]
    def __get__(self):
      cdef int i
      r = []
      for i in range(self.thisptr.np):
        r.append([self.thisptr.pt[i][0], self.thisptr.pt[i][1], self.thisptr.pt[i][2]])
      return r
  property nk:
    def __set__(self, int value):
      self.thisptr.nk = value
    def __get__(self):
      return self.thisptr.nk
  property kv:
    def __set__(self, value):
      cdef int i
      if self.thisptr.kv != NULL:
        delBuffer[double](self.thisptr.kv)
      self.thisptr.nk = len(value)
      self.thisptr.kv = <double*> newBuffer[double](self.thisptr.nk)
      for i in range(self.thisptr.nk):
        self.thisptr.kv[i] = value[i]
    def __get__(self):
      cdef int i
      r = []
      for i in range(self.thisptr.nk):
        r.append(self.thisptr.kv[i])
      return r
  property ref:
    def __set__(self, int value):
      self.thisptr.ref = value
    def __get__(self):
      return self.thisptr.ref
  property twin:
    def __set__(self, bool value):
      self.thisptr.twin = value
    def __get__(self):
      return self.thisptr.twin
  property arc:
    def __set__(self, bool value):
      self.thisptr.arc = value
    def __get__(self):
      return self.thisptr.arc
  property angle:
    def __set__(self, double value):
      self.thisptr.angle = value
    def __get__(self):
      return self.thisptr.angle

cdef class PyCurvMap:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyCurvMap:
      return
    self.thisptr = new CurvMap()

  def __dealloc__(self):
    del self.thisptr


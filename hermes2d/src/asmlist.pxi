
cdef class PyAsmListReal:
  def __cinit__(self):
    if (type(self)!=PyAsmListReal): 
      return
    self.thisptr=new AsmList[double]()
  def __dealloc__(self):
    del self.thisptr

  def get_idx(self):
    cdef int i
    cdef int * idx = self.thisptr.get_idx()
    r = []
    for i in range(self.thisptr.get_cnt()):
      r.append(idx[i])
    return r

  def get_dof(self):
    cdef int i
    cdef int * dof = self.thisptr.get_dof()
    r = []
    for i in range(self.thisptr.get_cnt()):
      r.append(dof[i])
    return r

  def get_cnt(self):
    return self.thisptr.get_cnt()

cdef class PyAsmListComplex:
  def __cinit__(self):
    if (type(self)!=PyAsmListComplex): 
      return
    self.thisptr=new AsmList[cComplex[double]]()
  def __dealloc__(self):
    del self.thisptr

  def get_idx(self):
    cdef int i
    cdef int * idx = self.thisptr.get_idx()
    r = []
    for i in range(self.thisptr.get_cnt()):
      r.append(idx[i])
    return r

  def get_dof(self):
    cdef int i
    cdef int * dof = self.thisptr.get_dof()
    r = []
    for i in range(self.thisptr.get_cnt()):
      r.append(dof[i])
    return r

  def get_cnt(self):
    return self.thisptr.get_cnt()

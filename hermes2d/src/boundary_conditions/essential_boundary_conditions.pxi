cdef class PyEssentialBoundaryConditionReal:
  """Abstract class"""
  def __dealloc__(self):
    del self.thisptr

  def get_value_type(self):
    return self.thisptr.get_value_type()

  def value(self,double x, double y, double n_x, double n_y, double t_x, double t_y):
    return self.thisptr.value(x, y, n_x, n_y, t_x, t_y)

  def set_current_time(self,double time):
    self.thisptr.set_current_time(time)

  def get_current_time(self):
    return self.thisptr.get_current_time()

cdef class PyEssentialBoundaryConditionComplex:
  """Abstract class"""
  def __dealloc__(self):
    del self.thisptr

  def get_value_type(self):
    return self.thisptr.get_value_type()

  def value(self,double x, double y, double n_x, double n_y, double t_x, double t_y):
    cdef cComplex[double] v = self.thisptr.value(x, y, n_x, n_y, t_x, t_y)
    r = complex(v.real(),v.imag())
    return r

  def set_current_time(self,double time):
    self.thisptr.set_current_time(time)

  def get_current_time(self):
    return self.thisptr.get_current_time()


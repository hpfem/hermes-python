H2D_TRF_TRI_NUM = 4
H2D_TRF_QUAD_NUM = 8
H2D_TRF_NUM = (H2D_TRF_QUAD_NUM + 1)
H2D_TRF_IDENTITY = H2D_TRF_QUAD_NUM


cdef class PyTransformable:
#  def __dealloc__(self): #TODO uncomment when destructor will be public
#    del self.thisptr
  def get_active_element(self):
    cdef PyElement e = PyElement()
    e.thisptr = self.thisptr.get_active_element()
    return e

  def set_transform(self, idx):
    self.thisptr.set_transform(idx)
  def get_transform(self):
    return  self.thisptr.get_transform()


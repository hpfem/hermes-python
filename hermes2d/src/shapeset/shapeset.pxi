cdef class PyShapeset:
  def get_order(self, int index):
    return self.thisptr.get_order(index)

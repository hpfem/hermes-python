cdef class PyCustomWeakFormReal(PyWeakFormReal):
  def __cinit__(self, neq = None, mat_free = None, *args):
    if mat_free is not None:
      self.thisptr = new WeakForm[double](neq,mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[double](neq)
      return
    self.thisptr = new WeakForm[double]()


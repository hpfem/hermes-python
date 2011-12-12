cdef class PyFilterReal(PyMeshFunctionReal):
  def reinit(self):
    (<Filter[double]*>self.thisptr).reinit()

cdef class PyFilterComplex(PyMeshFunctionComplex):
  def reinit(self):
    (<Filter[cComplex[double]]*>self.thisptr).reinit()
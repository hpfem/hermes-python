cdef class PyCustomExactSolutionScalarReal(PyExactSolutionScalarReal):
  def __cinit__(self, mesh):
    self.thisptr = < Transformable* > new CustomExactSolutionScalar[double](self, (<PyMesh> mesh).thisptr)
    return

cdef public double pyExactSolutionScalarReal_value(object self, double x, double y):
  return self.value(x, y)
  
cdef public double pyExactSolutionScalarReal_derivatives(object self, double x, double y, double& dx, double& dy):
  return self.derivatives(x, y, dx, dy)
 
cdef public Ord pyExactSolutionScalarReal_ord(object self, PyOrd x, PyOrd y):
  return (<PyOrd> self.ord(x, y)).thisptr[0]
  
cdef class PyCustomExactSolutionScalarComplex(PyExactSolutionScalarComplex):
  def __cinit__(self, mesh):
    self.thisptr = < Transformable* > new CustomExactSolutionScalar[double](self, (<PyMesh> mesh).thisptr)
    return

cdef public cComplex[double] pyExactSolutionScalarComplex_value(object self, double x, double y):
  return ccomplex(self.value(x, y))
  
cdef public cComplex[double] pyExactSolutionScalarComplex_derivatives(object self, double x, double y, cComplex[double]& dx, cComplex[double]& dy):
  return ccomplex(self.derivatives(x, y, pcomplex(dx), pcomplex(dy)))

cdef public Ord pyExactSolutionScalarComplex_ord(object self, PyOrd x, PyOrd y):
  return (<PyOrd> self.ord(x, y)).thisptr[0]
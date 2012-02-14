cdef class PyCustomExactSolutionScalarReal(PyExactSolutionScalarReal):
  def __cinit__(self, mesh):
    self.thisptr = < Solution[double]* > new CustomExactSolutionScalar[double](self, (<PyMesh> mesh).thisptr)
    return

cdef public double pyExactSolutionScalarReal_value(object self, double x, double y):
  return self.value(x, y)
  
cdef public void pyExactSolutionScalarReal_derivatives(object self, double x, double y, double& dx, double& dy):
  self.derivatives(x, y, dx, dy)
 
cdef public Ord pyExactSolutionScalarReal_ord(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.ord(px, py)).thisptr[0]
  
cdef class PyCustomExactSolutionScalarComplex(PyExactSolutionScalarComplex):
  def __cinit__(self, mesh):
    self.thisptr = < Solution[cComplex[double]]* > new CustomExactSolutionScalar[cComplex[double]](self, (<PyMesh> mesh).thisptr)
    return

cdef public cComplex[double] pyExactSolutionScalarComplex_value(object self, double x, double y):
  return ccomplex(self.value(x, y))
  
cdef public void pyExactSolutionScalarComplex_derivatives(object self, double x, double y, cComplex[double]& dx, cComplex[double]& dy):
  self.derivatives(x, y, pcomplex(dx), pcomplex(dy))

cdef public Ord pyExactSolutionScalarComplex_ord(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.ord(px, py)).thisptr[0]
  
  
cdef class PyCustomExactSolutionVectorReal(PyExactSolutionVectorReal):
  def __cinit__(self, mesh):
    self.thisptr = < Solution[double]* > new CustomExactSolutionVector[double](self, (<PyMesh> mesh).thisptr)
    return

cdef public Scalar2[double] pyExactSolutionVectorReal_value(object self, double x, double y):
  return (<PyScalar2Real> self.value(x, y)).thisptr[0]
  
cdef public void pyExactSolutionVectorReal_derivatives(object self, double x, double y, Scalar2[double]& dx, Scalar2[double]& dy):
  cdef PyScalar2Real pdx = PyScalar2Real(dx[0], dx[1])
  cdef PyScalar2Real pdy = PyScalar2Real(dy[0], dy[1])
  self.derivatives(x, y, pdx, pdy)
 
cdef public Ord pyExactSolutionVectorReal_ord(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.ord(px, py)).thisptr[0]
  
cdef class PyCustomExactSolutionVectorComplex(PyExactSolutionVectorComplex):
  def __cinit__(self, mesh):
    self.thisptr = < Solution[cComplex[double]]* > new CustomExactSolutionVector[cComplex[double]](self, (<PyMesh> mesh).thisptr)
    return

cdef public Scalar2[cComplex[double]] pyExactSolutionVectorComplex_value(object self, double x, double y):
  return (<PyScalar2Complex> self.value(x, y)).thisptr[0]
  
  
cdef public void pyExactSolutionVectorComplex_derivatives(object self, double x, double y, Scalar2[cComplex[double]]& dx, Scalar2[cComplex[double]]& dy):
  cdef PyScalar2Complex pdx = PyScalar2Complex(pcomplex(dx[0]), pcomplex(dx[1]))
  cdef PyScalar2Complex pdy = PyScalar2Complex(pcomplex(dy[0]), pcomplex(dy[1]))
  self.derivatives(x, y, pdx, pdy)
  
  
cdef public Ord pyExactSolutionVectorComplex_ord(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.ord(px, py)).thisptr[0]
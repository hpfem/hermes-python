cdef class PyExactSolutionReal(PySolutionReal):
  def get_dimension(self):
    return (<ExactSolution[double]* > self.thisptr).get_dimension()

cdef class PyExactSolutionScalarReal(PyExactSolutionReal): 
  def value (self, double x, double y):
    return (<ExactSolutionScalar[double]*> self.thisptr).value (x, y)
  def derivatives (self, double x, double y):
    """ returns [dx, dy] """
    cdef double dx = 0
    cdef double dy = 0
    (<ExactSolutionScalar[double]*> self.thisptr).derivatives (x, y, dx, dy)
    return [dx, dy]
  def exact_function (self, double x, double y):
    """ returns [value, dx, dy] """
    cdef double dx = 0
    cdef double dy = 0
    cdef double value = (<ExactSolutionScalar[double]*> self.thisptr).exact_function (x, y, dx, dy)
    return [value, dx, dy]
  def ord(self, PyOrd x, PyOrd y):
    cdef PyOrd r = PyOrd((<ExactSolutionScalar[double]*> self.thisptr).ord(x.thisptr[0], y.thisptr[0]).get_order())
    return r

cdef class PyExactSolutionVectorReal(PyExactSolutionReal):
  def value(self, double x, double y):
    cdef Scalar2[double] * r = new Scalar2[double](0,0)
    r[0]= (<ExactSolutionVector[double]*> self.thisptr).value (x, y)
    ret = [r[0][0], r[0][1]]
    del r
    return ret
  def derivatives (self, double x, double y):
    """ returns [dx, dy] """
    cdef Scalar2[double] * dx = new Scalar2[double](0,0)
    cdef Scalar2[double] * dy =  new Scalar2[double](0,0)
    (<ExactSolutionVector[double]*> self.thisptr).derivatives (x, y, dx[0], dy[0])
    ret = [ [dx[0][0], dx[0][1]], [dy[0][0], dy[0][1]]]
    del dx
    del dy
    return ret
  def exact_function(self, double x, double y):
    """ returns [value, dx, dy] """
    cdef Scalar2[double] * dx = new Scalar2[double](0,0)
    cdef Scalar2[double] * dy = new Scalar2[double](0,0)
    cdef Scalar2[double] * value = new Scalar2[double](0,0)
    value[0] = (<ExactSolutionVector[double]*> self.thisptr).exact_function(x, y, dx[0], dy[0])
    ret = [ [value[0][0], value[0][1]], [dx[0][0], dx[0][1]], [dy[0][0], dy[0][1]]] #TODO test
    del dx
    del dy
    del value
    return ret

  def ord(self, PyOrd x, PyOrd y):
    cdef PyOrd r = PyOrd((<ExactSolutionVector[double]*> self.thisptr).ord(x.thisptr[0], y.thisptr[0]).get_order())
    return r

cdef class PyConstantSolutionReal(PyExactSolutionScalarReal):
  def __cinit__(self, PyMesh mesh, double constant, init = True):
    if not init:
      return 
    if type(self)!=PyConstantSolutionReal:
      return
    self.thisptr = <Transformable*> new ConstantSolution[double](mesh.thisptr, constant)

cdef class PyZeroSolution(PyExactSolutionScalarReal):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolution:
      return
    self.thisptr = <Transformable*> new ZeroSolution(mesh.thisptr)

cdef class PyConstantSolutionVectorReal(PyExactSolutionVectorReal):
  def __cinit__(self, PyMesh mesh, double constantX, double constantY, init = True):
    if not init:
      return 
    if type(self)!=PyConstantSolutionVectorReal:
      return
    self.thisptr = <Transformable*> new ConstantSolutionVector[double](mesh.thisptr, constantX, constantY)

cdef class PyZeroSolutionVector(PyExactSolutionVectorReal):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolutionVector:
      return
    self.thisptr = <Transformable*> new ZeroSolutionVector(mesh.thisptr)


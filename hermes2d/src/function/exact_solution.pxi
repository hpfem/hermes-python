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

cdef class PyZeroSolutionReal(PyExactSolutionScalarReal):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolutionReal:
      return
    self.thisptr = <Transformable*> new ZeroSolution[double](mesh.thisptr)

cdef class PyConstantSolutionVectorReal(PyExactSolutionVectorReal):
  def __cinit__(self, PyMesh mesh, double constantX, double constantY, init = True):
    if not init:
      return 
    if type(self)!=PyConstantSolutionVectorReal:
      return
    self.thisptr = <Transformable*> new ConstantSolutionVector[double](mesh.thisptr, constantX, constantY)

cdef class PyZeroSolutionVectorReal(PyExactSolutionVectorReal):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolutionVectorReal:
      return
    self.thisptr = <Transformable*> new ZeroSolutionVector[double](mesh.thisptr)

cdef class PyExactSolutionComplex(PySolutionComplex):
  def get_dimension(self):
    return (<ExactSolution[cComplex[double]]* > self.thisptr).get_dimension()

cdef class PyExactSolutionScalarComplex(PyExactSolutionComplex): 
  def value (self, double x, double y):
    return pcomplex((<ExactSolutionScalar[cComplex[double]]*> self.thisptr).value(x, y))
  def derivatives (self, double x, double y):
    """ returns [dx, dy] """
    cdef cComplex[double] dx
    cdef cComplex[double] dy
    (<ExactSolutionScalar[cComplex[double]]*> self.thisptr).derivatives (x, y, dx, dy)
    return [pcomplex(dx), pcomplex(dy)]
  def exact_function (self, double x, double y):
    """ returns [value, dx, dy] """
    cdef cComplex[double] dx
    cdef cComplex[double] dy 
    cdef cComplex[double] value = (<ExactSolutionScalar[cComplex[double]]*> self.thisptr).exact_function (x, y, dx, dy)
    return [pcomplex(value), pcomplex(dx), pcomplex(dy)]
  def ord(self, PyOrd x, PyOrd y):
    cdef PyOrd r = PyOrd((<ExactSolutionScalar[cComplex[double]]*> self.thisptr).ord(x.thisptr[0], y.thisptr[0]).get_order())
    return r

cdef class PyExactSolutionVectorComplex(PyExactSolutionComplex):
  def value(self,double x, double y):
    cdef Scalar2[cComplex[double]] * r = new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    r[0]= (<ExactSolutionVector[cComplex[double]]*> self.thisptr).value (x, y)
    ret = [pcomplex(r[0][0]), pcomplex(r[0][1])]
    del r
    return ret
  def derivatives (self, double x, double y):
    """ returns [dx, dy] """
    cdef Scalar2[cComplex[double]] * dx = new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    cdef Scalar2[cComplex[double]] * dy =  new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    (<ExactSolutionVector[cComplex[double]]*> self.thisptr).derivatives (x, y, dx[0], dy[0])
    ret = [ [pcomplex(dx[0][0]), pcomplex(dx[0][1])], [pcomplex(dy[0][0]), pcomplex(dy[0][1])]]
    del dx
    del dy
    return ret
  def exact_function(self, double x, double y):
    """ returns [value, dx, dy] """
    cdef Scalar2[cComplex[double]] * dx = new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    cdef Scalar2[cComplex[double]] * dy = new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    cdef Scalar2[cComplex[double]] * value = new Scalar2[cComplex[double]](ccomplex(0),ccomplex(0))
    value[0] = (<ExactSolutionVector[cComplex[double]]*> self.thisptr).exact_function(x, y, dx[0], dy[0])
    ret = [ [pcomplex(value[0][0]), pcomplex(value[0][1])], [pcomplex(dx[0][0]), pcomplex(dx[0][1])], [pcomplex(dy[0][0]), pcomplex(dy[0][1])]] #TODO test
    del dx
    del dy
    del value
    return ret

  def ord(self, PyOrd x, PyOrd y):
    cdef PyOrd r = PyOrd((<ExactSolutionVector[cComplex[double]]*> self.thisptr).ord(x.thisptr[0], y.thisptr[0]).get_order())
    return r

cdef class PyConstantSolutionComplex(PyExactSolutionScalarComplex):
  def __cinit__(self, PyMesh mesh, complex constant, init = True):
    if not init:
      return 
    if type(self)!=PyConstantSolutionComplex:
      return
    self.thisptr = <Transformable*> new ConstantSolution[cComplex[double]](mesh.thisptr, ccomplex(constant))

cdef class PyZeroSolutionComplex(PyExactSolutionScalarComplex):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolutionComplex:
      return
    self.thisptr = <Transformable*> new ZeroSolution[cComplex[double]](mesh.thisptr)

cdef class PyConstantSolutionVectorComplex(PyExactSolutionVectorComplex):
  def __cinit__(self, PyMesh mesh, complex constantX, complex constantY, init = True):
    if not init:
      return 
    if type(self)!=PyConstantSolutionVectorComplex:
      return
    self.thisptr = <Transformable*> new ConstantSolutionVector[cComplex[double]](mesh.thisptr, ccomplex(constantX), ccomplex(constantY))

cdef class PyZeroSolutionVectorComplex(PyExactSolutionVectorComplex):
  def __cinit__(self, PyMesh mesh, init = True):
    if not init:
      return 
    if type(self)!=PyZeroSolutionVectorComplex:
      return
    self.thisptr = <Transformable*> new ZeroSolutionVector[cComplex[double]](mesh.thisptr)

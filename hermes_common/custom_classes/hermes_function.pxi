cdef class PyCustomHermes1DFunctionReal(PyHermes1DFunctionReal):
  def __cinit__(self):
    self.thisptr = new CustomHermes1DFunction[double](self)
    return

cdef public double pyHermes1DFunctionReal_value(object self, double x):
  return self.value(x)
  
cdef public double pyHermes1DFunctionReal_derivative(object self, double x):
  return self.derivative(x)
  
cdef public cComplex[double] pyHermes1DFunctionComplex_value(object self, cComplex[double] x):
  return ccomplex(self.value(pcomplex(x)))
  
cdef public cComplex[double] pyHermes1DFunctionComplex_derivative(object self, cComplex[double] x):
  return ccomplex(self.derivative(pcomplex(x)))

cdef public Ord pyHermes1DFunction_value(object self, Ord x):
  cdef PyOrd px = PyOrd(x.get_order())
  return (<PyOrd> self.value(px)).thisptr[0]
  
cdef public Ord pyHermes1DFunction_derivative(object self, Ord x):
  cdef PyOrd px = PyOrd(x.get_order())
  return (<PyOrd> self.derivative(px)).thisptr[0]


cdef class PyCustomHermes2DFunctionReal(PyHermes2DFunctionReal):
  def __cinit__(self):
    self.thisptr = new CustomHermes2DFunction[double](self)
    return

cdef public double pyHermes2DFunctionReal_value(object self, double x, double y):
  return self.value(x, y)
  
cdef public double pyHermes2DFunctionReal_derivative(object self, double x, double y):
  return self.derivative(x, y)
  
cdef public cComplex[double] pyHermes2DFunctionComplex_value(object self, cComplex[double] x, cComplex[double] y):
  return ccomplex(self.value(pcomplex(x), pcomplex(y)))
  
cdef public cComplex[double] pyHermes2DFunctionComplex_derivative(object self, cComplex[double] x, cComplex[double] y):
  return ccomplex(self.derivative(pcomplex(x), pcomplex(y)))

cdef public Ord pyHermes2DFunction_value(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.value(px, py)).thisptr[0]
  
cdef public Ord pyHermes2DFunction_derivative(object self, Ord x, Ord y):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  return (<PyOrd> self.derivative(px, py)).thisptr[0]
  
  
  
cdef class PyCustomHermes3DFunctionReal(PyHermes3DFunctionReal):
  def __cinit__(self):
    self.thisptr = new CustomHermes3DFunction[double](self)
    return

cdef public double pyHermes3DFunctionReal_value(object self, double x, double y, double z):
  return self.value(x, y, z)
  
cdef public double pyHermes3DFunctionReal_derivative(object self, double x, double y, double z):
  return self.derivative(x, y, z)
  
cdef public cComplex[double] pyHermes3DFunctionComplex_value(object self, cComplex[double] x, cComplex[double] y, cComplex[double] z):
  return ccomplex(self.value(pcomplex(x), pcomplex(y), pcomplex(z)))
  
cdef public cComplex[double] pyHermes3DFunctionComplex_derivative(object self, cComplex[double] x, cComplex[double] y, cComplex[double] z):
  return ccomplex(self.derivative(pcomplex(x), pcomplex(y), pcomplex(z)))

cdef public Ord pyHermes3DFunction_value(object self, Ord x, Ord y, Ord z):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  cdef PyOrd pz = PyOrd(z.get_order())
  return (<PyOrd> self.value(px, py, pz)).thisptr[0]
  
cdef public Ord pyHermes3DFunction_derivative(object self, Ord x, Ord y, Ord z):
  cdef PyOrd px = PyOrd(x.get_order())
  cdef PyOrd py = PyOrd(y.get_order())
  cdef PyOrd pz = PyOrd(z.get_order())
  return (<PyOrd> self.derivative(px, py, pz)).thisptr[0]
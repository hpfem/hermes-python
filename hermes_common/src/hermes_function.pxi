cdef class PyHermes1DFunctionReal:
  def __cinit__(self,value=None):
    if (type(self)!=PyHermes1DFunctionReal):
      return
    if value:
      self.thisptr=new Hermes1DFunction[double](value)
    else:
      self.thisptr=new Hermes1DFunction[double]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,double x):
    return self.thisptr.value(x)
  def value(self,PyOrd x):
    o=PyOrd(self.thisptr.value(x.thisptr[0]).get_order())
    return o
  def derivative(self,double x):
    return self.thisptr.derivative(x)
  def derivative(self,PyOrd x):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()

cdef class PyHermes1DFunctionComplex:
  def __cinit__(self,value=None):
    cdef cComplex[double] z
    if (type(self)!=PyHermes1DFunctionComplex):
      return
    if value:
      z=cComplex[double](value.real,value.imag)
      self.thisptr=new Hermes1DFunction[cComplex[double]](z)
    else:
      self.thisptr=new Hermes1DFunction[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,x):
    cdef cComplex[double] z=cComplex[double](x.real,x.imag)
    z=self.thisptr.value(z)
    return complex(z.real(),z.imag())
  def value(self,PyOrd x):
    o=PyOrd(self.thisptr.value(x.thisptr[0]).get_order())
    return o
  def derivative(self,x):
    cdef cComplex[double] z=cComplex[double](x.real,x.imag)
    z=self.thisptr.derivative(z)
    return complex(z.real(),z.imag())
  def derivative(self,PyOrd x):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()


cdef class PyHermes2DFunctionReal:
  def __cinit__(self,value=None):
    if (type(self)!=PyHermes2DFunctionReal):
      return
    if value:
      self.thisptr=new Hermes2DFunction[double](value)
    else:
      self.thisptr=new Hermes2DFunction[double]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,double x,double y):
    return self.thisptr.value(x,y)
  def value(self,PyOrd x,PyOrd y):
    o=PyOrd(self.thisptr.value(x.thisptr[0],y.thisptr[0]).get_order())
    return o
  def derivative(self,double x,double y):
    return self.thisptr.derivative(x,y)
  def derivative(self,PyOrd x,PyOrd y):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0],y.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()


cdef class PyHermes2DFunctionComplex:
  def __cinit__(self,value=None):
    if (type(self)!=PyHermes2DFunctionComplex):
      return
    if value:
      self.thisptr=new Hermes2DFunction[cComplex[double]](cComplex[double](value.real,value.imag))
    else:
      self.thisptr=new Hermes2DFunction[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,x,y):
    cdef cComplex[double] xc=cComplex[double](x.real,x.imag)
    cdef cComplex[double] yc=cComplex[double](y.real,y.imag)
    xc=self.thisptr.value(xc,yc)
    return complex(xc.real(),xc.imag())
  def value(self,PyOrd x,PyOrd y):
    o=PyOrd(self.thisptr.value(x.thisptr[0],y.thisptr[0]).get_order())
    return o
  def derivative(self,x,y):
    cdef cComplex[double] z
    z=self.thisptr.derivative(cComplex[double](x.real,x.imag),cComplex[double](y.real,y.imag))
    return complex(z.real(),z.imag())
  def derivative(self,PyOrd x,PyOrd y):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0],y.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()


cdef class PyHermes3DFunctionReal:
  def __cinit__(self,value=None):
    if (type(self)!=PyHermes3DFunctionReal):
      return
    if value:
      self.thisptr=new Hermes3DFunction[double](value)
    else:
      self.thisptr=new Hermes3DFunction[double]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,double x,double y,double z):
    return self.thisptr.value(x,y,z)
  def value(self,PyOrd x,PyOrd y, PyOrd z):
    o=PyOrd(self.thisptr.value(x.thisptr[0],y.thisptr[0], z.thisptr[0]).get_order())
    return o
  def derivative(self,double x,double y,double z):
    return self.thisptr.derivative(x,y,z)
  def derivative(self,PyOrd x,PyOrd y, PyOrd z):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0],y.thisptr[0], z.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()


cdef class PyHermes3DFunctionComplex:
  def __cinit__(self,value=None):
    if (type(self)!=PyHermes3DFunctionComplex):
      return
    if value:
      self.thisptr=new Hermes3DFunction[cComplex[double]](cComplex[double](value.real,value.imag))
    else:
      self.thisptr=new Hermes3DFunction[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  def value(self,x,y,z):
    cdef cComplex[double] r=self.thisptr.value(cComplex[double](x.real,x.imag),cComplex[double](y.real,y.imag),cComplex[double](z.real,z.imag))
    return complex(r.real(),r.imag())
  def value(self,PyOrd x,PyOrd y, PyOrd z):
    o=PyOrd(self.thisptr.value(x.thisptr[0],y.thisptr[0], z.thisptr[0]).get_order())
    return o
  def derivative(self,x,y,z):
    cdef cComplex[double] a
    a=self.thisptr.derivative(cComplex[double](x.real,x.imag),cComplex[double](y.real,y.imag),cComplex[double](z.real,z.imag))
    return complex(z.real(),z.imag())
  def derivative(self,PyOrd x,PyOrd y, PyOrd z):
    o=PyOrd(self.thisptr.derivative(x.thisptr[0],y.thisptr[0], z.thisptr[0]).get_order())
    return o
  def is_constant(self):
    return self.thisptr.is_constant()


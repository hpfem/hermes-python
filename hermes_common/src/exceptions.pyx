cdef class PyException:
  def __cinit__(self, msg = None):
    if type(self) != PyException:
      return
    if (msg is None):
      self.thisptr = new Exception()
    else:
      self.msg = msg
      self.thisptr = new Exception(msg)
  def __dealloc__(self):
    del self.thisptr
  def printMsg(self):
    self.thisptr.printMsg()
  def getMsg(self):
    return self.thisptr.getMsg()
  def getFuncName(self):
    return self.thisptr.getFuncName()

cdef class PyNullException(PyException):
  def __cinit__(self,int paramIdx, itemIdx = None):
    if type(self) != PyNullException:
      return
    if (itemIdx is None ):
      self.thisptr=<Exception *> new NullException(paramIdx)
    else:
      self.thisptr=<Exception *> new NullException(paramIdx, itemIdx)
  def getParamIdx(self):
    return (<NullException *>self.thisptr).getParamIdx()
  def getItemIdx(self):
    return (<NullException *>self.thisptr).getItemIdx()

cdef class PyLengthException(PyException):
  def __cinit__(self, int fstParamIdx, int a, int b, c=None):
    if type(self) != PyLengthException:
      return
    if (c is None):
      self.thisptr=<Exception *> new LengthException(fstParamIdx, a, b)
    else:
      self.thisptr=<Exception *> new LengthException(fstParamIdx, a, b, c)
  def getFirstParamIdx(self):
    return (<LengthException *>self.thisptr).getFirstParamIdx()
  def getSecondParamIdx(self):
    return (<LengthException *>self.thisptr).getSecondParamIdx()
  def getFirstLength(self):
    return (<LengthException *>self.thisptr).getFirstLength()
  def getExpectedLength(self):
    return (<LengthException *>self.thisptr).getExpectedLength()

cdef class PyLinearSolverException(PyException):
  def __cinit__(self, reason = None):
    if type(self) != PyLinearSolverException:
      return
    if (reason is None):
      self.thisptr=<Exception *> new LinearSolverException()
    else:
      self.thisptr=<Exception *> new LinearSolverException(reason)

cdef class PyValueException(PyException):
  def __cinit__(self, char * name, double value, double allowed1, allowed2=None):
    if type(self) != PyValueException:
      return
    if (allowed2 is None):
      self.thisptr=<Exception *> new ValueException( name, value, allowed1)
    else:
      self.thisptr=<Exception *> new ValueException( name, value, allowed1, allowed2)
  def getValue(self):
    return (<ValueException *>self.thisptr).getValue()
  def getAllowed(self):
    return (<ValueException *>self.thisptr).getAllowed()


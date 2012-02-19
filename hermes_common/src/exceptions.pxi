cdef class PyException:
  def __cinit__(self, msg = None,init = True,*args):
    if type(self) != PyException:
      return
    if not init:
      return
    if (msg is None):
      self.thisptr = new cException()
    else:
      self.msg = msg
      self.thisptr = new cException(msg)
  def __dealloc__(self):
    del self.thisptr
  def printMsg(self):
    self.thisptr.printMsg()
  def getMsg(self):
    return self.thisptr.getMsg()
  def getFuncName(self):
    return self.thisptr.getFuncName()
  def __repr__(self):
    return self.getMsg();
  def __str__(self):
    return self.getMsg();

cdef class PyNullException(PyException):
  def __cinit__(self,int paramIdx, itemIdx = None, init = True):
    if type(self) != PyNullException:
      return
    if not init:
      return
    if (itemIdx is None ):
      self.thisptr=<cException *> new NullException(paramIdx)
    else:
      self.thisptr=<cException *> new NullException(paramIdx, itemIdx)
  def getParamIdx(self):
    return (<NullException *>self.thisptr).getParamIdx()
  def getItemIdx(self):
    return (<NullException *>self.thisptr).getItemIdx()

cdef class PyLengthException(PyException):
  def __cinit__(self, int fstParamIdx, int a, int b, c=None, init = True):
    if type(self) != PyLengthException:
      return
    if not init:
      return
    if (c is None):
      self.thisptr=<cException *> new LengthException(fstParamIdx, a, b)
    else:
      self.thisptr=<cException *> new LengthException(fstParamIdx, a, b, c)
  def getFirstParamIdx(self):
    return (<LengthException *>self.thisptr).getFirstParamIdx()
  def getSecondParamIdx(self):
    return (<LengthException *>self.thisptr).getSecondParamIdx()
  def getFirstLength(self):
    return (<LengthException *>self.thisptr).getFirstLength()
  def getExpectedLength(self):
    return (<LengthException *>self.thisptr).getExpectedLength()

cdef class PyLinearSolverException(PyException):
  def __cinit__(self, reason = None, init = True):
    if type(self) != PyLinearSolverException:
      return
    if not init:
      return
    if (reason is None):
      self.thisptr=<cException *> new LinearSolverException()
    else:
      self.thisptr=<cException *> new LinearSolverException(reason)

cdef class PyValueException(PyException):
  def __cinit__(self,char * name , double value, double allowed1 , allowed2=None, init = True):
    if type(self) != PyValueException:
      return
    if not init:
      return
    if (allowed2 is None):
      self.thisptr=<cException *> new ValueException( name, value, allowed1)
    else:
      self.thisptr=<cException *> new ValueException( name, value, allowed1, allowed2)
  def getValue(self):
    return (<ValueException *>self.thisptr).getValue()
  def getAllowed(self):
    return (<ValueException *>self.thisptr).getAllowed()


#function to raise python exceptions
#these functions is called from translate_exceptions.cpp
#TODO preserve name of function with error (use init)

cdef public raiseException(cException*e):
  raise PyException(e.getMsg())

cdef public raiseNullException(NullException*e):
  raise PyNullException(e.getParamIdx(),e.getItemIdx())

cdef public raiseLengthException(LengthException*e):
  if (e.getSecondParamIdx()>-1):
    raise PyLengthException(e.getFirstParamIdx(),e.getSecondParamIdx(),e.getFirstLength(),e.getExpectedLength())
  else:
    raise PyLengthException(e.getFirstParamIdx(),e.getFirstLength(),e.getExpectedLength())

cdef public raiseLinearSolverException(LinearSolverException*e):
  raise PyLinearSolverException((<cException*>e).getMsg()) #TODO better message (this is recursive we need original mesage)

cdef public raiseValueException(ValueException*e):
  raise PyValueException("TODO value name",e.getValue(),e.getAllowed())


#function to raise python exceptions
#these functions is called from translate_exceptions.cpp
#TODO preserve name of function with error (use init)

cdef public raiseException(cException*e):
  cdef PyException pe = PyException(init = False)
  pe.thisptr  = e
  raise pe

cdef public raiseNullException(NullException*e):
  raise PyNullException(e.getParamIdx(),e.getItemIdx())

cdef public raiseLengthException(LengthException*e):
  cdef PyLengthException pe = PyLengthException(init = False)
  pe.thisptr = <cException*> e
  raise pe

cdef public raiseLinearSolverException(LinearSolverException*e):
  cdef PyLinearSolverException pe = PyLinearSolverException(init = False)
  pe.thisptr = <cException*> e
  raise pe 

cdef public raiseValueException(ValueException*e):
  cdef PyValueException pe = PyValueException('',0,0,0, False)
  pe.thisptr = <cException*> e
  raise pe


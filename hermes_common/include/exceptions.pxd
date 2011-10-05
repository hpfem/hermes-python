cdef extern from "exceptions.h" namespace "Hermes::Exceptions":
  cdef cppclass Exception:
    Exception()
    Exception(char * msg)
    void printMsg()
    char * getMsg()
    char * getFuncName()

  cdef cppclass NullException:
    NullException(int paramIdx)
    NullException(int paramIdx, int itemIdx)
    int getParamIdx()
    int getItemIdx()

  cdef cppclass LengthException:
    LengthException(int paramIdx, int wrong, int right)
    LengthException(int fstParamIdx, int sndParamIdx, int first, int second)
    int getFirstParamIdx()
    int getSecondParamIdx()
    int getFirstLength()
    int getExpectedLength()

  cdef cppclass LinearSolverException:
    LinearSolverException()
    LinearSolverException( char * reason)

  cdef cppclass ValueException:
    ValueException( char * name, double value, double allowed)
    ValueException( char * name, double value, double min, double max)
    double getValue()
    double getAllowed()

cdef class PyException:
  cdef Exception * thisptr
  cdef str msg #hermes needs constant string so string must not be freed

#cdef class PyNullException(PyException)
#cdef class LengthException(PyException)
#cdef class PyLinearSolverException(PyException)
#cdef class PyValueException(PyException)


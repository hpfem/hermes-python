cdef extern from "<complex>" namespace "std":
  cdef cppclass complex[T]:
    pass

from libcpp.string cimport string 
from libcpp cimport bool

include "include/common.pxd"
include "include/vector.pxd"
include "include/exceptions.pxd"

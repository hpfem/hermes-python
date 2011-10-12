cdef extern from "<complex>" namespace "std":
  cdef cppclass complex[T]:
    pass

from ctypes cimport complex as cComplex
from libcpp.string cimport string 
from libcpp cimport bool
from libc.stdio cimport FILE

include "include/common.pxd"
include "include/ord.pxd"
include "include/vector.pxd"
include "include/exceptions.pxd"
include "include/matrix.pxd"

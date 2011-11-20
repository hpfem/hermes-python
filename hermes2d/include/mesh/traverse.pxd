cdef extern from "stdint.h":
  ctypedef int uint64_t

cdef extern from "mesh/traverse.h" namespace "Hermes::Hermes2D":
  cdef struct SurfPos:
    int marker
    int surf_num
    Element *base
    int v1
    int v2
    double t
    double lo
    double hi

  cdef struct UniData:
    Element* e
    uint64_t idx

  cdef cppclass Traverse:
    pass

cdef class PyTraverse:
  cdef Traverse * thisptr

cdef class PyUniData:
  cdef UniData * thisptr

cdef class PySurfPos:
  cdef SurfPos * thisptr


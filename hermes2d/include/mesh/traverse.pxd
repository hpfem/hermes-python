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

  ctypedef int uint64_t
  cdef struct UniData:
    Element* e
    uint64_t idx

  cdef cppclass Traverse:
    pass


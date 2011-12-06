cdef extern from "shapeset/shapeset_l2_all.h" namespace "Hermes::Hermes2D":
  cdef cppclass L2Shapeset:
    L2Shapeset()

cdef class PyL2Shapeset:
  cdef L2Shapeset* thisptr

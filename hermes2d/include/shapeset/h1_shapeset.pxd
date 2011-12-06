cdef extern from "shapeset/shapeset_h1_all.h" namespace "Hermes::Hermes2D":
  cdef cppclass H1Shapeset:
    H1Shapeset()

cdef class PyH1Shapeset:
  cdef H1Shapeset* thisptr

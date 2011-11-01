cdef extern from "shapeset/shapeset.h" namespace "Hermes::Hermes2D":
  cdef cppclass Shapeset:
    int get_order(int index)

cdef class PyShapeset:
  cdef Shapeset* thisptr

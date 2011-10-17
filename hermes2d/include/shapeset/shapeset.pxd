cdef extern from "shapeset/shapeset.h" namespace "Hermes::Hermes2d":
  cdef cppclass Shapeset:
    int get_order(int index)

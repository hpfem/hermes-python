cdef extern from "shapeset/shapeset_hd_all.h" namespace "Hermes::Hermes2D":
  cdef cppclass HdivShapeset:
    HdivShapeset()
    
cdef class PyHdivShapeset:
  cdef HdivShapeset* thisptr

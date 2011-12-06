cdef extern from "shapeset/shapeset_hc_all.h" namespace "Hermes::Hermes2D":
  cdef cppclass HcurlShapeset:
    HcurlShapeset()
    
cdef class PyHcurlShapeset:
  cdef HcurlShapeset* thisptr

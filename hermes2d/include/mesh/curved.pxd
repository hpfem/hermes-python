cdef extern from "mesh/curved.h" namespace "Hermes::Hermes2D":
  struct Nurbs:
    Nurbs()
    void unref()
    int degree
    int np
    double3* pt
    int nk
    double* kv
    int ref
    bool twin
    bool arc
    double angle

  cdef cppclass CurvMap:
    pass

cdef class PyNurbs:
  cdef Nurbs * thisptr
cdef class PyCurvMap:
  cdef CurvMap * thisptr


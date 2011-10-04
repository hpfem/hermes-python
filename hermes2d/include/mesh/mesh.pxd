
cdef extern from "mesh/mesh.h" namespace "Hermes::Hermes2D":
  cdef cppclass Mesh:
    pass
#TODO

cdef class PyMesh:
  cdef Mesh * thisptr


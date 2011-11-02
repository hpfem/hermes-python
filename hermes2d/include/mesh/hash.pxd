cdef extern from "mesh/hash.h" namespace "Hermes::Hermes2D":
  cdef cppclass HashTable:
    pass

cdef class PyHashTable:
  cdef HashTable* thisptr

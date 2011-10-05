cdef extern from "vector.h" namespace "Hermes":
  cdef cppclass vector[T]:
    vector()
    void push_back(T a)


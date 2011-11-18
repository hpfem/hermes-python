cdef extern from "vector.h" namespace "Hermes":
  cdef cppclass vector[T]:
    vector()
    void push_back(T a)
    cppclass const_iterator:
      pass
    const_iterator begin()
    const_iterator end()
    int size()
    T at(int i)

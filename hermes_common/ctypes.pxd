cdef extern from "<complex>" namespace "std":
  cdef cppclass complex[T]:
    T real()
    T imag()


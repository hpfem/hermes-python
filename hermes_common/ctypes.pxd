cdef extern from "<complex>" namespace "std":
  cdef cppclass complex[T]:
    complex()
    complex(T real, T imag)
    T real()
    T imag()


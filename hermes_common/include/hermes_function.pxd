cdef extern from "hermes_function.h" namespace "Hermes":
  cdef cppclass Hermes1DFunction[Scalar]:
    Hermes1DFunction()
    Hermes1DFunction(Scalar value)
    Scalar value(Scalar x)
    Ord value(Ord x)
    Scalar derivative(Scalar x)
    Ord derivative(Ord x)
    bool is_constant()

  cdef cppclass Hermes2DFunction[Scalar]:
    Hermes2DFunction()
    Hermes2DFunction(Scalar value)
    Scalar value(Scalar x, Scalar y)
    Ord value(Ord x, Ord y)
    Scalar derivative(Scalar x, Scalar y)
    Ord derivative(Ord x, Ord y)
    bool is_constant()

  cdef cppclass Hermes3DFunction[Scalar]:
    Hermes3DFunction()
    Hermes3DFunction(Scalar value)
    Scalar value(Scalar x, Scalar y, Scalar z)
    Ord value(Ord x, Ord y, Ord z)
    Scalar derivative(Scalar x, Scalar y, Scalar z)
    Ord derivative(Ord x, Ord y, Ord z)
    bool is_constant()

cdef class PyHermes1DFunctionReal:
  cdef Hermes1DFunction[double] * thisptr

cdef class PyHermes1DFunctionComplex:
  cdef Hermes1DFunction[cComplex[double]] * thisptr

cdef class PyHermes2DFunctionReal:
  cdef Hermes2DFunction[double] * thisptr

cdef class PyHermes2DFunctionComplex:
  cdef Hermes2DFunction[cComplex[double]] * thisptr

cdef class PyHermes3DFunctionReal:
  cdef Hermes3DFunction[double] * thisptr

cdef class PyHermes3DFunctionComplex:
  cdef Hermes3DFunction[cComplex[double]] * thisptr


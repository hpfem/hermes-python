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
    Scalar derivativeX(Scalar x, Scalar y)
    Scalar derivativeY(Scalar x, Scalar y)
    Ord derivativeX(Ord x, Ord y)
    Ord derivativeY(Ord x, Ord y)
    bool is_constant()

  cdef cppclass Hermes3DFunction[Scalar]:
    Hermes3DFunction()
    Hermes3DFunction(Scalar value)
    Scalar value(Scalar x, Scalar y, Scalar z)
    Ord value(Ord x, Ord y, Ord z)
    Scalar derivativeX(Scalar x, Scalar y, Scalar z)
    Scalar derivativeY(Scalar x, Scalar y, Scalar z)
    Scalar derivativeZ(Scalar x, Scalar y, Scalar z)
    Ord derivativeX(Ord x, Ord y, Ord z)
    Ord derivativeY(Ord x, Ord y, Ord z)
    Ord derivativeZ(Ord x, Ord y, Ord z)
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


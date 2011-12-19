cdef extern from "custom_classes/hermes_function.h" namespace "Hermes":
  cdef cppclass CustomHermes1DFunction[Scalar]:
    CustomHermes1DFunction(object self)
  cdef cppclass CustomHermes2DFunction[Scalar]:
    CustomHermes2DFunction(object self)
  cdef cppclass CustomHermes3DFunction[Scalar]:
    CustomHermes3DFunction(object self)
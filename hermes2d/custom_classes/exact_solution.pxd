cdef extern from "custom_classes/exact_solution.h" namespace "Hermes::Hermes2D":
  cdef cppclass CustomExactSolutionScalar[Scalar]: # public CustomExactSolution[Scalar]
    CustomExactSolutionScalar(object self, Mesh* mesh)
  cdef cppclass CustomExactSolutionVector[Scalar]: # public CustomExactSolution[Scalar]
    CustomExactSolutionVector(object self, Mesh* mesh)
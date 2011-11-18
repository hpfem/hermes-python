cdef extern from "function/exact_solution.h" namespace "Hermes::Hermes2D":
  cdef cppclass ExactSolution[Scalar]: #Solution[Scalar]
    unsigned int get_dimension()

  cdef cppclass ExactSolutionScalar[Scalar]: #public ExactSolution[Scalar]
    Scalar value (double x, double y)
    void derivatives (double x, double y, Scalar& dx, Scalar& dy)
    Scalar exact_function (double x, double y, Scalar& dx, Scalar& dy)
    Ord ord(Ord x, Ord y)

  cdef cppclass ExactSolutionVector[Scalar]:# public ExactSolution[Scalar]
    Scalar2[Scalar] value (double x, double y)
    void derivatives (double x, double y, Scalar2[Scalar]& dx, Scalar2[Scalar]& dy)
    Scalar2[Scalar] exact_function(double x, double y, Scalar2[Scalar]& dx, Scalar2[Scalar]& dy)
    Ord ord(Ord x, Ord y)

  cdef cppclass ConstantSolution[Scalar]:# public ExactSolutionScalar[Scalar]
    ConstantSolution(Mesh* mesh, Scalar constant)

  cdef cppclass ZeroSolution: #public ExactSolutionScalar[double]
    ZeroSolution(Mesh* mesh)

  cdef cppclass ConstantSolutionVector[Scalar]: #public ExactSolutionVector[Scalar]
    ConstantSolutionVector(Mesh* mesh, Scalar constantX, Scalar constantY)

  cdef cppclass ZeroSolutionVector: #public ExactSolutionVector[double]
    ZeroSolutionVector(Mesh* mesh)


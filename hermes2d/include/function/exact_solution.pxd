cdef extern from "function/exact_solution.h" namespace "Hermes::Hermes2D":
  ctypedef void* pExactSolutionScalar "ExactSolutionScalar<Scalar>*" #cython error override
  ctypedef void* pExactSolutionScalarReal "Hermes::Hermes2D::ExactSolutionScalar<double>*" #cython error override
  ctypedef void* pExactSolutionScalarComplex "Hermes::Hermes2D::ExactSolutionScalar<std::complex<double> >*" #cython error override
  ctypedef void* pExactSolutionVector "ExactSolutionVector<Scalar>*" #cython error override
  ctypedef void* pExactSolutionVectorReal "Hermes::Hermes2D::ExactSolutionVector<double>*" #cython error override
  ctypedef void* pExactSolutionVectorComplex "Hermes::Hermes2D::ExactSolutionVector<std::complex<double> >*" #cython error override
  
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

  cdef cppclass ZeroSolution[Scalar]:# public ExactSolutionScalar[Scalar]
    ZeroSolution(Mesh* mesh)

  cdef cppclass ConstantSolutionVector[Scalar]: #public ExactSolutionVector[Scalar]
    ConstantSolutionVector(Mesh* mesh, Scalar constantX, Scalar constantY)

  cdef cppclass ZeroSolutionVector[Scalar]: #public ExactSolutionVector[Scalar]
    ZeroSolutionVector(Mesh* mesh)


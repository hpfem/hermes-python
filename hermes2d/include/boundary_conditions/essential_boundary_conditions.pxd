cdef extern from "boundary_conditions/essential_boundary_conditions.h" namespace "Hermes::Hermes2D":
  enum EssentialBCValueType:
    BC_FUNCTION
    BC_CONST

  cdef cppclass EssentialBoundaryCondition[Scalar]:
    EssentialBoundaryCondition(vector[string] markers)
    EssentialBoundaryCondition(string marker)


    EssentialBCValueType get_value_type()
    Scalar value(double x, double y, double n_x, double n_y, double t_x, double t_y)
    void set_current_time(double time)
    double get_current_time()


  cdef cppclass DefaultEssentialBCConst[Scalar]: #(EssentialBoundaryCondition[Scalar]):
    DefaultEssentialBCConst(vector[string] markers, Scalar value_const)
    DefaultEssentialBCConst(string marker, Scalar value_const)

  cdef cppclass DefaultEssentialBCNonConst[Scalar]:#(EssentialBoundaryCondition[Scalar])
    DefaultEssentialBCNonConst(vector[string] markers_, ExactSolutionScalar[Scalar]* exact_solution) 
    DefaultEssentialBCNonConst(string marker, ExactSolutionScalar[Scalar]* exact_solution) 
    ExactSolutionScalar[Scalar]* exact_solution

  cdef cppclass DefaultEssentialBCNonConstHcurl[Scalar]:#(EssentialBoundaryCondition[Scalar]):
    DefaultEssentialBCNonConstHcurl(vector[string] markers_, ExactSolutionVector[Scalar]* exact_solution2) 
    DefaultEssentialBCNonConstHcurl(string marker, ExactSolutionVector[Scalar]* exact_solution2) 
    ExactSolutionVector[Scalar]* exact_solution2

  ctypedef void* pEssentialBoundaryCondition "EssentialBoundaryCondition<Scalar>*" #cython error override
  cdef cppclass EssentialBCs[Scalar]:
    EssentialBCs()
    #EssentialBCs(vector[EssentialBoundaryCondition[Scalar]*] essential_bcs)
    EssentialBCs(vector[pEssentialBoundaryCondition] essential_bcs)
    EssentialBCs(EssentialBoundaryCondition[Scalar]* boundary_condition)
    void add_boundary_conditions(vector[pEssentialBoundaryCondition] essential_bcs)
    void add_boundary_condition(EssentialBoundaryCondition[Scalar]* essential_bc)
    vector[pEssentialBoundaryCondition].const_iterator iterator
    vector[pEssentialBoundaryCondition].const_iterator begin()
    vector[pEssentialBoundaryCondition].const_iterator end()
    EssentialBoundaryCondition[Scalar]* get_boundary_condition(string marker)
    void set_current_time(double time)


cdef class PyEssentialBoundaryConditionReal:
  cdef EssentialBoundaryCondition[double] * thisptr

cdef class PyEssentialBoundaryConditionComplex:
  cdef EssentialBoundaryCondition[cComplex[double]] * thisptr


cdef extern from "boundary_conditions/essential_boundary_conditions.h" namespace "Hermes::Hermes2D":
  enum EssentialBCValueType:
    BC_FUNCTION
    BC_CONST

  cdef cppclass EssentialBoundaryCondition[Scalar]:
    EssentialBCValueType get_value_type()
    Scalar value(double x, double y, double n_x, double n_y, double t_x, double t_y)
    void set_current_time(double time)
    double get_current_time()

  ctypedef void* pEssentialBoundaryConditionReal "EssentialBoundaryCondition<double>*"


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
  ctypedef void* pEssentialBoundaryConditionReal "Hermes::Hermes2D::EssentialBoundaryCondition<double>*" #cython error override
  ctypedef void* pEssentialBoundaryConditionComplex "Hermes::Hermes2D::EssentialBoundaryCondition<std::complex<double> >*" #cython error override
  cdef cppclass EssentialBCs[Scalar]:
    EssentialBCs()
    #EssentialBCs(vector[EssentialBoundaryCondition[Scalar]*] essential_bcs)
    EssentialBCs(vector[pEssentialBoundaryCondition] essential_bcs)
    EssentialBCs(EssentialBoundaryCondition[Scalar]* boundary_condition)
    void add_boundary_conditions(vector[pEssentialBoundaryCondition] essential_bcs)
    void add_boundary_condition(EssentialBoundaryCondition[Scalar]* essential_bc)
    vector[pEssentialBoundaryCondition].const_iterator iterator #TODO iterator acces
    vector[pEssentialBoundaryCondition].const_iterator begin()
    vector[pEssentialBoundaryCondition].const_iterator end()
    EssentialBoundaryCondition[Scalar]* get_boundary_condition(string marker)
    void set_current_time(double time)

  ctypedef void* pEssentialBCs "EssentialBCs<Scalar>*" #cython error override
  ctypedef void* pEssentialBCsReal "Hermes::Hermes2D::EssentialBCs<double>*" #cython error override
  ctypedef void* pEssentialBCsComplex "Hermes::Hermes2D::EssentialBCs<std::complex<double> >*" #cython error override


cdef class PyEssentialBoundaryConditionReal:
  cdef EssentialBoundaryCondition[double] * thisptr

cdef class PyEssentialBoundaryConditionComplex:
  cdef EssentialBoundaryCondition[cComplex[double]] * thisptr
 
cdef class PyDefaultEssentialBCNonConstReal(PyEssentialBoundaryConditionReal):
  pass
cdef class PyDefaultEssentialBCNonConstComplex(PyEssentialBoundaryConditionComplex):
  pass
cdef class PyDefaultEssentialBCNonConstHcurlReal(PyEssentialBoundaryConditionReal):
  pass
cdef class PyDefaultEssentialBCNonConstHcurlComplex(PyEssentialBoundaryConditionComplex):
  pass
  
cdef class PyEssentialBCsReal:
  cdef EssentialBCs[double] * thisptr

cdef class PyEssentialBCsComplex:
  cdef EssentialBCs[cComplex[double]] * thisptr
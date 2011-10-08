cdef extern from "boundary_conditions/essential_boundary_conditions.h" namespace "Hermes::Hermes2D":
  cdef cppclass EssentialBoundaryCondition[Scalar]:
    EssentialBoundaryCondition(vector[string] markers)
    EssentialBoundaryCondition(string marker)


    EssentialBCValueType get_value_type()
    Scalar value(double x, double y, double n_x, double n_y, double t_x, double t_y)
    void set_current_time(double time)
    double get_current_time()

  enum EssentialBCValueType:
    BC_FUNCTION
    BC_CONST

cdef class PyEssentialBoundaryConditionReal:
  cdef EssentialBoundaryCondition[double] * thisptr

cdef class PyEssentialBoundaryConditionComplex:
  cdef EssentialBoundaryCondition[cComplex[double]] * thisptr


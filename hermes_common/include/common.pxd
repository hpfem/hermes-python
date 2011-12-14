cdef extern from "common.h" :
  cdef cppclass Scalar2[Scalar]:
    Scalar2()
    Scalar2(Scalar v1, Scalar v2)
    Scalar operator[](int idx)
  cdef cppclass Scalar3[Scalar]:
    Scalar3(Scalar v1, Scalar v2, Scalar v3)
    Scalar operator[](int idx)

  ctypedef int int2[2]
  ctypedef int int3[3]
  ctypedef int int4[4]
  ctypedef int int5[5]

  ctypedef double double2[2]
  ctypedef double double3[3]
  ctypedef double double4[4]
  ctypedef double double2x2[2][2]
  ctypedef double double3x2[3][2]
  ctypedef double double3x3[3][3]

cdef extern from "common.h" namespace "Hermes":
  enum MatrixSolverType:
    SOLVER_UMFPACK = 0
    SOLVER_PETSC
    SOLVER_MUMPS
    SOLVER_SUPERLU
    SOLVER_AMESOS
    SOLVER_AZTECOO

  cdef struct SplineCoeff:
    double a
    double b
    double c
    double d

  cdef string HERMES_ANY
  cdef int HERMES_ANY_INT = -1234
  cdef string H2D_DG_BOUNDARY_EDGE = "-12345"
  cdef string H2D_DG_INNER_EDGE = "-1234567"
  cdef int H2D_DG_INNER_EDGE_INT = -1234567
  cdef int H2D_DG_BOUNDARY_EDGE_INT = -12345
  cdef int HERMES_DUMMY_ELEM_MARKER = -9999
  cdef int HERMES_DUMMY_EDGE_MARKER = -8888

cdef extern from "common.h" namespace "Hermes::Helpers":
  cdef cppclass CommandLineArgs:
    CommandLineArgs()
    int m_argc
    char** m_argv
    void set(int argc_in, char** argv_in)
    bool check()
    void missing_error()
    int& get_argc()
    char**& get_argv()

cdef class PyScalar2Real:
  cdef Scalar2[double] * thisptr

cdef class PyScalar2Complex:
  cdef Scalar2[cComplex[double]] * thisptr
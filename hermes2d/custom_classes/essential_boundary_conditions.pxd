cdef extern from "custom_classes/essential_boundary_conditions.h" namespace "Hermes::Hermes2D":
  cdef cppclass CustomDefaultEssentialBCNonConst[Scalar]: # DefaultEssentialBCNonConst[Scalar]
    CustomDefaultEssentialBCNonConst(object self, vector[string] markers_, pExactSolutionScalar exact_solution)
    CustomDefaultEssentialBCNonConst(object self, string marker, pExactSolutionScalar exact_solution)

  cdef cppclass CustomDefaultEssentialBCNonConstHcurl[Scalar]: # DefaultEssentialBCNonConstHcurl[Scalar]
    CustomDefaultEssentialBCNonConstHcurl(object self, vector[string] markers_, pExactSolutionVector exact_solution)
    CustomDefaultEssentialBCNonConstHcurl(object self, string marker, pExactSolutionVector exact_solution)

cdef class PyCustomDefaultEssentialBCNonConstReal(PyDefaultEssentialBCNonConstReal):
  pass
cdef class PyCustomDefaultEssentialBCNonConstComplex(PyDefaultEssentialBCNonConstComplex):
  pass

cdef class PyCustomDefaultEssentialBCNonConstHcurlReal(PyDefaultEssentialBCNonConstHcurlReal):
  pass
cdef class PyCustomDefaultEssentialBCNonConstHcurlComplex(PyDefaultEssentialBCNonConstHcurlComplex):
  pass
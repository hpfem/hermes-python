cdef extern from "function/filter.h" namespace "Hermes::Hermes2D":
  ctypedef void* pFilter "Filter<Scalar>*" #cython error override
  ctypedef void* pFilterReal "Hermes::Hermes2D::Filter<double>*" #cython error override
  ctypedef void* pFilterComplex "Hermes::Hermes2D::Filter<std::complex<double> >*" #cython error override
  cdef cppclass Filter[Scalar]:# public MeshFunction[Scalar] Abstract
    Filter()
    Filter(vector[pMeshFunction] solutions)
    Filter(vector[pSolution] solutions)
    void reinit()
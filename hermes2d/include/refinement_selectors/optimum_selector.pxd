cdef extern from "refinement_selectors/optimum_selector.h" namespace "Hermes::Hermes2D::RefinementSelectors":
  ctypedef void* pSelector "Selector<Scalar>*" #cython error override
  ctypedef void* pSelectorReal "Hermes::Hermes2D::Selector<double>*" #cython error override
  ctypedef void* pSelectorComplex "Hermes::Hermes2D::Selector<std::complex<double> >*" #cython error override
  cdef cppclass Selector[Scalar]:
    Selector()
    
  enum CandList:
    H2D_NONE,
    H2D_P_ISO,
    H2D_P_ANISO,
    H2D_H_ISO,
    H2D_H_ANISO,
    H2D_HP_ISO,
    H2D_HP_ANISO_H,
    H2D_HP_ANISO_P,
    H2D_HP_ANISO
    
cdef class PySelectorReal:
  cdef Selector[double]* thisptr

cdef class PySelectorComplex:
  cdef Selector[cComplex[double]]* thisptr
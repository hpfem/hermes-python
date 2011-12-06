cdef extern from "refinement_selectors/l2_proj_based_selector.h" namespace "Hermes::Hermes2D::RefinementSelectors":
  ctypedef void* pL2ProjBasedSelector "Hermes::Hermes2D::RefinementSelectors::L2ProjBasedSelector<Scalar>*" #cython error override
  ctypedef void* pL2ProjBasedSelectorReal "Hermes::Hermes2D::RefinementSelectors::L2ProjBasedSelector<double>*" #cython error override
  ctypedef void* pL2ProjBasedSelectorComplex "Hermes::Hermes2D::RefinementSelectors::L2ProjBasedSelector<std::complex<double> >*" #cython error override
  
  
  cdef cppclass L2ProjBasedSelector[Scalar]:
    L2ProjBasedSelector(CandList cand_list, double conv_exp, int max_order, L2Shapeset* user_shapeset)
    L2ProjBasedSelector(CandList cand_list, double conv_exp, int max_order)
    L2ProjBasedSelector(CandList cand_list, double conv_exp)
    L2ProjBasedSelector(CandList cand_list)
    
cdef class PyL2ProjBasedSelectorReal:
  cdef L2ProjBasedSelector[double]* thisptr

cdef class PyL2ProjBasedSelectorComplex:
  cdef L2ProjBasedSelector[cComplex[double]]* thisptr
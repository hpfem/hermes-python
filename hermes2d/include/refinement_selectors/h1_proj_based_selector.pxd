cdef extern from "refinement_selectors/h1_proj_based_selector.h" namespace "Hermes::Hermes2D::RefinementSelectors":
  ctypedef void* pH1ProjBasedSelector "Hermes::Hermes2D::RefinementSelectors::H1ProjBasedSelector<Scalar>*" #cython error override
  ctypedef void* pH1ProjBasedSelectorReal "Hermes::Hermes2D::RefinementSelectors::H1ProjBasedSelector<double>*" #cython error override
  ctypedef void* pH1ProjBasedSelectorComplex "Hermes::Hermes2D::RefinementSelectors::H1ProjBasedSelector<std::complex<double> >*" #cython error override
  
  cdef cppclass H1ProjBasedSelector[Scalar]:
    H1ProjBasedSelector(CandList cand_list, double conv_exp, int max_order, H1Shapeset* user_shapeset)
    H1ProjBasedSelector(CandList cand_list, double conv_exp, int max_order)
    H1ProjBasedSelector(CandList cand_list, double conv_exp)
    H1ProjBasedSelector(CandList cand_list)
    
cdef class PyH1ProjBasedSelectorReal:
  cdef H1ProjBasedSelector[double]* thisptr

cdef class PyH1ProjBasedSelectorComplex:
  cdef H1ProjBasedSelector[cComplex[double]]* thisptr
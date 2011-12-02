cdef extern from "adapt/adapt.h" namespace "Hermes::Hermes2D":
  cdef cppclass Adapt[Scalar]: 
    Adapt()
    Adapt(vector[Space[Scalar]*]spaces, vector[ProjNormType] proj_norms)
    Adapt(vector[Space[Scalar]*]spaces)
    Adapt(Space[Scalar]* space, ProjNormType proj_norm)
    Adapt(Space[Scalar]* space)
    
    cppclass MatrixFormVolError:
      MatrixFormVolError()
      MatrixFormVolError(ProjNormType type)
      Scalar value(int n, double *wt, Func[Scalar] *u_ext[], Func[Scalar] *u, Func[Scalar] *v, Geom<double> *e, ExtData[Scalar] *ext)
      Hermes::Ord ord(int n, double *wt, Func<Hermes::Ord> *u_ext[], Func<Hermes::Ord> *u, Func<Hermes::Ord> *v, Geom<Hermes::Ord> *e, ExtData<Hermes::Ord> *ext)

    void set_error_form(int i, int j, MatrixFormVolError* form)
    void set_error_form(MatrixFormVolError* form)

    void set_norm_form(int i, int j, MatrixFormVolError* form)
    void set_norm_form(MatrixFormVolError* form)

    double calc_err_est(Solution[Scalar]*sln, Solution[Scalar]*rsln, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_est(Solution[Scalar]*sln, Solution[Scalar]*rsln, bool solutions_for_adapt,)
    double calc_err_est(Solution[Scalar]*sln, Solution[Scalar]*rsln)
    
    double calc_err_est(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_est(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors, bool solutions_for_adapt)
    double calc_err_est(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors)
    double calc_err_est(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns)
    
    double calc_err_exact(Solution[Scalar]*sln, Solution[Scalar]*rsln, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_exact(Solution[Scalar]*sln, Solution[Scalar]*rsln, bool solutions_for_adapt)
    double calc_err_exact(Solution[Scalar]*sln, Solution[Scalar]*rsln)
    
    double calc_err_exact(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_exact(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors, bool solutions_for_adapt)
    double calc_err_exact(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns, vector[double>* component_errors)
    double calc_err_exact(vector[Solution[Scalar]*]slns, vector[Solution[Scalar]*]rslns)
    
    bool adapt(vector[RefinementSelectors::Selector[Scalar]*]refinement_selectors, double thr, int strat, int regularize, double to_be_processed)
    bool adapt(vector[RefinementSelectors::Selector[Scalar]*]refinement_selectors, double thr, int strat, int regularize)
    bool adapt(vector[RefinementSelectors::Selector[Scalar]*]refinement_selectors, double thr)
    bool adapt(vector[RefinementSelectors::Selector[Scalar]*]refinement_selectors, double thr, int strat)

    bool adapt(RefinementSelectors::Selector[Scalar]* refinement_selector, double thr, int strat, int regularize, double to_be_processed)
    bool adapt(RefinementSelectors::Selector[Scalar]* refinement_selector, double thr, int strat, int regularize)
    bool adapt(RefinementSelectors::Selector[Scalar]* refinement_selector, double thr, int strat)
    bool adapt(RefinementSelectors::Selector[Scalar]* refinement_selector, double thr)

    void unrefine(double thr)

    double get_element_error_squared(int component, int id)

cdef class PyAdaptReal:
  cdef Adapt[double]* thisptr

cdef class PyAdaptComplex:
  cdef Adapt[cComplex]* thisptr
  
cdef class PyMatrixFormVolErrorReal:
  cdef Adapt[double].MatrixFormVolError* thisptr
  
cdef class PyMatrixFormVolErrorComplex:
  cdef Adapt[cComplex[double]].MatrixFormVolError* thisptr
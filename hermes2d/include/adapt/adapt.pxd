cdef extern from "adapt/adapt.h" namespace "Hermes::Hermes2D":
  ctypedef void* pSolution "Hermes::Hermes2D::Solution<Scalar>*" #cython error override
  ctypedef void* pSelector "Hermes::Hermes2D::RefinementSelectors::Selector<Scalar>*" #cython error override

  ctypedef void* pFunc "Hermes::Hermes2D::Func<Scalar>*" #cython error overrides
  ctypedef void* pFuncReal "Hermes::Hermes2D::Func<double>*" #cython error overrides
  ctypedef void* pFuncComplex "Hermes::Hermes2D::Func<std::complex<double> >*" #cython error overrides
  ctypedef void* pFuncOrd "Hermes::Hermes2D::Func<Hermes::Ord>*" #cython error overrides
  ctypedef void* pGeom "Hermes::Hermes2D::Geom<Scalar>*" #cython error overrides
  ctypedef void* pGeomReal "Hermes::Hermes2D::Geom<double>*" #cython error overrides
  ctypedef void* pGeomOrd "Hermes::Hermes2D::Geom<Hermes::Ord>*" #cython error overrides
  ctypedef void* pExtData "Hermes::Hermes2D::ExtData<Scalar>*" #cython error overrides
  ctypedef void* pExtDataOrd "Hermes::Hermes2D::ExtData<Hermes::Ord>*" #cython error overrides
  
  cdef cppclass Adapt[Scalar]: 
    Adapt()
    Adapt(vector[pSpace]spaces, vector[ProjNormType] proj_norms)
    Adapt(vector[pSpace]spaces)
    Adapt(pSpace space, ProjNormType proj_norm)
    Adapt(pSpace space)
    
    cppclass MatrixFormVolError:
      MatrixFormVolError(int i, int j)
      MatrixFormVolError(int i, int j, ProjNormType type)
      Scalar value(int n, double *wt, Func[Scalar]** u_ext, pFunc u, pFunc v, pGeomReal e, pExtData ext)
      Ord ord(int n, double *wt, Func[Ord]** u_ext, pFuncOrd u, pFuncOrd v, pGeomOrd e, pExtDataOrd ext)

    void set_error_form(int i, int j, MatrixFormVolError* form)
    void set_error_form(MatrixFormVolError* form)

    void set_norm_form(int i, int j, MatrixFormVolError* form)
    void set_norm_form(MatrixFormVolError* form)

    double calc_err_est(pSolution sln, pSolution rsln, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_est(pSolution sln, pSolution rsln, bool solutions_for_adapt)
    double calc_err_est(pSolution sln, pSolution rsln)
    
    double calc_err_est(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_est(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors, bool solutions_for_adapt)
    double calc_err_est(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors)
    double calc_err_est(vector[pSolution]slns, vector[pSolution]rslns)
    
    double calc_err_exact(pSolution sln, pSolution rsln, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_exact(pSolution sln, pSolution rsln, bool solutions_for_adapt)
    double calc_err_exact(pSolution sln, pSolution rsln)
    
    double calc_err_exact(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors, bool solutions_for_adapt, unsigned int error_flags)
    double calc_err_exact(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors, bool solutions_for_adapt)
    double calc_err_exact(vector[pSolution]slns, vector[pSolution]rslns, vector[double]* component_errors)
    double calc_err_exact(vector[pSolution]slns, vector[pSolution]rslns)
    
    bool adapt(vector[pSelector]refinement_selectors, double thr, int strat, int regularize, double to_be_processed)
    bool adapt(vector[pSelector]refinement_selectors, double thr, int strat, int regularize)
    bool adapt(vector[pSelector]refinement_selectors, double thr)
    bool adapt(vector[pSelector]refinement_selectors, double thr, int strat)

    bool adapt(pSelector refinement_selector, double thr, int strat, int regularize, double to_be_processed)
    bool adapt(pSelector refinement_selector, double thr, int strat, int regularize)
    bool adapt(pSelector refinement_selector, double thr, int strat)
    bool adapt(pSelector refinement_selector, double thr)

    void unrefine(double thr)

    double get_element_error_squared(int component, int id)

cdef class PyAdaptReal:
  cdef Adapt[double]* thisptr

cdef class PyAdaptComplex:
  cdef Adapt[cComplex[double]]* thisptr

cdef class PyMatrixFormVolErrorReal:
  cdef Adapt[double].MatrixFormVolError* thisptr

cdef class PyMatrixFormVolErrorComplex:
  cdef Adapt[cComplex[double]].MatrixFormVolError* thisptr
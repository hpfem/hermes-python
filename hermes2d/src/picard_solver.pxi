cdef class PyPicardSolverReal(PyNonlinearSolverReal):
  def __cinit__(self, dp, slns_prev_iter, matrix_solver_type=None):
    if (type(self)!=PyPicardSolverReal):
      return
    cdef vector[pSolutionReal] cslns_prev_iter
    cdef PySolutionReal s
    if matrix_solver_type:
      if isinstance(slns_prev_iter,list):
        for s in slns_prev_iter:
          cslns_prev_iter.push_back(<Solution[double]*> s.thisptr)
        self.thisptr=new PicardSolver[double]((<PyDiscreteProblemReal>dp).thisptr, cslns_prev_iter, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new PicardSolver[double]((<PyDiscreteProblemReal>dp).thisptr, <Solution[double]*>(<PySolutionReal>slns_prev_iter).thisptr, <MatrixSolverType> matrix_solver_type)
    else:
      if isinstance(slns_prev_iter,list):
        for s in slns_prev_iter:
          cslns_prev_iter.push_back(<Solution[double]*> s.thisptr)
        self.thisptr=new PicardSolver[double]((<PyDiscreteProblemReal>dp).thisptr, cslns_prev_iter)
      else:
        self.thisptr=new PicardSolver[double]((<PyDiscreteProblemReal>dp).thisptr, <Solution[double]*>(<PySolutionReal>slns_prev_iter).thisptr)

  def solve(self, tol = None, max_iter = None, num_last_vectors_used = None, anderson_beta = None):
    if tol:
      if num_last_vectors_used:
        if anderson_beta:
          return (<PicardSolver[double]*>self.thisptr).solve(tol, max_iter, num_last_vectors_used, anderson_beta)
        else:
          return (<PicardSolver[double]*>self.thisptr).solve(tol, max_iter, num_last_vectors_used)
      else:
        return (<PicardSolver[double]*>self.thisptr).solve(tol, max_iter)
    else:
      (<PicardSolver[double]*>self.thisptr).solve()
      return True

  def set_verbose_output_inner_newton(self, verbose_output_to_set):
    (<PicardSolver[double]*> self.thisptr).set_verbose_output_inner_newton(verbose_output_to_set)
  
cdef class PyPicardSolverComplex(PyNonlinearSolverComplex):
  def __cinit__(self, dp, slns_prev_iter, matrix_solver_type=None):
    if (type(self)!=PyPicardSolverComplex):
      return
    cdef vector[pSolutionComplex] cslns_prev_iter
    cdef PySolutionComplex s
    if matrix_solver_type:
      if isinstance(slns_prev_iter,list):
        for s in slns_prev_iter:
          cslns_prev_iter.push_back(<Solution[cComplex[double]]*> s.thisptr)
        self.thisptr=new PicardSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr, cslns_prev_iter, <MatrixSolverType> matrix_solver_type)
      else:
        self.thisptr=new PicardSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr, <Solution[cComplex[double]]*>(<PySolutionComplex>slns_prev_iter).thisptr, <MatrixSolverType> matrix_solver_type)
    else:
      if isinstance(slns_prev_iter,list):
        for s in slns_prev_iter:
          cslns_prev_iter.push_back(<Solution[cComplex[double]]*> s.thisptr)
        self.thisptr=new PicardSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr, cslns_prev_iter)
      else:
        self.thisptr=new PicardSolver[cComplex[double]]((<PyDiscreteProblemComplex>dp).thisptr, <Solution[cComplex[double]]*>(<PySolutionComplex>slns_prev_iter).thisptr)

  def solve(self, tol = None, max_iter = None, num_last_vectors_used = None, anderson_beta = None):
    if tol:
      if num_last_vectors_used:
        if anderson_beta:
          return (<PicardSolver[cComplex[double]]*>self.thisptr).solve(tol, max_iter, num_last_vectors_used, anderson_beta)
        else:
          return (<PicardSolver[cComplex[double]]*>self.thisptr).solve(tol, max_iter, num_last_vectors_used)
      else:
        return (<PicardSolver[cComplex[double]]*>self.thisptr).solve(tol, max_iter)
    else:
      (<PicardSolver[cComplex[double]]*>self.thisptr).solve()
      return True

  def set_verbose_output_inner_newton(self, verbose_output_to_set):
    (<PicardSolver[cComplex[double]]*> self.thisptr).set_verbose_output_inner_newton(verbose_output_to_set)
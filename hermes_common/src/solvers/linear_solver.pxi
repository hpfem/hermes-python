class PyFactorizationScheme:
    HERMES_FACTORIZE_FROM_SCRATCH,HERMES_REUSE_MATRIX_REORDERING,HERMES_REUSE_MATRIX_REORDERING_AND_SCALING,HERMES_REUSE_FACTORIZATION_COMPLETELY=range(4)

cdef class PyLinearSolverReal: #abstract
  def __dealloc__(self):
    del self.thisptr
  def solve(self):
    return self.thisptr.solve()
  def get_sln_vector(self):
    v=[]
    cdef double * cv = self.thisptr.get_sln_vector()
    for i in range(self.thisptr.get_matrix_size()):
      v.append(cv[i])
    return v
  def get_error(self):
    return self.thisptr.get_error()
  def get_time(self):
    return self.thisptr.get_time()
  def set_factorization_scheme(self, reuse_scheme=None):
    if reuse_scheme:
      self.thisptr.set_factorization_scheme(reuse_scheme)
    else:
      self.thisptr.set_factorization_scheme()

cdef class PyLinearSolverComplex: #abstract
  def __dealloc__(self):
    del self.thisptr
  def solve(self):
    return self.thisptr.solve()
  def get_sln_vector(self):
    v=[]
    cdef cComplex[double] * cv = self.thisptr.get_sln_vector()
    for i in range(self.thisptr.get_matrix_size()):
      v.append(pcomplex(cv[i]))
    return v
  def get_error(self):
    return self.thisptr.get_error()
  def get_time(self):
    return self.thisptr.get_time()
  def set_factorization_scheme(self, reuse_scheme=None):
    if reuse_scheme:
      self.thisptr.set_factorization_scheme(reuse_scheme)
    else:
      self.thisptr.set_factorization_scheme()
#
#
#  cdef cppclass DirectSolver[Scalar]: # virtual public LinearSolver<Scalar> abstract
#    pass
#
#  cdef cppclass IterSolver[Scalar]: # public virtual LinearSolver<Scalar> abstract
#    int get_num_iters()
#    double get_residual()
#    void set_tolerance(double tol)
#    void set_max_iters(int iters)
#    void set_precond(char *name)
#    #void set_precond(Teuchos::RCP<Precond<Scalar> > &pc)
#    void set_precond(Precond[Scalar] *pc)
#
#  cdef cppclass create_linear_solver[Scalar]:
#    create_linear_solver(MatrixSolverType matrix_solver_type, Matrix[Scalar]* matrix, Vector[Scalar]* rhs)


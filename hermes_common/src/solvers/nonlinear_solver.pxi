cdef class PyNonlinearSolverReal:
  def __cinit__(self, dp, matrix_solver_type=None):
    if (type(self)!=PyNonlinearSolverReal):
      return
    if matrix_solver_type:
      self.thisptr=new NonlinearSolver[double]((<PyDiscreteProblemInterfaceReal>dp).thisptr, matrix_solver_type)
    else:
      self.thisptr=new NonlinearSolver[double]((<PyDiscreteProblemInterfaceReal>dp).thisptr)

  def __dealloc__(self):
    del self.thisptr

  def solve(self, coeff_vec):
    cdef double * c_coeff_vec
    c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
    for i in range(len(coeff_vec)):
      c_coeff_vec[i]=coeff_vec[i]
    self.thisptr.solve(c_coeff_vec)
    for i in range(len(coeff_vec)):
      delDoubles(c_coeff_vec)
  def get_time(self):
    return self.thisptr.get_time()
  def get_sln_vector(self):
    v=[]
    cdef double * cv = self.thisptr.get_sln_vector()
    for i in range(self.thisptr.dp.get_num_dofs()):
      v.append(cv[i])
    return v
  def set_verbose_output(self, bool verbose_output_to_set):
    self.thisptr.set_verbose_output(verbose_output_to_set)
  def set_iterative_method(self, char* iterative_method_name):
    self.thisptr.set_iterative_method(iterative_method_name)
  def set_preconditioner(self, char* preconditioner_name):
    self.thisptr.set_preconditioner(preconditioner_name)

cdef class PyNonlinearSolverComplex:
  def __cinit__(self, dp, matrix_solver_type=None):
    if (type(self)!=PyNonlinearSolverComplex):
      return
    if matrix_solver_type:
      self.thisptr=new NonlinearSolver[cComplex[double]]((<PyDiscreteProblemInterfaceComplex>dp).thisptr, matrix_solver_type)
    else:
      self.thisptr=new NonlinearSolver[cComplex[double]]((<PyDiscreteProblemInterfaceComplex>dp).thisptr)
  def solve(self, coeff_vec):
    cdef cComplex[double] * c_coeff_vec
    c_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(coeff_vec))
    for i in range(len(coeff_vec)):
      c_coeff_vec[i]=cComplex[double](coeff_vec[i].real,coeff_vec[i].imag)
    self.thisptr.solve(c_coeff_vec)
    for i in range(len(coeff_vec)):
      delComplexes(c_coeff_vec)
  def get_time(self):
    return self.thisptr.get_time()
  def get_sln_vector(self):
    v=[]
    cdef cComplex[double] * cv = self.thisptr.get_sln_vector()
    for i in range(self.thisptr.dp.get_num_dofs()):
      v.append(pcomplex(cv[i]))
    return v
  def set_verbose_output(self, bool verbose_output_to_set):
    self.thisptr.set_verbose_output(verbose_output_to_set)
  def set_iterative_method(self, char* iterative_method_name):
    self.thisptr.set_iterative_method(iterative_method_name)
  def set_preconditioner(self, char* preconditioner_name):
    self.thisptr.set_preconditioner(preconditioner_name)
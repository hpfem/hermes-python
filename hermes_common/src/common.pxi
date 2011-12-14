class PyMatrixSolverType:
  SOLVER_UMFPACK,SOLVER_PETSC,SOLVER_MUMPS,SOLVER_SUPERLU,SOLVER_AMESOS,SOLVER_AZTECOO=range(0,6)

cdef class PyScalar2Real:
  def __cinit__(self, x, y):
    self.thisptr=new Scalar2[double](x,y)

cdef class PyScalar2Complex:
  def __cinit__(self, x, y):
    self.thisptr=new Scalar2[cComplex[double]](cComplex[double](x.real,x.imag),cComplex[double](y.real,y.imag))
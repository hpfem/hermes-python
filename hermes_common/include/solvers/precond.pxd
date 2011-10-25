cdef extern from "solvers/precond.h" namespace "Hermes::Preconditioners":
  cdef cppclass Precond[Scalar]: #abstract
    void create(Matrix[Scalar] *mat)
    void destroy()
    void compute()

cdef class PyPrecondReal:
  cdef Precond[double] * thisptr

cdef class PyPrecondComplex:
  cdef Precond[cComplex[double]] * thisptr


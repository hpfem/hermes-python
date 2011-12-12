cdef extern from "solvers/dp_interface.h" namespace "Hermes::Solvers":
  cdef cppclass DiscreteProblemInterface[Scalar]: #abstract
    int get_num_dofs()
    
cdef class PyDiscreteProblemInterfaceReal:
  cdef DiscreteProblemInterface[double] * thisptr

cdef class PyDiscreteProblemInterfaceComplex:
  cdef DiscreteProblemInterface[cComplex[double]] * thisptr
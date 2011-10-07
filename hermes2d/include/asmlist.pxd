cdef extern from "asmlist.h" namespace "Hermes::Hermes2D":
  cdef cppclass AsmList[Scalar]:
    AsmList()
    int* get_idx()
    int* get_dof()
    unsigned int get_cnt()

cdef class PyAsmListReal:
  cdef AsmList[double] * thisptr

cdef class PyAsmListComplex:
  cdef AsmList[cComplex[double]] * thisptr


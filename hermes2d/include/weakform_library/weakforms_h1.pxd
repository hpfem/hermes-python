cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  cdef unsigned int idx_j
cdef class PyDefaultResidualDiffusion(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i
cdef class PyDefaultVectorFormVol(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i

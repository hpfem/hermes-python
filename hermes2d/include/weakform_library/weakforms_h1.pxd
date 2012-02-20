cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  cdef unsigned int idx_j
  cdef double conductivity
cdef class PyDefaultResidualDiffusion(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i
  cdef double conductivity
cdef class PyDefaultVectorFormVol(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i
  cdef double vol_src_term
cdef class PyDefaultMatrixFormSurf(PyCustomMatrixFormSurfReal):
  cdef unsigned int idx_j
  cdef double alpha
cdef class PyDefaultResidualSurf(PyCustomVectorFormSurfReal):
  cdef unsigned int idx_i
  cdef double alpha
cdef class PyDefaultVectorFormSurf(PyCustomVectorFormSurfReal):
  cdef unsigned int idx_i
  cdef double alpha

cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  cdef unsigned int idx_j
  cdef double lambda
cdef class PyDefaultResidualDiffusion(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i
  cdef double lambda
cdef class PyDefaultVectorFormVol(PyCustomVectorFormVolReal):
  cdef unsigned int idx_i
  cdef double vol_src_term
cdef class PyDefaultMatrixFormSurf(PyCustomMatrixFormSurfReal):
  cdef unsigned int idx_j
  cdef double bdy_heat_flux
  cdef double alpha
cdef class PyDefaultResidualSurf(PyCustomVectorFormSurfReal):
  cdef unsigned int idx_i
  cdef double bdy_heat_flux
  cdef double alpha
cdef class PyDefaultVectorFormSurf(PyCustomVectorFormSurfReal):
  cdef unsigned int idx_i
  cdef double bdy_heat_flux
  cdef double alpha

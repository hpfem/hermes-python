cdef class PyDefaultJacobianElasticity_0_0(PyCustomMatrixFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultJacobianElasticity_0_1(PyCustomMatrixFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultJacobianElasticity_1_0(PyCustomMatrixFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultJacobianElasticity_1_1(PyCustomMatrixFormVolReal):
  cdef double conductivity
  cdef double mu
  
cdef class PyDefaultResidualElasticity_0_0(PyCustomVectorFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultResidualElasticity_0_1(PyCustomVectorFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultResidualElasticity_1_0(PyCustomVectorFormVolReal):
  cdef double conductivity
  cdef double mu
cdef class PyDefaultResidualElasticity_1_1(PyCustomVectorFormVolReal):
  cdef double conductivity
  cdef double mu
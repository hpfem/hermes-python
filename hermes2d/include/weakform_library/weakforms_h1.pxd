cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  cdef value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext)
  cdef ord(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext)
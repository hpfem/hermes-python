cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  property idx_j:
    def __get__(self):
      return self.idx_j
    def __set__(self,idx_j):
      self.idx_j = idx_j
      
  cdef value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pu.val[i] * (pu_ext[self.idx_j].dx[i] * pv.dx[i] + pu_ext[self.idx_j].dy[i] * pv.dy[i]) * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result
    
  cdef ord(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pu.val[i] * (pu_ext[self.idx_j].dx[i] * pv.dx[i] + pu_ext[self.idx_j].dy[i] * pv.dy[i]) * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result
cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_j = j
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pu.val[i] * (pu_ext[self.idx_j].dx[i] * pv.dx[i] + pu_ext[self.idx_j].dy[i] * pv.dy[i]) * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pu.val[i] * (pu_ext[self.idx_j].dx[i] * pv.dx[i] + pu_ext[self.idx_j].dy[i] * pv.dy[i]) * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result

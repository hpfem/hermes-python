cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, area=None, lambda=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_j = j
    if(lambda is not None):
      self.lambda = lambda
    else:
      self.lambda = 1
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i]) * self.lambda
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result

cdef class PyDefaultResidualDiffusion(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int i, area=None, lambda=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = i
    if(lambda is not None):
      self.lambda = lambda
    else:
      self.lambda = 1
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i]) * self.lambda       
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i])
    return result
    
cdef class PyDefaultVectorFormVol(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int i, area=None, vol_src_term=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = i
    if(vol_src_term is not None):
      self.vol_src_term = vol_src_term
    else:
      self.vol_src_term = 1
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pv.val[i] * self.vol_src_term
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pv.val[i]
    return result

cdef class PyDefaultMatrixFormSurf(PyCustomMatrixFormSurfReal):
  def __init__(self, unsigned int i, unsigned int j, area=None, alpha=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = i
    if(alpha is not None):
      self.alpha = alpha
    else:
      self.alpha = 1
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pv.val[i] * pu.val[i] * self.alpha   
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pv.val[i] * pu.val[i]
    return result


cdef class PyDefaultResidualSurf(PyCustomVectorFormSurfReal):
  def __init__(self, unsigned int i, area=None, alpha=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = i
    if(alpha is not None):
      self.alpha = alpha
    else:
      self.alpha = 1
      
  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i])  * self.alpha       
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i])
    return result



cdef class PyDefaultVectorFormSurf(PyCustomVectorFormSurfReal):
  def __init__(self, unsigned int i, area=None, alpha=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = i
    if(alpha is not None):
      self.alpha = alpha
    else:
      self.alpha = 1

  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i]) * self.alpha   
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i])
    return result




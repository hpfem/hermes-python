import inspect

cdef class PyDefaultJacobianDiffusion(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, conductivity=None, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomMatrixFormVol[double](self, i, j)
    
  property idx_i:
    def __get__(self):
      return (<MatrixFormVol[double] *> self.thisptr).i
    def __set__(self,idx_i):
      (<MatrixFormVol[double] *> self.thisptr).i = idx_i
  
  def value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i]) * self.conductivity
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu.dx[i] * pv.dx[i] + pu.dy[i] * pv.dy[i])
    return result

cdef class PyDefaultResidualDiffusion(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, conductivity=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = j
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j)
  property idx_i:
    def __get__(self):
      return (<VectorFormVol[double] *> self.thisptr).i
    def __set__(self,idx_i):
      (<VectorFormVol[double] *> self.thisptr).i = idx_i
  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i]) * self.conductivity
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (pu_ext[self.idx_i].dx[i] * pv.dx[i] + pu_ext[self.idx_i].dy[i] * pv.dy[i])
    return result
    
cdef class PyDefaultVectorFormVol(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, vol_src_term=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if vol_src_term is not None:
      self.vol_src_term = vol_src_term
    else:
      self.vol_src_term = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormVol[double](self, j)
      
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
  def __init__(self, unsigned int i, unsigned int j, alpha=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if alpha is not None:
      self.alpha = alpha
    else:
      self.alpha = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomMatrixFormSurf[double](self, i, j)

  def value(self, int n, pwt, pu_ext, PyFuncReal pu, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pv.val[i] * pu.val[i] * self.alpha
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pv.val[i] * pu.val[i]
    return result


cdef class PyDefaultResidualSurf(PyCustomVectorFormSurfReal):
  def __init__(self, unsigned int j, alpha=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.idx_i = j
    if alpha is not None:
      self.alpha = alpha
    else:
      self.alpha = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j)
  property idx_i:
    def __get__(self):
      return (<VectorFormSurf[double] *> self.thisptr).i
    def __set__(self,idx_i):
      (<VectorFormSurf[double] *> self.thisptr).i = idx_i
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
  def __init__(self, unsigned int j, alpha=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if alpha is not None:
      self.alpha = alpha
    else:
      self.alpha = 1
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j,carea)
        return
      self.thisptr = <Form[double]*> new CustomVectorFormSurf[double](self, j)

  def value(self, int n, pwt, pu_ext, PyFuncReal pv, PyGeomReal pe, PyExtDataReal pext):
    result = 0
    for i in range(n):
      result += pwt[i] * pv.val[i] * self.alpha
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * pv.val[i] * self.alpha
    return result
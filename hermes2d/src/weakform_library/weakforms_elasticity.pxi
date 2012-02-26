cdef class PyDefaultJacobianElasticity_0_0(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, conductivity=None, mu=None, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * (((self.conductivity + 2*self.mu) * pu.dx[i] * pv.dx[i]) + ( self.mu * pu.dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (((self.conductivity + 2*self.mu) * pu.dx[i] * pv.dx[i]) + ( self.mu * pu.dy[i] * pv.dy[i]))
    return result
    
####################################

cdef class PyDefaultJacobianElasticity_0_1(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, conductivity=None, mu=None, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.conductivity * pu.dx[i] * pv.dx[i]) + ( self.mu * pu.dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.conductivity * pu.dx[i] * pv.dx[i]) + ( self.mu * pu.dy[i] * pv.dy[i]))
    return result
    
####################################

cdef class PyDefaultJacobianElasticity_1_0(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, conductivity=None, mu=None, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.mu * pu.dx[i] * pv.dx[i]) + ( self.conductivity * pu.dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.mu * pu.dx[i] * pv.dx[i]) + ( self.conductivity * pu.dy[i] * pv.dy[i]))
    return result
    
####################################

cdef class PyDefaultJacobianElasticity_1_1(PyCustomMatrixFormVolReal):
  def __init__(self, unsigned int i, unsigned int j, conductivity=None, mu=None, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.mu * pu.dx[i] * pv.dx[i]) + ( (self.conductivity + 2*self.mu) * pu.dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pu, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.mu * pu.dx[i] * pv.dx[i]) + ( (self.conductivity + 2*self.mu) * pu.dy[i] * pv.dy[i]))
    return result
    
############################################

cdef class PyDefaultResidualElasticity_0_0(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, conductivity=None, mu=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.super(j, area, ext, scaling_factor, u_ext_offset, init)
    self.idx_i = j
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * (((self.conductivity + 2*self.mu) * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.mu * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * (((self.conductivity + 2*self.mu) * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.mu * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
        
############################################

cdef class PyDefaultResidualElasticity_0_1(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, conductivity=None, mu=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.super(j, area, ext, scaling_factor, u_ext_offset, init)
    self.idx_i = j
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.conductivity * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.mu * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.conductivity * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.mu * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
############################################

cdef class PyDefaultResidualElasticity_1_0(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, conductivity=None, mu=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.super(j, area, ext, scaling_factor, u_ext_offset, init)
    self.idx_i = j
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.mu * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.conductivity * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.mu * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( self.conductivity * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
############################################

cdef class PyDefaultResidualElasticity_1_1(PyCustomVectorFormVolReal):
  def __init__(self, unsigned int j, conductivity=None, mu=None, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    self.super(j, area, ext, scaling_factor, u_ext_offset, init)
    self.idx_i = j
    if conductivity is not None:
      self.conductivity = conductivity
    else:
      self.conductivity = 1
    if mu is not None:
      self.mu = mu
    else:
      self.mu = 1
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
      result += pwt[i] * ((self.mu * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( (self.conductivity + 2*self.mu) * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
    
  def ord(self, int n, pwt, pu_ext, PyFuncOrd pv, PyGeomOrd pe, PyExtDataOrd pext):
    result = PyOrd(0)
    for i in range(n):
      result += pwt[i] * ((self.mu * pu_ext[self.idx_i].dx[i] * pv.dx[i]) + ( (self.conductivity + 2*self.mu) * pu_ext[self.idx_i].dy[i] * pv.dy[i]))
    return result
cdef class PyFuncReal:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Func doesn't have public constructor")

  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr 

  property val:
    def __set__(self, value):
      if self.thisptr.val!=NULL:
        delBuffer[double](self.thisptr.val)
      self.thisptr.val = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.val[i])
      return r

  property dx:
    def __set__(self, value):
      if self.thisptr.dx!=NULL:
        delBuffer[double](self.thisptr.dx)
      self.thisptr.dx = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()): #TODO optimize (direct acces)
        r.append(self.thisptr.dx[i])
      return r

  property dy:
    def __set__(self, value):
      if self.thisptr.dy!=NULL:
        delBuffer[double](self.thisptr.dy)
      self.thisptr.dy = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.dy[i])
      return r

  property laplace:
    def __set__(self, value):
      if self.thisptr.laplace!=NULL:
        delBuffer[double](self.thisptr.laplace)
      self.thisptr.laplace = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.laplace[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.laplace[i])
      return r
        
  property val0:
    def __set__(self, value):
      if self.thisptr.val0!=NULL:
        delBuffer[double](self.thisptr.val0)
      self.thisptr.val0 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val0[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.val0[i])
      return r

  property val1:
    def __set__(self, value):
      if self.thisptr.val1!=NULL:
        delBuffer[double](self.thisptr.val1)
      self.thisptr.val1 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val1[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.val1[i])
      return r

  property dx0:
    def __set__(self, value):
      if self.thisptr.dx0!=NULL:
        delBuffer[double](self.thisptr.dx0)
      self.thisptr.dx0 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx0[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.dx0[i])
      return r

  property dx1:
    def __set__(self, value):
      if self.thisptr.dx1!=NULL:
        delBuffer[double](self.thisptr.dx1)
      self.thisptr.dx1 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx1[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.dx1[i])
      return r

  property dy0:
    def __set__(self, value):
      if self.thisptr.dy0!=NULL:
        delBuffer[double](self.thisptr.dy0)
      self.thisptr.dy0 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy0[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.dy0[i])
      return r

  property dy1:
    def __set__(self, value):
      if self.thisptr.dy1!=NULL:
        delBuffer[double](self.thisptr.dy1)
      self.thisptr.dy1 = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy1[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.dy1[i])
      return r

  property curl:
    def __set__(self, value):
      if self.thisptr.curl!=NULL:
        delBuffer[double](self.thisptr.curl)
      self.thisptr.curl = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.curl[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.curl[i])
      return r

  property div:
    def __set__(self, value):
      if self.thisptr.div!=NULL:
        delBuffer[double](self.thisptr.div)
      self.thisptr.div = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.div[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.div[i])
      return r

  def get_val_central(self, int k):
    return self.thisptr.get_val_central(k)
  def get_val_neighbor(self, int k):
    return self.thisptr.get_val_neighbor(k)
  def get_dx_central(self, int k):
    return self.thisptr.get_dx_central(k)
  def get_dx_neighbor(self, int k):
    return self.thisptr.get_dx_neighbor(k)
  def get_dy_central(self, int k):
    return self.thisptr.get_dy_central(k)
  def get_dy_neighbor(self, int k):
    return self.thisptr.get_dy_neighbor(k)
  def get_laplace_central(self, int k):
    return self.thisptr.get_laplace_central(k)
  def get_laplace_neighbor(self, int k):
    return self.thisptr.get_laplace_neighbor(k)
  def free_ord(self):
    self.thisptr.free_ord()
  def free_fn(self):
    self.thisptr.free_fn()
  def subtract(self, PyFuncReal func):
    self.thisptr.subtract(func.thisptr[0])
  def add(self,  attribute, other_attribute):
    cdef double * cattribute = <double*> newBuffer[double](self.thisptr.get_num_gip())
    cdef double * cother_attribute = <double*> newBuffer[double](self.thisptr.get_num_gip())
    for i in range(self.thisptr.get_num_gip()):
      cattribute[i] = attribute[i]
      cother_attribute[i] = other_attribute[i]
    
    self.thisptr.add(cattribute, cother_attribute)
    for i in range(self.thisptr.get_num_gip()):
      attribute[i] = cattribute[i]

cdef class PyDiscontinuousFuncReal(PyFuncReal):
  def __cinit__(self, PyFuncReal fn, fn_n, reverse = None, init = True):
    if not init:
      return
    if type(self)!=PyDiscontinuousFuncReal:
      return

    support_on_neighbor = None
    if not isinstance(fn_n, PyFuncReal):
      support_on_neighbor = fn_n
      fn_n = None

    if fn_n is not None:
      if reverse is not None:
        self.thisptr = <Func[double]*> new DiscontinuousFunc[double](fn.thisptr, (<PyFuncReal> fn_n).thisptr,<bool> reverse)
      else:
        self.thisptr = <Func[double]*> new DiscontinuousFunc[double](fn.thisptr, (<PyFuncReal> fn_n).thisptr)
    else:
      if reverse is not None:
        self.thisptr = <Func[double]*> new DiscontinuousFunc[double](fn.thisptr, <bool> support_on_neighbor,<bool> reverse)
        return
      if support_on_neighbor is not None:
        self.thisptr = <Func[double]*> new DiscontinuousFunc[double](fn.thisptr, <bool> support_on_neighbor)
        return
      self.thisptr = <Func[double]*> new DiscontinuousFunc[double](fn.thisptr)


  property fn_central:
    def __set__(self,PyFuncReal value):
      (<DiscontinuousFunc[double]*> self.thisptr).fn_central = value.thisptr
    def __get__(self):
      cdef PyFuncReal r = PyFuncReal(init = False)
      r.thisptr = (<DiscontinuousFunc[double]*> self.thisptr).fn_central
      return r
  property fn_neighbor:
    def __set__(self,PyFuncReal value):
      (<DiscontinuousFunc[double]*> self.thisptr).fn_neighbor = value.thisptr
    def __get__(self):
      cdef PyFuncReal r = PyFuncReal(init = False)
      r.thisptr = (<DiscontinuousFunc[double]*> self.thisptr).fn_neighbor
      return r

cdef class PyGeomReal:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Geaom doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr

  property area:
    def __set__(self,double value):
      self.thisptr.area = value
    def __get__(self):
      return self.thisptr.area
  property diam:
    def __set__(self,double value):
      self.thisptr.diam = value
    def __get__(self):
      return self.thisptr.diam
  property id:
    def __set__(self,int value):
      self.thisptr.id = value
    def __get__(self):
      return self.thisptr.id

  property x:
    def __set__(self, value):
      if self.thisptr.x!=NULL:
        delBuffer[double](self.thisptr.x)
      self.thisptr.x = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.x[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()): #TODO optimize (direct acces)
        r.append(self.thisptr.x[i])
      return r

  property y:
    def __set__(self, value):
      if self.thisptr.y!=NULL:
        delBuffer[double](self.thisptr.y)
      self.thisptr.y = <double*> newBuffer[double](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.y[i] = value[i]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(self.thisptr.y[i])
      return r
      
  def get_neighbor_marker(self):
    return self.thisptr.get_neighbor_marker()
  def get_neighbor_id(self):
    return self.thisptr.get_neighbor_id()
  def get_neighbor_diam(self):
    return self.thisptr.get_neighbor_diam()
  def free(self):
    self.thisptr.free()
  def free_ord(self):
    self.thisptr.free_ord()

  property elem_marker:
    def __set__(self,int value):
      self.thisptr.elem_marker = value
    def __get__(self):
      return self.thisptr.elem_marker
  property edge_marker:
    def __set__(self,int value):
      self.thisptr.edge_marker = value
    def __get__(self):
      return self.thisptr.edge_marker
      
cdef class PyInterfaceGeomReal(PyGeomReal):
  property neighb_id:
    def __set__(self,int value):
      (<InterfaceGeom[double]*> self.thisptr).neighb_id = value
    def __get__(self):
      return (<InterfaceGeom[double]*> self.thisptr).neighb_id
  property neighb_diam:
    def __set__(self,double value):
      (<InterfaceGeom[double]*> self.thisptr).neighb_diam = value
    def __get__(self):
      return (<InterfaceGeom[double]*> self.thisptr).neighb_diam


cdef class PyExtDataReal:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Func doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr
  property fn:
    def __set__(self, value):
      if self.thisptr.fn !=NULL:
        delBuffer[pFuncReal](<pFuncReal*>self.thisptr.fn)
      self.thisptr.fn = <Func[double]**> newBuffer[pFuncReal](len(value))
      for i in range(len(value)):
        self.thisptr.fn[i] = (<PyFuncReal> value[i]).thisptr
    def __get__(self):
      cdef PyFuncReal f = PyFuncReal()
      r = []
      for i in range(self.thisptr.get_nf()):
        f = PyFuncReal()
        f.thisptr = self.thisptr.fn[i]
        r.append(f)
      return r
  def get_nf(self):
    return self.thisptr.get_nf()

cdef class PyFuncComplex:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Func doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr 

  property val:
    def __set__(self, value):
      if self.thisptr.val!=NULL:
        delBuffer[cComplex[double]](self.thisptr.val)
      self.thisptr.val = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.val[i]))
      return r

  property dx:
    def __set__(self, value):
      if self.thisptr.dx!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dx)
      self.thisptr.dx = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dx[i]))
      return r

  property dy:
    def __set__(self, value):
      if self.thisptr.dy!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dy)
      self.thisptr.dy = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dy[i]))
      return r

  property laplace:
    def __set__(self, value):
      if self.thisptr.laplace!=NULL:
        delBuffer[cComplex[double]](self.thisptr.laplace)
      self.thisptr.laplace = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.laplace[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.laplace[i]))
      return r
        
  property val0:
    def __set__(self, value):
      if self.thisptr.val0!=NULL:
        delBuffer[cComplex[double]](self.thisptr.val0)
      self.thisptr.val0 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val0[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.val0[i]))
      return r

  property val1:
    def __set__(self, value):
      if self.thisptr.val1!=NULL:
        delBuffer[cComplex[double]](self.thisptr.val1)
      self.thisptr.val1 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val1[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.val1[i]))
      return r

  property dx0:
    def __set__(self, value):
      if self.thisptr.dx0!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dx0)
      self.thisptr.dx0 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx0[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dx0[i]))
      return r

  property dx1:
    def __set__(self, value):
      if self.thisptr.dx1!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dx1)
      self.thisptr.dx1 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx1[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dx1[i]))
      return r

  property dy0:
    def __set__(self, value):
      if self.thisptr.dy0!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dy0)
      self.thisptr.dy0 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy0[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dy0[i]))
      return r

  property dy1:
    def __set__(self, value):
      if self.thisptr.dy1!=NULL:
        delBuffer[cComplex[double]](self.thisptr.dy1)
      self.thisptr.dy1 = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy1[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.dy1[i]))
      return r

  property curl:
    def __set__(self, value):
      if self.thisptr.curl!=NULL:
        delBuffer[cComplex[double]](self.thisptr.curl)
      self.thisptr.curl = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.curl[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.curl[i]))
      return r

  property div:
    def __set__(self, value):
      if self.thisptr.div!=NULL:
        delBuffer[cComplex[double]](self.thisptr.div)
      self.thisptr.div = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.div[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.div[i]))
      return r

  def get_val_central(self, int k):
    return pcomplex(self.thisptr.get_val_central(k))
  def get_val_neighbor(self, int k):
    return pcomplex(self.thisptr.get_val_neighbor(k))
  def get_dx_central(self, int k):
    return pcomplex(self.thisptr.get_dx_central(k))
  def get_dx_neighbor(self, int k):
    return pcomplex(self.thisptr.get_dx_neighbor(k))
  def get_dy_central(self, int k):
    return pcomplex(self.thisptr.get_dy_central(k))
  def get_dy_neighbor(self, int k):
    return pcomplex(self.thisptr.get_dy_neighbor(k))
  def get_laplace_central(self, int k):
    return pcomplex(self.thisptr.get_laplace_central(k))
  def get_laplace_neighbor(self, int k):
    return pcomplex(self.thisptr.get_laplace_neighbor(k))
  def free_ord(self):
    self.thisptr.free_ord()
  def free_fn(self):
    self.thisptr.free_fn()
  def subtract(self, PyFuncComplex func):
    self.thisptr.subtract(func.thisptr[0])
  def add(self,  attribute, other_attribute):
    cdef cComplex[double] * cattribute = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
    cdef cComplex[double] * cother_attribute = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
    for i in range(self.thisptr.get_num_gip()):
      cattribute[i] = ccomplex(attribute[i])
      cother_attribute[i] = ccomplex(other_attribute[i])
    
    self.thisptr.add(cattribute, cother_attribute)
    for i in range(self.thisptr.get_num_gip()):
      attribute[i] = pcomplex(cattribute[i])

cdef class PyDiscontinuousFuncComplex(PyFuncComplex):
  def __cinit__(self, PyFuncComplex fn, fn_n, reverse = None, init = True):
    if not init:
      return
    if type(self)!=PyDiscontinuousFuncComplex:
      return

    support_on_neighbor = None
    if not isinstance(fn_n, PyFuncComplex):
      support_on_neighbor = fn_n
      fn_n = None

    if fn_n is not None:
      if reverse is not None:
        self.thisptr = <Func[cComplex[double]]*> new DiscontinuousFunc[cComplex[double]](fn.thisptr, (<PyFuncComplex> fn_n).thisptr,<bool> reverse)
      else:
        self.thisptr = <Func[cComplex[double]]*> new DiscontinuousFunc[cComplex[double]](fn.thisptr, (<PyFuncComplex> fn_n).thisptr)
    else:
      if reverse is not None:
        self.thisptr = <Func[cComplex[double]]*> new DiscontinuousFunc[cComplex[double]](fn.thisptr, <bool> support_on_neighbor,<bool> reverse)
        return
      if support_on_neighbor is not None:
        self.thisptr = <Func[cComplex[double]]*> new DiscontinuousFunc[cComplex[double]](fn.thisptr, <bool> support_on_neighbor)
        return
      self.thisptr = <Func[cComplex[double]]*> new DiscontinuousFunc[cComplex[double]](fn.thisptr)


  property fn_central:
    def __set__(self,PyFuncComplex value):
      (<DiscontinuousFunc[cComplex[double]]*> self.thisptr).fn_central = value.thisptr
    def __get__(self):
      cdef PyFuncComplex r = PyFuncComplex(init = False)
      r.thisptr = (<DiscontinuousFunc[cComplex[double]]*> self.thisptr).fn_central
      return r
  property fn_neighbor:
    def __set__(self,PyFuncComplex value):
      (<DiscontinuousFunc[cComplex[double]]*> self.thisptr).fn_neighbor = value.thisptr
    def __get__(self):
      cdef PyFuncComplex r = PyFuncComplex(init = False)
      r.thisptr = (<DiscontinuousFunc[cComplex[double]]*> self.thisptr).fn_neighbor
      return r

cdef class PyGeomComplex:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Func doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr

  property area:
    def __set__(self,complex value):
      self.thisptr.area = ccomplex(value)
    def __get__(self):
      return pcomplex(self.thisptr.area)
  property diam:
    def __set__(self,complex value):
      self.thisptr.diam = ccomplex(value)
    def __get__(self):
      return pcomplex(self.thisptr.diam)
  property id:
    def __set__(self,int value):
      self.thisptr.id = value
    def __get__(self):
      return self.thisptr.id

  property x:
    def __set__(self, value):
      if self.thisptr.x!=NULL:
        delBuffer[cComplex[double]](self.thisptr.x)
      self.thisptr.x = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.x[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()): #TODO optimize (direct acces)
        r.append(pcomplex(self.thisptr.x[i]))
      return r

  property y:
    def __set__(self, value):
      if self.thisptr.y!=NULL:
        delBuffer[cComplex[double]](self.thisptr.y)
      self.thisptr.y = <cComplex[double]*> newBuffer[cComplex[double]](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.y[i] = ccomplex(value[i])
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(pcomplex(self.thisptr.y[i]))
      return r
      
  def get_neighbor_marker(self):
    return self.thisptr.get_neighbor_marker()
  def get_neighbor_id(self):
    return self.thisptr.get_neighbor_id()
  def get_neighbor_diam(self):
    return pcomplex(self.thisptr.get_neighbor_diam())
  def free(self):
    self.thisptr.free()
  def free_ord(self):
    self.thisptr.free_ord()

  property elem_marker:
    def __set__(self,int value):
      self.thisptr.elem_marker = value
    def __get__(self):
      return self.thisptr.elem_marker
  property edge_marker:
    def __set__(self,int value):
      self.thisptr.edge_marker = value
    def __get__(self):
      return self.thisptr.edge_marker
      
cdef class PyInterfaceGeomComplex(PyGeomComplex):
  property neighb_id:
    def __set__(self,int value):
      (<InterfaceGeom[cComplex[double]]*> self.thisptr).neighb_id = value
    def __get__(self):
      return (<InterfaceGeom[cComplex[double]]*> self.thisptr).neighb_id
  property neighb_diam:
    def __set__(self,complex value):
      (<InterfaceGeom[cComplex[double]]*> self.thisptr).neighb_diam = ccomplex(value)
    def __get__(self):
      return pcomplex((<InterfaceGeom[cComplex[double]]*> self.thisptr).neighb_diam)


cdef class PyExtDataComplex:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("ExtData doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr
  property fn:
    def __set__(self, value):
      if self.thisptr.fn !=NULL:
        delBuffer[pFuncComplex](<pFuncComplex*>self.thisptr.fn)
      self.thisptr.fn = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(value))
      for i in range(len(value)):
        self.thisptr.fn[i] = (<PyFuncComplex> value[i]).thisptr
    def __get__(self):
      cdef PyFuncComplex f = PyFuncComplex()
      r = []
      for i in range(self.thisptr.get_nf()):
        f = PyFuncComplex()
        f.thisptr = self.thisptr.fn[i]
        r.append(f)
      return r
  def get_nf(self):
    return self.thisptr.get_nf()

cdef class PyFuncOrd:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Func doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr 

  property val:
    def __set__(self, value):
      if self.thisptr.val!=NULL:
        delBuffer[Ord](self.thisptr.val)
      self.thisptr.val = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.val[i].get_order()))
      return r

  property dx:
    def __set__(self, value):
      if self.thisptr.dx!=NULL:
        delBuffer[Ord](self.thisptr.dx)
      self.thisptr.dx = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dx[i].get_order()))
      return r

  property dy:
    def __set__(self, value):
      if self.thisptr.dy!=NULL:
        delBuffer[Ord](self.thisptr.dy)
      self.thisptr.dy = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dy[i].get_order()))
      return r

  property laplace:
    def __set__(self, value):
      if self.thisptr.laplace!=NULL:
        delBuffer[Ord](self.thisptr.laplace)
      self.thisptr.laplace = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.laplace[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.laplace[i].get_order()))
      return r
        
  property val0:
    def __set__(self, value):
      if self.thisptr.val0!=NULL:
        delBuffer[Ord](self.thisptr.val0)
      self.thisptr.val0 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val0[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.val0[i].get_order()))
      return r

  property val1:
    def __set__(self, value):
      if self.thisptr.val1!=NULL:
        delBuffer[Ord](self.thisptr.val1)
      self.thisptr.val1 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.val1[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.val1[i].get_order()))
      return r

  property dx0:
    def __set__(self, value):
      if self.thisptr.dx0!=NULL:
        delBuffer[Ord](self.thisptr.dx0)
      self.thisptr.dx0 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx0[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dx0[i].get_order()))
      return r

  property dx1:
    def __set__(self, value):
      if self.thisptr.dx1!=NULL:
        delBuffer[Ord](self.thisptr.dx1)
      self.thisptr.dx1 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dx1[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dx1[i].get_order()))
      return r

  property dy0:
    def __set__(self, value):
      if self.thisptr.dy0!=NULL:
        delBuffer[Ord](self.thisptr.dy0)
      self.thisptr.dy0 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy0[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dy0[i].get_order()))
      return r

  property dy1:
    def __set__(self, value):
      if self.thisptr.dy1!=NULL:
        delBuffer[Ord](self.thisptr.dy1)
      self.thisptr.dy1 = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.dy1[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.dy1[i].get_order()))
      return r

  property curl:
    def __set__(self, value):
      if self.thisptr.curl!=NULL:
        delBuffer[Ord](self.thisptr.curl)
      self.thisptr.curl = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.curl[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.curl[i].get_order()))
      return r

  property div:
    def __set__(self, value):
      if self.thisptr.div!=NULL:
        delBuffer[Ord](self.thisptr.div)
      self.thisptr.div = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.div[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()):
        r.append(PyOrd(self.thisptr.div[i].get_order()))
      return r

  def get_val_central(self, int k):
    return PyOrd(self.thisptr.get_val_central(k).get_order())
  def get_val_neighbor(self, int k):
    return PyOrd(self.thisptr.get_val_neighbor(k).get_order())
  def get_dx_central(self, int k):
    return PyOrd(self.thisptr.get_dx_central(k).get_order())
  def get_dx_neighbor(self, int k):
    return PyOrd(self.thisptr.get_dx_neighbor(k).get_order())
  def get_dy_central(self, int k):
    return PyOrd(self.thisptr.get_dy_central(k).get_order())
  def get_dy_neighbor(self, int k):
    return PyOrd(self.thisptr.get_dy_neighbor(k).get_order())
  def get_laplace_central(self, int k):
    return PyOrd(self.thisptr.get_laplace_central(k).get_order())
  def get_laplace_neighbor(self, int k):
    return PyOrd(self.thisptr.get_laplace_neighbor(k).get_order())
  def free_ord(self):
    self.thisptr.free_ord()
  def free_fn(self):
    self.thisptr.free_fn()
  def subtract(self, PyFuncOrd func):
    self.thisptr.subtract(func.thisptr[0])
  def add(self,  attribute, other_attribute):
    cdef Ord * cattribute = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
    cdef Ord * cother_attribute = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
    for i in range(self.thisptr.get_num_gip()):
      cattribute[i] = (<PyOrd> attribute[i]).thisptr[0]
      cother_attribute[i] = (<PyOrd> other_attribute[i]).thisptr[0]
    
    self.thisptr.add(cattribute, cother_attribute)
    for i in range(self.thisptr.get_num_gip()):
      attribute[i] = PyOrd(cattribute[i].get_order())

cdef class PyDiscontinuousFuncOrd(PyFuncOrd):
  def __cinit__(self, PyFuncOrd fn, fn_n, reverse = None, init = True):
    if not init:
      return
    if type(self)!=PyDiscontinuousFuncOrd:
      return

    support_on_neighbor = None
    if not isinstance(fn_n, PyFuncOrd):
      support_on_neighbor = fn_n
      fn_n = None

    if fn_n is not None:
      if reverse is not None:
        self.thisptr = <Func[Ord]*> new DiscontinuousFunc[Ord](fn.thisptr, (<PyFuncOrd> fn_n).thisptr,<bool> reverse)
      else:
        self.thisptr = <Func[Ord]*> new DiscontinuousFunc[Ord](fn.thisptr, (<PyFuncOrd> fn_n).thisptr)
    else:
      if reverse is not None:
        self.thisptr = <Func[Ord]*> new DiscontinuousFunc[Ord](fn.thisptr, <bool> support_on_neighbor,<bool> reverse)
        return
      if support_on_neighbor is not None:
        self.thisptr = <Func[Ord]*> new DiscontinuousFunc[Ord](fn.thisptr, <bool> support_on_neighbor)
        return
      self.thisptr = <Func[Ord]*> new DiscontinuousFunc[Ord](fn.thisptr)


  property fn_central:
    def __set__(self,PyFuncOrd value):
      (<DiscontinuousFunc[Ord]*> self.thisptr).fn_central = value.thisptr
    def __get__(self):
      cdef PyFuncOrd r = PyFuncOrd(init = False)
      r.thisptr = (<DiscontinuousFunc[Ord]*> self.thisptr).fn_central
      return r
  property fn_neighbor:
    def __set__(self,PyFuncOrd value):
      (<DiscontinuousFunc[Ord]*> self.thisptr).fn_neighbor = value.thisptr
    def __get__(self):
      cdef PyFuncOrd r = PyFuncOrd(init = False)
      r.thisptr = (<DiscontinuousFunc[Ord]*> self.thisptr).fn_neighbor
      return r

cdef class PyGeomOrd:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("Geom doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr

  property area:
    def __set__(self,PyOrd value):
      self.thisptr.area = value.thisptr[0]
    def __get__(self):
      cdef PyOrd r = PyOrd(self.thisptr.area.get_order())
      return r
  property diam:
    def __set__(self,PyOrd value):
      self.thisptr.diam = value.thisptr[0]
    def __get__(self):
      cdef PyOrd r = PyOrd(self.thisptr.diam.get_order())
      return r
  property id:
    def __set__(self,int value):
      self.thisptr.id = value
    def __get__(self):
      return self.thisptr.id

  def get_neighbor_marker(self):
    return self.thisptr.get_neighbor_marker()
  def get_neighbor_id(self):
    return self.thisptr.get_neighbor_id()
  def get_neighbor_diam(self):
    cdef PyOrd r = PyOrd(self.thisptr.get_neighbor_diam().get_order())
    return r
  def free(self):
    self.thisptr.free()
  def free_ord(self):
    self.thisptr.free_ord()

  property x:
    def __set__(self, value):
      if self.thisptr.x!=NULL:
        delBuffer[Ord](self.thisptr.x)
      self.thisptr.x = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.x[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()): #TODO optimize (direct acces)
        r.append(PyOrd(self.thisptr.x[i].get_order()))
      return r

  property y:
    def __set__(self, value):
      if self.thisptr.y!=NULL:
        delBuffer[Ord](self.thisptr.y)
      self.thisptr.y = <Ord*> newBuffer[Ord](self.thisptr.get_num_gip())
      for i in range(len(value)):
        self.thisptr.y[i] = (<PyOrd> value[i]).thisptr[0]
    def __get__(self):
      r = []
      for i in range(self.thisptr.get_num_gip()): #TODO optimize (direct acces)
        r.append(PyOrd(self.thisptr.y[i].get_order()))
      return r
      
  property elem_marker:
    def __set__(self,int value):
      self.thisptr.elem_marker = value
    def __get__(self):
      return self.thisptr.elem_marker
  property edge_marker:
    def __set__(self,int value):
      self.thisptr.edge_marker = value
    def __get__(self):
      return self.thisptr.edge_marker
      
cdef class PyInterfaceGeomOrd(PyGeomOrd):
  property neighb_id:
    def __set__(self,int value):
      (<InterfaceGeom[Ord]*> self.thisptr).neighb_id = value
    def __get__(self):
      return (<InterfaceGeom[Ord]*> self.thisptr).neighb_id
  property neighb_diam:
    def __set__(self,PyOrd value):
      (<InterfaceGeom[Ord]*> self.thisptr).neighb_diam = value.thisptr[0]
    def __get__(self):
      cdef PyOrd r = PyOrd((<InterfaceGeom[Ord]*> self.thisptr).neighb_diam.get_order())
      return r


cdef class PyExtDataOrd:
  def __init__(self,init = True, dealloc = True):
    self.dealloc = dealloc
    if init:
      raise RuntimeError("ExtData doesn't have public constructor")
  def __dealloc__(self):
    if self.dealloc:
      del self.thisptr
  property fn:
    def __set__(self, value):
      if self.thisptr.fn !=NULL:
        delBuffer[pFuncOrd](<pFuncOrd*>self.thisptr.fn)
      self.thisptr.fn = <Func[Ord]**> newBuffer[pFuncOrd](len(value))
      for i in range(len(value)):
        self.thisptr.fn[i] = (<PyFuncOrd> value[i]).thisptr
    def __get__(self):
      cdef PyFuncOrd f = PyFuncOrd()
      r = []
      for i in range(self.thisptr.get_nf()):
        f = PyFuncOrd()
        f.thisptr = self.thisptr.fn[i]
        r.append(f)
      return r
  def get_nf(self):
    return self.thisptr.get_nf()


def Pyinit_geom_ord(self):
  cdef PyGeomOrd r = PyGeomOrd(init = False)
  r.thisptr = init_geom_ord()
  return r
def Pyinit_geom_vol(self, PyRefMap rm, int order):
  cdef PyGeomReal r = PyGeomReal(init = False)
  r.thisptr = init_geom_vol(<RefMap*> rm.thisptr, order)
  return r
def Pyinit_geom_surf(self, PyRefMap rm, PySurfPos surf_pos, int order):
  cdef PyGeomReal r = PyGeomReal(init = False)
  r.thisptr = init_geom_surf(<RefMap*> rm.thisptr, surf_pos.thisptr, order)
  return r
def Pyinit_fn_ord(self, int order):
  cdef PyFuncOrd r = PyFuncOrd(init = False)
  r.thisptr = init_fn_ord(order)
  return r

def Pyinit_fn(self, fu, rm, order = None):
  cdef PyFuncReal rr = PyFuncReal(init = False)
  cdef PyFuncComplex rc = PyFuncComplex(init = False)
  if isinstance(rm,PyRefMap):
    rr.thisptr = init_fn(<PrecalcShapeset*> (<PyPrecalcShapeset> fu).thisptr, <RefMap*> (<PyRefMap> rm).thisptr, order)
    return rr
  order = rm
  if isinstance(fu,PyMeshFunctionReal):
    rr.thisptr = init_fn(<MeshFunction[double]*> (<PyMeshFunctionReal> fu).thisptr, <int> order)
    return rr
  if isinstance(fu,PyMeshFunctionComplex):
    rc.thisptr = init_fn(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> fu).thisptr, <int> order)
    return rc
  if isinstance(fu,PySolutionReal):
    rr.thisptr = init_fn(<Solution[double]*>(<PySolutionReal> fu).thisptr, <int> order)
    return rr
  if isinstance(fu,PySolutionComplex):
    rc.thisptr = init_fn(<Solution[cComplex[double]]*> (<PySolutionComplex> fu).thisptr, <int> order)
    return rc

cdef class PyFuncRealArray:
  def __getitem__(self, idx):
    cdef PyFuncReal f = PyFuncReal(init=False, dealloc=False)
    f.thisptr = self.thisptr[idx]
    return f

cdef class PyFuncComplexArray:
  def __getitem__(self, idx):
    cdef PyFuncComplex f = PyFuncComplex(init=False, dealloc=False)
    f.thisptr = self.thisptr[idx]
    return f

cdef class PyFuncOrdArray:
  def __getitem__(self, idx):
    cdef PyFuncOrd f = PyFuncOrd(init=False, dealloc=False)
    f.thisptr = self.thisptr[idx]
    return f





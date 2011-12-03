class PySymFlag:
  HERMES_ANTISYM = -1
  HERMES_NONSYM = 0
  HERMES_SYM = 1

cdef class PyMatrixFormVolReal(PyFormReal):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if type(self)!=PyMatrixFormVolReal:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j,carea)
        return
      self.thisptr = <Form[double]*> new MatrixFormVol[double](i, j)

  def clone(self):
    cdef PyMatrixFormVolReal r = PyMatrixFormVolReal(0,0,init = False)
    r.thisptr = (<MatrixFormVol[double]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<MatrixFormVol[double]*> self.thisptr).i = value
    def __get__(self):
      return (<MatrixFormVol[double]*> self.thisptr).i
  property j:
    def __set__(self, unsigned int value):
      (<MatrixFormVol[double]*> self.thisptr).j = value
    def __get__(self):
      return (<MatrixFormVol[double]*> self.thisptr).j
  property sym:
    def __set__(self, int value):
      (<MatrixFormVol[double]*> self.thisptr).sym = value
    def __get__(self):
      return (<MatrixFormVol[double]*> self.thisptr).sym

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataReal ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    r = (<MatrixFormVol[double]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    return r
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MatrixFormVol[double]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyMatrixFormSurfReal(PyFormReal):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if type(self)!=PyMatrixFormSurfReal:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,careas, cext)
        return
      self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j,carea)
        return
      self.thisptr = <Form[double]*> new MatrixFormSurf[double](i, j)

  def clone(self):
    cdef PyMatrixFormSurfReal r = PyMatrixFormSurfReal(0,0,init = False)
    r.thisptr = (<MatrixFormSurf[double]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<MatrixFormSurf[double]*> self.thisptr).i = value
    def __get__(self):
      return (<MatrixFormSurf[double]*> self.thisptr).i
  property j:
    def __set__(self, unsigned int value):
      (<MatrixFormSurf[double]*> self.thisptr).j = value
    def __get__(self):
      return (<MatrixFormSurf[double]*> self.thisptr).j

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataReal ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    r = (<MatrixFormSurf[double]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    return r
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MatrixFormSurf[double]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyVectorFormVolReal(PyFormReal):
  def __cinit__(self, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if type(self)!=PyVectorFormVolReal:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,careas, cext)
        return
      self.thisptr = <Form[double]*> new VectorFormVol[double](j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new VectorFormVol[double](j,carea)
        return
      self.thisptr = <Form[double]*> new VectorFormVol[double](j)

  def clone(self):
    cdef PyVectorFormVolReal r = PyVectorFormVolReal(0,0,init = False)
    r.thisptr = (<VectorFormVol[double]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<VectorFormVol[double]*> self.thisptr).i = value
    def __get__(self):
      return (<VectorFormVol[double]*> self.thisptr).i

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataReal ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    r = (<VectorFormVol[double]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    return r
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<VectorFormVol[double]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyVectorFormSurfReal(PyFormReal):
  def __cinit__(self, unsigned int j, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if type(self)!=PyVectorFormSurfReal:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,careas, cext)
        return
      self.thisptr = <Form[double]*> new VectorFormSurf[double](j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new VectorFormSurf[double](j,carea)
        return
      self.thisptr = <Form[double]*> new VectorFormSurf[double](j)

  def clone(self):
    cdef PyVectorFormSurfReal r = PyVectorFormSurfReal(0,0,init = False)
    r.thisptr = (<VectorFormSurf[double]* > self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<VectorFormSurf[double]* > self.thisptr).i = value
    def __get__(self):
      return (<VectorFormSurf[double]* > self.thisptr).i

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataReal ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    r = (<VectorFormSurf[double]* > self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    return r
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<VectorFormSurf[double]* > self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r


cdef class PyMultiComponentMatrixFormVolReal(PyFormReal):
  def clone(self):
    cdef PyVectorFormSurfReal r = PyVectorFormSurfReal(0,0,init = False)
    r.thisptr = (<MultiComponentMatrixFormVol[double]*> self.thisptr).clone() 
    return r

  property sym:
    def __set__(self, int value):
      (<MultiComponentMatrixFormVol[double]*> self.thisptr).sym = value
    def __get__(self):
      return (<MultiComponentMatrixFormVol[double]*> self.thisptr).sym

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataReal ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    cdef vector[double] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    (<MultiComponentMatrixFormVol[double]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr, cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    for i in range(cresult.size()):
      result.append(cresult.at(i))
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentMatrixFormVol[double]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      cdef pair[unsigned int, unsigned int] v
      r = []
      for i in range((<MultiComponentMatrixFormVol[double]*> self.thisptr).coordinates.size()):
        v =<pair[unsigned int, unsigned int]> (<MultiComponentMatrixFormVol[double]*> self.thisptr).coordinates.at(i)
        r.append([v.first, v.second])
      return r
    def __set__(self,value):
      cdef pair[unsigned int, unsigned int] v
      (<MultiComponentMatrixFormVol[double]*> self.thisptr).coordinates.clear()
      for i in value:
        v.first = i[0]
        v.second = i[1]
        (<MultiComponentMatrixFormVol[double]*> self.thisptr).coordinates.push_back(<upair> v)


cdef class PyMultiComponentMatrixFormSurfReal(PyFormReal):
  def clone(self):
    cdef PyVectorFormSurfReal r = PyVectorFormSurfReal(0,0,init = False)
    r.thisptr = (<MultiComponentMatrixFormSurf[double]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataReal ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    cdef vector[double] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    (<MultiComponentMatrixFormSurf[double]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr,cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    for i in range(cresult.size()):
      result.append(cresult.at(i))
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentMatrixFormSurf[double]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      cdef pair[unsigned int, unsigned int] v
      r = []
      for i in range((<MultiComponentMatrixFormSurf[double]*> self.thisptr).coordinates.size()):
        v=<pair[unsigned int, unsigned int]> (<MultiComponentMatrixFormSurf[double]*> self.thisptr).coordinates.at(i)
        r.append([v.first, v.second])
      return r
    def __set__(self,value):
      cdef pair[unsigned int, unsigned int] v
      (<MultiComponentMatrixFormSurf[double]*> self.thisptr).coordinates.clear()
      for i in value:
        v.first = i[0]
        v.second = i[1]
        (<MultiComponentMatrixFormSurf[double]*> self.thisptr).coordinates.push_back(<upair> v)

cdef class PyMultiComponentVectorFormVolReal(PyFormReal):
  def clone(self):
    cdef PyVectorFormSurfReal r = PyVectorFormSurfReal(0,0,init = False)
    r.thisptr = (<MultiComponentVectorFormVol[double]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataReal ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    cdef vector[double] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    (<MultiComponentVectorFormVol[double]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr, cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    for i in range(cresult.size()):
      result.append(cresult.at(i))
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentVectorFormVol[double]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      r = []
      for i in range((<MultiComponentVectorFormVol[double]*> self.thisptr).coordinates.size()):
        r.append((<MultiComponentVectorFormVol[double]*> self.thisptr).coordinates.at(i))
      return r
    def __set__(self,value):
      (<MultiComponentVectorFormVol[double]*> self.thisptr).coordinates.clear()
      for i in value:
        (<MultiComponentVectorFormVol[double]*> self.thisptr).coordinates.push_back(i)

cdef class PyMultiComponentVectorFormSurfReal(PyFormReal):

  def clone(self):
    cdef PyVectorFormSurfReal r = PyVectorFormSurfReal(0,0,init = False)
    r.thisptr = (<MultiComponentVectorFormSurf[double]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataReal ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[double] ** cu_ext = <Func[double]**> newBuffer[pFuncReal](len(u_ext))
    cdef vector[double] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncReal> u_ext[i]).thisptr
    (<MultiComponentVectorFormSurf[double]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr,cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncReal](<pFuncReal*>cu_ext)
    for i in range(cresult.size()):
      result.apend(cresult.at(i))
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentVectorFormSurf[double]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      r = []
      for i in range((<MultiComponentVectorFormSurf[double]*> self.thisptr).coordinates.size()):
        r.append((<MultiComponentVectorFormSurf[double]*> self.thisptr).coordinates.at(i))
      return r
    def __set__(self,value):
      (<MultiComponentVectorFormSurf[double]*> self.thisptr).coordinates.clear()
      for i in value:
        (<MultiComponentVectorFormSurf[double]*> self.thisptr).coordinates.push_back(i)

from cython.operator cimport dereference as deref, preincrement as inc
cdef class PyStageReal:
  def __cinit__(self,init = True):
    if not init:
      return
    if type(self)!=PyStageReal:
      return
    self.thisptr = new Stage[double]()

  def __dealloc__(self):
    del self.thisptr

  property idx:
    def __set__(self, value):
      self.thisptr.idx.clear()
      for v in value:
        self.thisptr.idx.push_back(v)
    def __get__(self):
      r = []
      for i in range(self.thisptr.idx.size()):
        r.append(self.thisptr.idx.at(i))
      return r

  property meshes:
    def __set__(self, value):
      self.thisptr.meshes.clear()
      for v in value:
        self.thisptr.meshes.push_back((<PyMesh>v).thisptr)
    def __get__(self):
      cdef PyMesh m = PyMesh(init = False)
      r = []
      for i in range(self.thisptr.meshes.size()):
        m = PyMesh(init = False)
        m.thisptr = self.thisptr.meshes.at(i)
        r.append(m)
      return r
  property fns:
    def __set__(self, value):
      self.thisptr.fns.clear()
      for v in value:
        self.thisptr.fns.push_back((<PyTransformable>v).thisptr)
    def __get__(self):
      cdef PyTransformable m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.fns.size()):
        m = PyTransformable(init = False)
        m.thisptr = self.thisptr.fns.at(i)
        r.append(m)
      return r
  property ext:
    def __set__(self, value):
      self.thisptr.ext.clear()
      for v in value:
        self.thisptr.ext.push_back(<MeshFunction[double]*> (<PyMeshFunctionReal>v).thisptr)
    def __get__(self):
      cdef PyMeshFunctionReal m = PyMeshFunctionReal(init = False)
      r = []
      for i in range(self.thisptr.ext.size()):
        m = PyMeshFunctionReal(init = False)
        m.thisptr = <Transformable*> self.thisptr.ext.at(i)
        r.append(m)
      return r
  property mfvol:
    def __set__(self, value):
      self.thisptr.mfvol.clear()
      for v in value:
        self.thisptr.mfvol.push_back(<MatrixFormVol[double]*> (<PyMatrixFormVolReal>v).thisptr)
    def __get__(self):
      cdef PyMatrixFormVolReal m = PyMatrixFormVolReal(init = False)
      r = []
      for i in range(self.thisptr.mfvol.size()):
        m = PyMatrixFormVolReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.mfvol.at(i)
        r.append(m)
      return r
  property mfsurf:
    def __set__(self, value):
      self.thisptr.mfsurf.clear()
      for v in value:
        self.thisptr.mfsurf.push_back(<MatrixFormSurf[double]*> (<PyMatrixFormSurfReal>v).thisptr)
    def __get__(self):
      cdef PyMatrixFormSurfReal m = PyMatrixFormSurfReal(init = False)
      r = []
      for i in range(self.thisptr.mfsurf.size()):
        m = PyMatrixFormSurfReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.mfsurf.at(i)
        r.append(m)
      return r
  property vfvol:
    def __set__(self, value):
      self.thisptr.vfvol.clear()
      for v in value:
        self.thisptr.vfvol.push_back(<VectorFormVol[double]*> (<PyVectorFormVolReal>v).thisptr)
    def __get__(self):
      cdef PyVectorFormVolReal m = PyVectorFormVolReal(init = False)
      r = []
      for i in range(self.thisptr.vfvol.size()):
        m = PyVectorFormVolReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.vfvol.at(i)
        r.append(m)
      return r
  property vfsurf:
    def __set__(self, value):
      self.thisptr.vfsurf.clear()
      for v in value:
        self.thisptr.vfsurf.push_back(<VectorFormSurf[double]*> (<PyVectorFormSurfReal>v).thisptr)
    def __get__(self):
      cdef PyVectorFormSurfReal m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfsurf.size()):
        m = PyVectorFormSurfReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.vfsurf.at(i)
        r.append(m)
      return r
  property mfvol_mc:
    def __set__(self, value):
      self.thisptr.mfvol_mc.clear()
      for v in value:
        self.thisptr.mfvol_mc.push_back(<MultiComponentMatrixFormVol[double]*> (<PyMultiComponentMatrixFormVolReal>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentMatrixFormVolReal m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.mfvol_mc.size()):
        m = PyMultiComponentMatrixFormVolReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.mfvol_mc.at(i)
        r.append(m)
      return r
  property mfsurf_mc:
    def __set__(self, value):
      self.thisptr.mfsurf_mc.clear()
      for v in value:
        self.thisptr.mfsurf_mc.push_back(<MultiComponentMatrixFormSurf[double]*> (<PyMultiComponentMatrixFormSurfReal>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentMatrixFormSurfReal m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.mfsurf_mc.size()):
        m = PyMultiComponentMatrixFormSurfReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.mfsurf_mc.at(i)
        r.append(m)
      return r
  property vfvol_mc:
    def __set__(self, value):
      self.thisptr.vfvol_mc.clear()
      for v in value:
        self.thisptr.vfvol_mc.push_back(<MultiComponentVectorFormVol[double]*> (<PyMultiComponentVectorFormVolReal>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentVectorFormVolReal m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfvol_mc.size()):
        m = PyMultiComponentVectorFormVolReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.vfvol_mc.at(i)
        r.append(m)
      return r
  property vfsurf_mc:
    def __set__(self, value):
      self.thisptr.vfsurf_mc.clear()
      for v in value:
        self.thisptr.vfsurf_mc.push_back(<MultiComponentVectorFormSurf[double]*> (<PyMultiComponentVectorFormSurfReal>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentVectorFormSurfReal m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfsurf_mc.size()):
        m = PyMultiComponentVectorFormSurfReal(init = False)
        m.thisptr = <Form[double]*> self.thisptr.vfsurf_mc.at(i)
        r.append(m)
      return r
  property idx_set:
    def __set__(self, value):
      self.thisptr.idx_set.clear()
      for v in value:
        self.thisptr.idx_set.insert(v)
    def __get__(self):
      cdef cSet[int].iterator i = self.thisptr.idx_set.begin()
      r = set()
      while i != self.thisptr.idx_set.end():
        r.add(deref(i))
        inc(i)
      return r
  property seq_set:
    def __set__(self, value):
      self.thisptr.seq_set.clear()
      for v in value:
        self.thisptr.seq_set.insert(v)
    def __get__(self):
      cdef cSet[unsigned int].iterator i = self.thisptr.seq_set.begin()
      r = set()
      while i != self.thisptr.seq_set.end():
        r.add(deref(i))
        inc(i)
      return r
  property ext_set:
    def __set__(self, value):
      self.thisptr.ext_set.clear()
      for v in value:
        self.thisptr.ext_set.insert(<MeshFunction[double]*> (<PyMeshFunctionReal>v).thisptr)
    def __get__(self):
      cdef cSet[pMeshFunctionReal].iterator i = self.thisptr.ext_set.begin()     
      cdef PyMeshFunctionReal m = PyMeshFunctionReal(init = False)
      r = set()
      while i != self.thisptr.ext_set.end():
        m = PyMeshFunctionReal(init = False)
        m.thisptr = <Transformable*> deref(i)
        r.add(m)
        inc(i)
      return r

cdef class PyWeakFormReal:
  def __cinit__(self, neq = None, mat_free = None, init = True):
    if not init:
      return
    if type(self)!=PyWeakFormReal:
      return
    if mat_free is not None:
      self.thisptr = new WeakForm[double](neq, mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[double](neq)
      return
    self.thisptr = new WeakForm[double]()
  def __dealloc__(self):
    del self.thisptr
  def add_matrix_form(self, PyMatrixFormVolReal mfv):
    self.thisptr.add_matrix_form(<MatrixFormVol[double]*> mfv.thisptr)
  def add_matrix_form_surf(self, PyMatrixFormSurfReal mfs):
    self.thisptr.add_matrix_form_surf(<MatrixFormSurf[double]*> mfs.thisptr)
  def add_vector_form(self, PyVectorFormVolReal vfv):
    self.thisptr.add_vector_form(<VectorFormVol[double]*> vfv.thisptr)
  def add_vector_form_surf(self, PyVectorFormSurfReal vfs):
    self.thisptr.add_vector_form_surf(<VectorFormSurf[double]*> vfs.thisptr)
  def add_multicomponent_matrix_form(self, PyMultiComponentMatrixFormVolReal mfv):
    self.thisptr.add_multicomponent_matrix_form(<MultiComponentMatrixFormVol[double]*> mfv.thisptr)
  def add_multicomponent_matrix_form_surf(self, PyMultiComponentMatrixFormSurfReal mfs):
    self.thisptr.add_multicomponent_matrix_form_surf(<MultiComponentMatrixFormSurf[double]*> mfs.thisptr)
  def add_multicomponent_vector_form(self, PyMultiComponentVectorFormVolReal vfv):
    self.thisptr.add_multicomponent_vector_form(<MultiComponentVectorFormVol[double]*> vfv.thisptr)
  def add_multicomponent_vector_form_surf(self, PyMultiComponentVectorFormSurfReal vfs):
    self.thisptr.add_multicomponent_vector_form_surf(<MultiComponentVectorFormSurf[double]*> vfs.thisptr)
  def get_neq(self):
    return self.thisptr.get_neq()
  def is_matrix_free(self):
    return self.thisptr.is_matrix_free()
  def set_current_time(self, double time):
    self.thisptr.set_current_time(time)
  def get_current_time(self):
    return self.thisptr.get_current_time()

  def get_mfvol(self):
    cdef vector[pMatrixFormVolReal] cr = self.thisptr.get_mfvol()
    cdef PyMatrixFormVolReal f = PyMatrixFormVolReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMatrixFormVolReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_mfsurf(self):
    cdef vector[pMatrixFormSurfReal] cr = self.thisptr.get_mfsurf()
    cdef PyMatrixFormSurfReal f = PyMatrixFormSurfReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMatrixFormSurfReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_vfvol(self):
    cdef vector[pVectorFormVolReal] cr = self.thisptr.get_vfvol()
    cdef PyVectorFormVolReal f = PyVectorFormVolReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyVectorFormVolReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_vfsurf(self):
    cdef vector[pVectorFormSurfReal] cr = self.thisptr.get_vfsurf()
    cdef PyVectorFormSurfReal f = PyVectorFormSurfReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyVectorFormSurfReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_mfvol_mc(self):
    cdef vector[pMultiComponentMatrixFormVolReal] cr = self.thisptr.get_mfvol_mc()
    cdef PyMultiComponentMatrixFormVolReal f = PyMultiComponentMatrixFormVolReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentMatrixFormVolReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_mfsurf_mc(self):
    cdef vector[pMultiComponentMatrixFormSurfReal] cr = self.thisptr.get_mfsurf_mc()
    cdef PyMultiComponentMatrixFormSurfReal f = PyMultiComponentMatrixFormSurfReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentMatrixFormSurfReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_vfvol_mc(self):
    cdef vector[pMultiComponentVectorFormVolReal] cr = self.thisptr.get_vfvol_mc()
    cdef PyMultiComponentVectorFormVolReal f = PyMultiComponentVectorFormVolReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentVectorFormVolReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f
  def get_vfsurf_mc(self()):
    cdef vector[pMultiComponentVectorFormSurfReal] cr = self.thisptr.get_vfsurf_mc()
    cdef PyMultiComponentVectorFormSurfReal f = PyMultiComponentVectorFormSurfReal(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentVectorFormSurfReal(init = False)
      f.thisptr = <Form[double]*> cr.at(i)
      r.append(f)
    return f

cdef class PyFormReal:
  def __cinit__(self, area, ext, scaling_factor, u_ext_offset,init = True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    if type(self)!=PyFormReal:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = new Form[double](careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = new Form[double](careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = new Form[double](careas, cext)
        return
      self.thisptr = new Form[double](careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = new Form[double](carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = new Form[double](carea, cext,<double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = new Form[double](carea, cext)
        return
      if area is not None:
        self.thisptr = new Form[double](carea)
        return
      self.thisptr = new Form[double]()
  def set_weakform(self, PyWeakFormReal wf):
    self.thisptr.set_weakform(wf.thisptr)
  def set_current_stage_time(self, double time):
    self.thisptr.set_current_stage_time(time)
  def get_current_stage_time(self, ):
    return self.thisptr.get_current_stage_time()
  property areas:
    def __set__(self, value):
      cdef string s
      self.thisptr.areas.clear()
      for v in value:
        s.assign(<char*> v)
        self.thisptr.areas.push_back(s)
    def __get__(self):
      r = []
      for i in range(self.thisptr.areas.size()):
        r.append(self.thisptr.areas.at(i).c_str())
      return r
  property ext:
    def __set__(self, value):
      self.thisptr.ext.clear()
      for v in value:
        self.thisptr.ext.push_back(<MeshFunction[double]*> (<PyMeshFunctionReal>v).thisptr)
    def __get__(self):
      cdef PyMeshFunctionReal m = PyMeshFunctionReal(init = False)
      r = []
      for i in range(self.thisptr.ext.size()):
        m = PyMeshFunctionReal(init = False)
        m.thisptr = <Transformable*> self.thisptr.ext.at(i)
        r.append(r)
      return r

  property scaling_factor:
    def __set__(self,double value):
      self.thisptr.scaling_factor = value
    def __get__(self):
      return self.thisptr.scaling_factor

  property u_ext_offset:
    def __set__(self,int value):
      self.thisptr.u_ext_offset = value
    def __get__(self):
      return self.thisptr.u_ext_offset

cdef class PyMatrixFormVolComplex(PyFormComplex):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if type(self)!=PyMatrixFormVolComplex:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new MatrixFormVol[cComplex[double]](i, j)

  def clone(self):
    cdef PyMatrixFormVolComplex r = PyMatrixFormVolComplex(0,0,init = False)
    r.thisptr = (<MatrixFormVol[cComplex[double]]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<MatrixFormVol[cComplex[double]]*> self.thisptr).i = value
    def __get__(self):
      return (<MatrixFormVol[cComplex[double]]*> self.thisptr).i
  property j:
    def __set__(self, unsigned int value):
      (<MatrixFormVol[cComplex[double]]*> self.thisptr).j = value
    def __get__(self):
      return (<MatrixFormVol[cComplex[double]]*> self.thisptr).j
  property sym:
    def __set__(self, int value):
      (<MatrixFormVol[cComplex[double]]*> self.thisptr).sym = value
    def __get__(self):
      return (<MatrixFormVol[cComplex[double]]*> self.thisptr).sym

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[complexPointer](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    r = (<MatrixFormVol[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    return pcomplex(r)
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MatrixFormVol[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyMatrixFormSurfComplex(PyFormComplex):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if type(self)!=PyMatrixFormSurfComplex:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new MatrixFormSurf[cComplex[double]](i, j)

  def clone(self):
    cdef PyMatrixFormSurfComplex r = PyMatrixFormSurfComplex(0,0,init = False)
    r.thisptr = (<MatrixFormSurf[cComplex[double]]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<MatrixFormSurf[cComplex[double]]*> self.thisptr).i = value
    def __get__(self):
      return (<MatrixFormSurf[cComplex[double]]*> self.thisptr).i
  property j:
    def __set__(self, unsigned int value):
      (<MatrixFormSurf[cComplex[double]]*> self.thisptr).j = value
    def __get__(self):
      return (<MatrixFormSurf[cComplex[double]]*> self.thisptr).j

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    r = (<MatrixFormSurf[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    return pcomplex(r)
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MatrixFormSurf[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyVectorFormVolComplex(PyFormComplex):
  def __cinit__(self, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if type(self)!=PyVectorFormVolComplex:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new VectorFormVol[cComplex[double]](j)

  def clone(self):
    cdef PyVectorFormVolComplex r = PyVectorFormVolComplex(0,0,init = False)
    r.thisptr = (<VectorFormVol[cComplex[double]]*> self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<VectorFormVol[cComplex[double]]*> self.thisptr).i = value
    def __get__(self):
      return (<VectorFormVol[cComplex[double]]*> self.thisptr).i

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    r = (<VectorFormVol[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    return pcomplex(r)
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<VectorFormVol[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

cdef class PyVectorFormSurfComplex(PyFormComplex):
  def __cinit__(self, unsigned int j, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if type(self)!=PyVectorFormSurfComplex:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new VectorFormSurf[cComplex[double]](j)

  def clone(self):
    cdef PyVectorFormSurfComplex r = PyVectorFormSurfComplex(0,0,init = False)
    r.thisptr = (<VectorFormSurf[cComplex[double]]* > self.thisptr).clone() 
    return r
  property i:
    def __set__(self, unsigned int value):
      (<VectorFormSurf[cComplex[double]]* > self.thisptr).i = value
    def __get__(self):
      return (<VectorFormSurf[cComplex[double]]* > self.thisptr).i

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    r = (<VectorFormSurf[cComplex[double]]* > self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    return pcomplex(r)
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<VectorFormSurf[cComplex[double]]* > self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r


cdef class PyMultiComponentMatrixFormVolComplex(PyFormComplex):
  def clone(self):
    cdef PyVectorFormSurfComplex r = PyVectorFormSurfComplex(0,0,init = False)
    r.thisptr = (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).clone() 
    return r

  property sym:
    def __set__(self, int value):
      (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).sym = value
    def __get__(self):
      return (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).sym

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    cdef vector[cComplex[double]] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr, cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    for i in range(cresult.size()):
      result.append(pcomplex(cresult.at(i)))
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      cdef pair[unsigned int, unsigned int] v
      r = []
      for i in range((<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).coordinates.size()):
        v =<pair[unsigned int, unsigned int]> (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).coordinates.at(i)
        r.append([v.first, v.second])
      return r
    def __set__(self,value):
      cdef pair[unsigned int, unsigned int] v
      (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).coordinates.clear()
      for i in value:
        v.first = i[0]
        v.second = i[1]
        (<MultiComponentMatrixFormVol[cComplex[double]]*> self.thisptr).coordinates.push_back(<upair> v)


cdef class PyMultiComponentMatrixFormSurfComplex(PyFormComplex):
  def clone(self):
    cdef PyVectorFormSurfComplex r = PyVectorFormSurfComplex(0,0,init = False)
    r.thisptr = (<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal u, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    cdef vector[cComplex[double]] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    (<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr,cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    for i in range(cresult.size()):
      result.append(pcomplex(cresult.at(i)))
  def ord(self, int n, wt, u_ext, PyFuncOrd u, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, u.thisptr, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      cdef pair[unsigned int, unsigned int] v
      r = []
      for i in range((<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).coordinates.size()):
        v=<pair[unsigned int, unsigned int]> (<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).coordinates.at(i)
        r.append([v.first, v.second])
      return r
    def __set__(self,value):
      cdef pair[unsigned int, unsigned int] v
      (<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).coordinates.clear()
      for i in value:
        v.first = i[0]
        v.second = i[1]
        (<MultiComponentMatrixFormSurf[cComplex[double]]*> self.thisptr).coordinates.push_back(<upair> v)

cdef class PyMultiComponentVectorFormVolComplex(PyFormComplex):
  def clone(self):
    cdef PyVectorFormSurfComplex r = PyVectorFormSurfComplex(0,0,init = False)
    r.thisptr = (<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    cdef vector[cComplex[double]] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    (<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr, cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    for i in range(cresult.size()):
      result.append(pcomplex(cresult.at(i)))
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      r = []
      for i in range((<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).coordinates.size()):
        r.append((<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).coordinates.at(i))
      return r
    def __set__(self,value):
      (<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).coordinates.clear()
      for i in value:
        (<MultiComponentVectorFormVol[cComplex[double]]*> self.thisptr).coordinates.push_back(i)

cdef class PyMultiComponentVectorFormSurfComplex(PyFormComplex):

  def clone(self):
    cdef PyVectorFormSurfComplex r = PyVectorFormSurfComplex(0,0,init = False)
    r.thisptr = (<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).clone() 
    return r

  def value(self, int n, wt, u_ext, PyFuncReal v, PyGeomReal e, PyExtDataComplex ext, list result):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[cComplex[double]] ** cu_ext = <Func[cComplex[double]]**> newBuffer[pFuncComplex](len(u_ext))
    cdef vector[cComplex[double]] cresult
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncComplex> u_ext[i]).thisptr
    (<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).value(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr,cresult)
    delBuffer[double](cwt)
    delBuffer[pFuncComplex](<pFuncComplex*>cu_ext)
    for i in range(cresult.size()):
      result.apend(pcomplex(cresult.at(i)))
  def ord(self, int n, wt, u_ext, PyFuncOrd v, PyGeomOrd e, PyExtDataOrd ext):
    cdef double * cwt = <double*> newBuffer[double](len(wt))
    cdef Func[Ord] ** cu_ext = <Func[Ord]**> newBuffer[pFuncOrd](len(u_ext))
    cdef PyFuncOrd r = PyFuncOrd(init = False)
    for i in range(len(wt)):
      cwt[i] = wt[i]
    for i in range(len(u_ext)):
      cu_ext[i] = (<PyFuncOrd> u_ext[i]).thisptr
    r = PyFuncOrd((<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).ord(n, cwt, cu_ext, v.thisptr, e.thisptr, ext.thisptr).get_order())
    delBuffer[double](cwt)
    delBuffer[pFuncOrd](<pFuncOrd*> cu_ext)
    return r

  property coordinates:
    def __get__(self):
      r = []
      for i in range((<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).coordinates.size()):
        r.append((<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).coordinates.at(i))
      return r
    def __set__(self,value):
      (<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).coordinates.clear()
      for i in value:
        (<MultiComponentVectorFormSurf[cComplex[double]]*> self.thisptr).coordinates.push_back(i)

from cython.operator cimport dereference as deref, preincrement as inc
cdef class PyStageComplex:
  def __cinit__(self,init = True):
    if not init:
      return
    if type(self)!=PyStageComplex:
      return
    self.thisptr = new Stage[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  property idx:
    def __set__(self, value):
      self.thisptr.idx.clear()
      for v in value:
        self.thisptr.idx.push_back(v)
    def __get__(self):
      r = []
      for i in range(self.thisptr.idx.size()):
        r.append(self.thisptr.idx.at(i))
      return r

  property meshes:
    def __set__(self, value):
      self.thisptr.meshes.clear()
      for v in value:
        self.thisptr.meshes.push_back((<PyMesh>v).thisptr)
    def __get__(self):
      cdef PyMesh m = PyMesh(init = False)
      r = []
      for i in range(self.thisptr.meshes.size()):
        m = PyMesh(init = False)
        m.thisptr = self.thisptr.meshes.at(i)
        r.append(m)
      return r
  property fns:
    def __set__(self, value):
      self.thisptr.fns.clear()
      for v in value:
        self.thisptr.fns.push_back((<PyTransformable>v).thisptr)
    def __get__(self):
      cdef PyTransformable m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.fns.size()):
        m = PyTransformable(init = False)
        m.thisptr = self.thisptr.fns.at(i)
        r.append(m)
      return r
  property ext:
    def __set__(self, value):
      self.thisptr.ext.clear()
      for v in value:
        self.thisptr.ext.push_back(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex>v).thisptr)
    def __get__(self):
      cdef PyMeshFunctionComplex m = PyMeshFunctionComplex(init = False)
      r = []
      for i in range(self.thisptr.ext.size()):
        m = PyMeshFunctionComplex(init = False)
        m.thisptr = <Transformable*> self.thisptr.ext.at(i)
        r.append(m)
      return r
  property mfvol:
    def __set__(self, value):
      self.thisptr.mfvol.clear()
      for v in value:
        self.thisptr.mfvol.push_back(<MatrixFormVol[cComplex[double]]*> (<PyMatrixFormVolComplex>v).thisptr)
    def __get__(self):
      cdef PyMatrixFormVolComplex m = PyMatrixFormVolComplex(init = False)
      r = []
      for i in range(self.thisptr.mfvol.size()):
        m = PyMatrixFormVolComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.mfvol.at(i)
        r.append(m)
      return r
  property mfsurf:
    def __set__(self, value):
      self.thisptr.mfsurf.clear()
      for v in value:
        self.thisptr.mfsurf.push_back(<MatrixFormSurf[cComplex[double]]*> (<PyMatrixFormSurfComplex>v).thisptr)
    def __get__(self):
      cdef PyMatrixFormSurfComplex m = PyMatrixFormSurfComplex(init = False)
      r = []
      for i in range(self.thisptr.mfsurf.size()):
        m = PyMatrixFormSurfComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.mfsurf.at(i)
        r.append(m)
      return r
  property vfvol:
    def __set__(self, value):
      self.thisptr.vfvol.clear()
      for v in value:
        self.thisptr.vfvol.push_back(<VectorFormVol[cComplex[double]]*> (<PyVectorFormVolComplex>v).thisptr)
    def __get__(self):
      cdef PyVectorFormVolComplex m = PyVectorFormVolComplex(init = False)
      r = []
      for i in range(self.thisptr.vfvol.size()):
        m = PyVectorFormVolComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.vfvol.at(i)
        r.append(m)
      return r
  property vfsurf:
    def __set__(self, value):
      self.thisptr.vfsurf.clear()
      for v in value:
        self.thisptr.vfsurf.push_back(<VectorFormSurf[cComplex[double]]*> (<PyVectorFormSurfComplex>v).thisptr)
    def __get__(self):
      cdef PyVectorFormSurfComplex m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfsurf.size()):
        m = PyVectorFormSurfComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.vfsurf.at(i)
        r.append(m)
      return r
  property mfvol_mc:
    def __set__(self, value):
      self.thisptr.mfvol_mc.clear()
      for v in value:
        self.thisptr.mfvol_mc.push_back(<MultiComponentMatrixFormVol[cComplex[double]]*> (<PyMultiComponentMatrixFormVolComplex>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentMatrixFormVolComplex m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.mfvol_mc.size()):
        m = PyMultiComponentMatrixFormVolComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.mfvol_mc.at(i)
        r.append(m)
      return r
  property mfsurf_mc:
    def __set__(self, value):
      self.thisptr.mfsurf_mc.clear()
      for v in value:
        self.thisptr.mfsurf_mc.push_back(<MultiComponentMatrixFormSurf[cComplex[double]]*> (<PyMultiComponentMatrixFormSurfComplex>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentMatrixFormSurfComplex m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.mfsurf_mc.size()):
        m = PyMultiComponentMatrixFormSurfComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.mfsurf_mc.at(i)
        r.append(m)
      return r
  property vfvol_mc:
    def __set__(self, value):
      self.thisptr.vfvol_mc.clear()
      for v in value:
        self.thisptr.vfvol_mc.push_back(<MultiComponentVectorFormVol[cComplex[double]]*> (<PyMultiComponentVectorFormVolComplex>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentVectorFormVolComplex m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfvol_mc.size()):
        m = PyMultiComponentVectorFormVolComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.vfvol_mc.at(i)
        r.append(m)
      return r
  property vfsurf_mc:
    def __set__(self, value):
      self.thisptr.vfsurf_mc.clear()
      for v in value:
        self.thisptr.vfsurf_mc.push_back(<MultiComponentVectorFormSurf[cComplex[double]]*> (<PyMultiComponentVectorFormSurfComplex>v).thisptr)
    def __get__(self):
      cdef PyMultiComponentVectorFormSurfComplex m = PyTransformable(init = False)
      r = []
      for i in range(self.thisptr.vfsurf_mc.size()):
        m = PyMultiComponentVectorFormSurfComplex(init = False)
        m.thisptr = <Form[cComplex[double]]*> self.thisptr.vfsurf_mc.at(i)
        r.append(m)
      return r
  property idx_set:
    def __set__(self, value):
      self.thisptr.idx_set.clear()
      for v in value:
        self.thisptr.idx_set.insert(v)
    def __get__(self):
      cdef cSet[int].iterator i = self.thisptr.idx_set.begin()
      r = set()
      while i != self.thisptr.idx_set.end():
        r.add(deref(i))
        inc(i)
      return r
  property seq_set:
    def __set__(self, value):
      self.thisptr.seq_set.clear()
      for v in value:
        self.thisptr.seq_set.insert(v)
    def __get__(self):
      cdef cSet[unsigned int].iterator i = self.thisptr.seq_set.begin()
      r = set()
      while i != self.thisptr.seq_set.end():
        r.add(deref(i))
        inc(i)
      return r
  property ext_set:
    def __set__(self, value):
      self.thisptr.ext_set.clear()
      for v in value:
        self.thisptr.ext_set.insert(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex>v).thisptr)
    def __get__(self):
      cdef cSet[pMeshFunctionComplex].iterator i = self.thisptr.ext_set.begin()     
      cdef PyMeshFunctionComplex m = PyMeshFunctionComplex(init = False)
      r = set()
      while i != self.thisptr.ext_set.end():
        m = PyMeshFunctionComplex(init = False)
        m.thisptr = <Transformable*> deref(i)
        r.add(m)
        inc(i)
      return r

cdef class PyWeakFormComplex:
  def __cinit__(self, neq = None, mat_free = None, init = True):
    if not init:
      return
    if type(self)!=PyWeakFormComplex:
      return
    if mat_free is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq, mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq)
      return
    self.thisptr = new WeakForm[cComplex[double]]()
  def __dealloc__(self):
    del self.thisptr
  def add_matrix_form(self, PyMatrixFormVolComplex mfv):
    self.thisptr.add_matrix_form(<MatrixFormVol[cComplex[double]]*> mfv.thisptr)
  def add_matrix_form_surf(self, PyMatrixFormSurfComplex mfs):
    self.thisptr.add_matrix_form_surf(<MatrixFormSurf[cComplex[double]]*> mfs.thisptr)
  def add_vector_form(self, PyVectorFormVolComplex vfv):
    self.thisptr.add_vector_form(<VectorFormVol[cComplex[double]]*> vfv.thisptr)
  def add_vector_form_surf(self, PyVectorFormSurfComplex vfs):
    self.thisptr.add_vector_form_surf(<VectorFormSurf[cComplex[double]]*> vfs.thisptr)
  def add_multicomponent_matrix_form(self, PyMultiComponentMatrixFormVolComplex mfv):
    self.thisptr.add_multicomponent_matrix_form(<MultiComponentMatrixFormVol[cComplex[double]]*> mfv.thisptr)
  def add_multicomponent_matrix_form_surf(self, PyMultiComponentMatrixFormSurfComplex mfs):
    self.thisptr.add_multicomponent_matrix_form_surf(<MultiComponentMatrixFormSurf[cComplex[double]]*> mfs.thisptr)
  def add_multicomponent_vector_form(self, PyMultiComponentVectorFormVolComplex vfv):
    self.thisptr.add_multicomponent_vector_form(<MultiComponentVectorFormVol[cComplex[double]]*> vfv.thisptr)
  def add_multicomponent_vector_form_surf(self, PyMultiComponentVectorFormSurfComplex vfs):
    self.thisptr.add_multicomponent_vector_form_surf(<MultiComponentVectorFormSurf[cComplex[double]]*> vfs.thisptr)
  def get_neq(self):
    return self.thisptr.get_neq()
  def is_matrix_free(self):
    return self.thisptr.is_matrix_free()
  def set_current_time(self, double time):
    self.thisptr.set_current_time(time)
  def get_current_time(self):
    return self.thisptr.get_current_time()

  def get_mfvol(self):
    cdef vector[pMatrixFormVolComplex] cr = self.thisptr.get_mfvol()
    cdef PyMatrixFormVolComplex f = PyMatrixFormVolComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMatrixFormVolComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_mfsurf(self):
    cdef vector[pMatrixFormSurfComplex] cr = self.thisptr.get_mfsurf()
    cdef PyMatrixFormSurfComplex f = PyMatrixFormSurfComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMatrixFormSurfComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_vfvol(self):
    cdef vector[pVectorFormVolComplex] cr = self.thisptr.get_vfvol()
    cdef PyVectorFormVolComplex f = PyVectorFormVolComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyVectorFormVolComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_vfsurf(self):
    cdef vector[pVectorFormSurfComplex] cr = self.thisptr.get_vfsurf()
    cdef PyVectorFormSurfComplex f = PyVectorFormSurfComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyVectorFormSurfComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_mfvol_mc(self):
    cdef vector[pMultiComponentMatrixFormVolComplex] cr = self.thisptr.get_mfvol_mc()
    cdef PyMultiComponentMatrixFormVolComplex f = PyMultiComponentMatrixFormVolComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentMatrixFormVolComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_mfsurf_mc(self):
    cdef vector[pMultiComponentMatrixFormSurfComplex] cr = self.thisptr.get_mfsurf_mc()
    cdef PyMultiComponentMatrixFormSurfComplex f = PyMultiComponentMatrixFormSurfComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentMatrixFormSurfComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_vfvol_mc(self):
    cdef vector[pMultiComponentVectorFormVolComplex] cr = self.thisptr.get_vfvol_mc()
    cdef PyMultiComponentVectorFormVolComplex f = PyMultiComponentVectorFormVolComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentVectorFormVolComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f
  def get_vfsurf_mc(self()):
    cdef vector[pMultiComponentVectorFormSurfComplex] cr = self.thisptr.get_vfsurf_mc()
    cdef PyMultiComponentVectorFormSurfComplex f = PyMultiComponentVectorFormSurfComplex(init = False)
    r = []
    for i in range(cr.size()):
      f = PyMultiComponentVectorFormSurfComplex(init = False)
      f.thisptr = <Form[cComplex[double]]*> cr.at(i)
      r.append(f)
    return f

cdef class PyFormComplex:
  def __cinit__(self, area, ext, scaling_factor, u_ext_offset,init = True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if type(self)!=PyFormComplex:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = new Form[cComplex[double]](careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = new Form[cComplex[double]](careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = new Form[cComplex[double]](careas, cext)
        return
      self.thisptr = new Form[cComplex[double]](careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = new Form[cComplex[double]](carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = new Form[cComplex[double]](carea, cext,<double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = new Form[cComplex[double]](carea, cext)
        return
      if area is not None:
        self.thisptr = new Form[cComplex[double]](carea)
        return
      self.thisptr = new Form[cComplex[double]]()
  def set_weakform(self, PyWeakFormComplex wf):
    self.thisptr.set_weakform(wf.thisptr)
  def set_current_stage_time(self, double time):
    self.thisptr.set_current_stage_time(time)
  def get_current_stage_time(self):
    return self.thisptr.get_current_stage_time()
  property areas:
    def __set__(self, value):
      cdef string s
      self.thisptr.areas.clear()
      for v in value:
        s.assign(<char*> v)
        self.thisptr.areas.push_back(s)
    def __get__(self):
      r = []
      for i in range(self.thisptr.areas.size()):
        r.append(self.thisptr.areas.at(i).c_str())
      return r
  property ext:
    def __set__(self, value):
      self.thisptr.ext.clear()
      for v in value:
        self.thisptr.ext.push_back(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex>v).thisptr)
    def __get__(self):
      cdef PyMeshFunctionComplex m = PyMeshFunctionComplex(init = False)
      r = []
      for i in range(self.thisptr.ext.size()):
        m = PyMeshFunctionComplex(init = False)
        m.thisptr = <Transformable*> self.thisptr.ext.at(i)
        r.append(r)
      return r

  property scaling_factor:
    def __set__(self, double value):
      self.thisptr.scaling_factor = value
    def __get__(self):
      return self.thisptr.scaling_factor

  property u_ext_offset:
    def __set__(self,int value):
      self.thisptr.u_ext_offset = value
    def __get__(self):
      return self.thisptr.u_ext_offset


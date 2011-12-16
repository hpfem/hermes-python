cdef class PyCustomWeakFormReal(PyWeakFormReal):
  def super(self, neq = None, mat_free = None, *args):
    if mat_free is not None:
      self.thisptr = new WeakForm[double](neq,mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[double](neq)
      return
    self.thisptr = new WeakForm[double]()

cdef class PyCustomWeakFormComplex(PyWeakFormComplex):
  def super(self, neq = None, mat_free = None, *args):
    if mat_free is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq,mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq)
      return
    self.thisptr = new WeakForm[cComplex[double]]()

########################
cdef class PyCustomMatrixFormVolReal(PyMatrixFormVolReal):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
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


cdef class PyCustomMatrixFormSurfReal(PyMatrixFormSurfReal):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
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

cdef class PyCustomVectorFormVolReal(PyVectorFormVolReal):
  def __cinit__(self, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
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


cdef class PyCustomVectorFormSurfReal(PyVectorFormSurfReal):
  def __cinit__(self, unsigned int j, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
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

cdef class PyCustomMultiComponentMatrixFormVolReal(PyMultiComponentMatrixFormVolReal):
  def __cinit__(self, list coordinates, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef pair[unsigned int, unsigned int] v
    cdef vector[upair] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    for c in coordinates:
      v.first = c[0]
      v.second = c[1]
      ccoordinates.push_back(<upair> v)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates,carea)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormVol[double](self, ccoordinates)


cdef class PyCustomMultiComponentMatrixFormSurfReal(PyMultiComponentMatrixFormSurfReal):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef pair[unsigned int, unsigned int] v
    cdef vector[upair] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    for c in coordinates:
      v.first = c[0]
      v.second = c[1]
      ccoordinates.push_back(<upair> v)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates,carea)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentMatrixFormSurf[double](self, ccoordinates)

cdef class PyCustomMultiComponentVectorFormVolReal(PyMultiComponentVectorFormVolReal):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[unsigned] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    for c in coordinates:
      ccoordinates.push_back(c)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates,carea)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormVol[double](self, ccoordinates)
cdef class PyCustomMultiComponentVectorFormSurfReal(PyMultiComponentVectorFormSurfReal):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[unsigned] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionReal] cext
    cdef PyMeshFunctionReal mf
    if not init:
      return
    for c in coordinates:
      ccoordinates.push_back(c)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[double]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates,carea)
        return
      self.thisptr = <Form[double]*> new CustomMultiComponentVectorFormSurf[double](self, ccoordinates)

cdef class PyCustomMatrixFormVolComplex(PyMatrixFormVolComplex):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormVol[cComplex[double]](self, i, j)


cdef class PyCustomMatrixFormSurfComplex(PyMatrixFormSurfComplex):
  def __cinit__(self, unsigned int i, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMatrixFormSurf[cComplex[double]](self, i, j)


cdef class PyCustomVectorFormVolComplex(PyVectorFormVolComplex):
  def __cinit__(self, unsigned int j, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormVol[cComplex[double]](self, j)

cdef class PyCustomVectorFormSurfComplex(PyVectorFormSurfComplex):
  def __cinit__(self, unsigned int j, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr)
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomVectorFormSurf[cComplex[double]](self, j)


cdef class PyCustomMultiComponentMatrixFormVolComplex(PyMultiComponentMatrixFormVolComplex):
  def __cinit__(self, list coordinates, area=None, sym=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef pair[unsigned int, unsigned int] v
    cdef vector[upair] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    for c in coordinates:
      v.first = c[0]
      v.second = c[1]
      ccoordinates.push_back(<upair> v)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,careas, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,careas, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,careas, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,careas, <SymFlag> sym)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,carea, <SymFlag> sym, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,carea, <SymFlag> sym, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,carea, <SymFlag> sym, cext)
        return
      if sym is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,carea, <SymFlag> sym)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormVol[cComplex[double]](self, ccoordinates)


cdef class PyCustomMultiComponentMatrixFormSurfComplex(PyMultiComponentMatrixFormSurfComplex):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef pair[unsigned int, unsigned int] v
    cdef vector[upair] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    for c in coordinates:
      v.first = c[0]
      v.second = c[1]
      ccoordinates.push_back(<upair> v)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentMatrixFormSurf[cComplex[double]](self, ccoordinates)

cdef class PyCustomMultiComponentVectorFormVolComplex(PyMultiComponentVectorFormVolComplex):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[unsigned] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    for c in coordinates:
      ccoordinates.push_back(c)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormVol[cComplex[double]](self, ccoordinates)
cdef class PyCustomMultiComponentVectorFormSurfComplex(PyMultiComponentVectorFormSurfComplex):
  def __cinit__(self, list coordinates, area=None, ext=None, scaling_factor=None, u_ext_offset=None, init=True):
    cdef vector[unsigned] ccoordinates
    cdef vector[string] careas
    cdef string carea 
    cdef vector[pMeshFunctionComplex] cext
    cdef PyMeshFunctionComplex mf
    if not init:
      return
    for c in coordinates:
      ccoordinates.push_back(c)
    if ext is not None:
      for mf in ext:
        cext.push_back(<MeshFunction[cComplex[double]]*> mf.thisptr) 
    if isinstance(area,list):
      for s in area:
        carea.assign(<char*> s)
        careas.push_back(carea)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,careas, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,careas, cext)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,careas)
    else:
      if area is not None:
        carea.assign(<char*> area)
      if u_ext_offset is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor, <int> u_ext_offset)
        return
      if scaling_factor is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,carea, cext, <double> scaling_factor)
        return
      if ext is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,carea, cext)
        return
      if area is not None:
        self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates,carea)
        return
      self.thisptr = <Form[cComplex[double]]*> new CustomMultiComponentVectorFormSurf[cComplex[double]](self, ccoordinates)


########################

cdef public double pyMatrixFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[double] *ext):
  cdef PyFuncReal pu = PyFuncReal(init=False, dealloc=False)
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False, dealloc=False)
  print "value funkce"
  cdef PyFuncRealArray pu_ext = PyFuncRealArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return self.value(n, pwt, pu_ext, pu, pv, pe, pext)

cdef public Ord pyMatrixFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pu = PyFuncOrd(init=False, dealloc=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef Ord ret
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public double pyVectorFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[double] *ext):
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False, dealloc=False)
  cdef PyFuncRealArray pu_ext = PyFuncRealArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return self.value(n, pwt, pu_ext, pv, pe, pext)

cdef public Ord pyVectorFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public double pyMultiMatrixFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[double] *ext, vector[double]& result):
  cdef PyFuncReal pu = PyFuncReal(init=False, dealloc=False)
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False, dealloc=False)
  cdef PyFuncRealArray pu_ext = PyFuncRealArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pu, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(p)

cdef public Ord pyMultiMatrixFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pu = PyFuncOrd(init=False, dealloc=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public double pyMultiVectorFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[double] *ext, vector[double]& result):
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False, dealloc=False)
  cdef PyFuncRealArray pu_ext = PyFuncRealArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(p)

cdef public Ord pyMultiVectorFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMatrixFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext):
  cdef PyFuncReal pu = PyFuncReal(init=False, dealloc=False)
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False, dealloc=False)
  cdef PyFuncComplexArray pu_ext = PyFuncComplexArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return ccomplex(self.value(n, pwt, pu_ext, pu, pv, pe, pext))

cdef public Ord pyMatrixFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pu = PyFuncOrd(init=False, dealloc=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyVectorFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext):
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False, dealloc=False)
  cdef PyFuncComplexArray pu_ext = PyFuncComplexArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return ccomplex(self.value(n, pwt, pu_ext, pv, pe, pext))

cdef public Ord pyVectorFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMultiMatrixFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext, vector[cComplex[double]]& result):
  cdef PyFuncReal pu = PyFuncReal(init=False, dealloc=False)
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False, dealloc=False)
  cdef PyFuncComplexArray pu_ext = PyFuncComplexArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pu, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(ccomplex(p))

cdef public Ord pyMultiMatrixFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pu = PyFuncOrd(init=False, dealloc=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMultiVectorFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext, vector[cComplex[double]]& result):
  cdef PyFuncReal pv = PyFuncReal(init=False, dealloc=False)
  cdef PyGeomReal pe = PyGeomReal(init=False, dealloc=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False, dealloc=False)
  cdef PyFuncComplexArray pu_ext = PyFuncComplexArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(ccomplex(p))

cdef public Ord pyMultiVectorFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd pv = PyFuncOrd(init=False, dealloc=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False, dealloc=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False, dealloc=False)
  cdef PyFuncOrdArray pu_ext = PyFuncOrdArray()
  pu_ext.thisptr = u_ext
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pwt = []
  for i in range(n):
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

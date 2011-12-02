class Pynode_types:
  HERMES_TYPE_VERTEX,HERMES_TYPE_EDGE = [0,1]

class PyElementMode2D:
  HERMES_MODE_TRIANGLE,HERMES_MODE_QUAD = [0,1]

cdef class PyOrd2:
  def __cinit__(self,int order_h, order_v = None, init = True):
    if not init:
      return
    if type(self)!=PyOrd2:
      return
    if order_v is not None:
      self.thisptr= new Ord2(order_h, order_v)
    else:
      self.thisptr= new Ord2(order_h)

  def __dealloc__(self):
    del self.thisptr

  property order_h:
    def __set__(self, value):
      self.thisptr.order_h = value
    def __get__(self):
      return self.thisptr.order_h 

  property order_v:
    def __set__(self, value):
      self.thisptr.order_v = value
    def __get__(self):
      return self.thisptr.order_v

class PySpaceType:
  HERMES_H1_SPACE = 0
  HERMES_HCURL_SPACE = 1
  HERMES_HDIV_SPACE = 2
  HERMES_L2_SPACE = 3
  HERMES_INVALID_SPACE = -9999

class PyGeomType:
  HERMES_PLANAR = 0
  HERMES_AXISYM_X = 1
  HERMES_AXISYM_Y = 2

class PyProjNormType:
  HERMES_L2_NORM,
  HERMES_H1_NORM,
  HERMES_H1_SEMINORM,
  HERMES_HCURL_NORM,
  HERMES_HDIV_NORM,
  HERMES_UNSET_NORM = range(6)

cdef class PyGlobalReal:
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyGlobalReal:
      return
    self.thisptr = new Global[double]()

  def __dealloc__(self):
    del self.thisptr

  def calc_rel_error(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, int norm_type):
    return self.thisptr.calc_rel_error(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, norm_type)
  def calc_abs_error(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, int norm_type):
    return self.thisptr.calc_abs_error(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, norm_type)
  def calc_norm(self, PyMeshFunctionReal sln, int norm_type):
    return self.thisptr.calc_norm(<MeshFunction[double]*> sln.thisptr , norm_type)
  def calc_norms(self, list slns):
    cdef vector[pSolutionReal] cslns
    for s in slns:
      cslns.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
    return self.thisptr.calc_norms(cslns)
  def calc_abs_errors(self, list slns1, list slns2):
    cdef vector[pSolutionReal] cslns1
    cdef vector[pSolutionReal] cslns2
    for s in slns1:
      cslns1.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
    for s in slns2:
      cslns1.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
    return self.thisptr.calc_abs_errors(cslns1, cslns2)
  def calc_rel_errors(self, list slns1, list slns2):
    cdef vector[pSolutionReal] cslns1
    cdef vector[pSolutionReal] cslns2
    for s in slns1:
      cslns1.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
    for s in slns2:
      cslns1.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
    return self.thisptr.calc_rel_errors(cslns1, cslns2)
  def error_fn_l2(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, PyRefMap ru, PyRefMap rv):
    return self.thisptr.error_fn_l2(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, <RefMap*> ru.thisptr, <RefMap*> rv.thisptr)
  def norm_fn_l2(self, PyMeshFunctionReal sln, PyRefMap ru):
    return self.thisptr.norm_fn_l2(<MeshFunction[double]*> sln.thisptr, <RefMap*> ru.thisptr)
  def error_fn_h1(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, PyRefMap ru, PyRefMap rv):
    return self.thisptr.error_fn_h1(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, <RefMap*> ru.thisptr, <RefMap*> rv.thisptr)
  def norm_fn_h1(self, PyMeshFunctionReal sln, PyRefMap ru):
    return self.thisptr.norm_fn_h1(<MeshFunction[double]*> sln.thisptr, <RefMap*> ru.thisptr)
  def error_fn_hc(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, PyRefMap ru, PyRefMap rv):
    return self.thisptr.error_fn_hc(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, <RefMap*> ru.thisptr, <RefMap*> rv.thisptr)
  def norm_fn_hc(self, PyMeshFunctionReal sln, PyRefMap ru):
    return self.thisptr.norm_fn_hc(<MeshFunction[double]*> sln.thisptr, <RefMap*> ru.thisptr)
  def error_fn_hcl2(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, PyRefMap ru, PyRefMap rv):
    return self.thisptr.error_fn_hcl2(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, <RefMap*> ru.thisptr, <RefMap*> rv.thisptr)
  def norm_fn_hcl2(self, PyMeshFunctionReal sln, PyRefMap ru):
    return self.thisptr.norm_fn_hcl2(<MeshFunction[double]*> sln.thisptr, <RefMap*> ru.thisptr)
  def error_fn_hdiv(self, PyMeshFunctionReal sln1, PyMeshFunctionReal sln2, PyRefMap ru, PyRefMap rv):
    return self.thisptr.error_fn_hdiv(<MeshFunction[double]*> sln1.thisptr, <MeshFunction[double]*> sln2.thisptr, <RefMap*> ru.thisptr, <RefMap*> rv.thisptr)
  def norm_fn_hdiv(self, PyMeshFunctionReal sln, PyRefMap ru):
    return self.thisptr.norm_fn_hdiv(<MeshFunction[double]*> sln.thisptr, <RefMap*> ru.thisptr)
  def get_quad_order_str(self, int quad_order):
    return self.thisptr.get_quad_order_str(quad_order).c_str()
  def make_edge_order(self, int edge, int encoded_order, int mode):
    return self.thisptr.make_edge_order(edge, encoded_order, mode)
  def get_l2_norm(self, PyVectorReal vec):
    return self.thisptr.get_l2_norm(vec.thisptr)


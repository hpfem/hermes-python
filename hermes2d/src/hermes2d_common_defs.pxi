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

#TODO global
#  cdef cppclass Global[Scalar]:
#    double calc_rel_error(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, int norm_type)
#    double calc_abs_error(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, int norm_type)
#    double calc_norm(MeshFunction[Scalar]* sln, int norm_type)
#    double calc_norms(vector[pSolution] slns)
#    double calc_abs_errors(vector[pSolution] slns1, vector[pSolution] slns2)
#    double calc_rel_errors(vector[pSolution] slns1, vector[pSolution] slns2)
#    double error_fn_l2(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, RefMap* ru, RefMap* rv)
#    double norm_fn_l2(MeshFunction[Scalar]* sln, RefMap* ru)
#    double error_fn_h1(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, RefMap* ru, RefMap* rv)
#    double norm_fn_h1(MeshFunction[Scalar]* sln, RefMap* ru)
#    double error_fn_hc(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, RefMap* ru, RefMap* rv)
#    double norm_fn_hc(MeshFunction[Scalar]* sln, RefMap* ru)
#    double error_fn_hcl2(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, RefMap* ru, RefMap* rv)
#    double norm_fn_hcl2(MeshFunction[Scalar]* sln, RefMap* ru)
#    double error_fn_hdiv(MeshFunction[Scalar]* sln1, MeshFunction[Scalar]* sln2, RefMap* ru, RefMap* rv)
#    double norm_fn_hdiv(MeshFunction[Scalar]* sln, RefMap* ru)
#    string get_quad_order_str(int quad_order)
#    int make_edge_order(int edge, int encoded_order, int mode)
#    double get_l2_norm(Vector[Scalar]* vec)


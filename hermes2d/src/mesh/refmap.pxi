cdef class PyRefMap(PyTransformable):
  def __cinit__(self, init=True):
    if not init:
      return
    if type(self)!=PyRefMap:
      return
    self.thisptr=<Transformable*> new RefMap()
  def get_quad_2d(self):
    cdef PyQuad2D r = PyQuad2D(init=False)
    r.thisptr = (<RefMap*> self.thisptr).get_quad_2d()
    return r
  def set_quad_2d(self, PyQuad2D quad_2d):
    (<RefMap*> self.thisptr).set_quad_2d(quad_2d.thisptr)
  def get_quad_1d(self):
    cdef PyQuad1D r=PyQuad1D(init=False)
    r.thisptr=<Quad1D*> (<RefMap*> self.thisptr).get_quad_1d()
    return r
  def set_active_element(self, PyElement e):
    (<RefMap*> self.thisptr).set_active_element(e.thisptr)
  def get_tangent(self, int edge, order=None):
    cdef double3 * cr = NULL
    cdef int i
    if order is None or order == -1:
      cr = (<RefMap*> self.thisptr).get_tangent(edge)
      order = (<RefMap*> self.thisptr).get_quad_2d().get_edge_points(edge)
    else:
      cr = (<RefMap*> self.thisptr).get_tangent(edge, order)
    r=[]
    for i in range(self.get_quad_2d().get_num_points(order)):
      r.append([cr[i][0], cr[i][1], cr[i][2]])
    return r
  def untransform(self, PyElement e, double x, double y):
    """return [xi1, xi2]"""
    cdef double xi1 = 0
    cdef double xi2 = 0
    (<RefMap*> self.thisptr).untransform(e.thisptr, x, y, xi1, xi2)
    return [xi1, xi2]
  def get_phys_x(self, int order):
    cdef double * cr = (<RefMap*> self.thisptr).get_phys_x(order)
    cdef i
    r = []
    for i in range((<RefMap*> self.thisptr).get_quad_2d().get_num_points(order)):
      r.append(cr[i])
    return r
  def is_jacobian_const(self):
    return (<RefMap*> self.thisptr).is_jacobian_const()
  def get_const_jacobian(self):
    return (<RefMap*> self.thisptr).get_const_jacobian()
  def get_jacobian(self, int order):
    cdef double* cr = (<RefMap*> self.thisptr).get_jacobian(order)
    cdef i 
    r = []
    for i in range((<RefMap*> self.thisptr).get_quad_2d().get_num_points(order)):
      r.append(cr[i])
    return r
  def get_inv_ref_order(self):
    return (<RefMap*> self.thisptr).get_inv_ref_order()


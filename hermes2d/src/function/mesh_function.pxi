cdef class PyMeshFunctionReal(PyFunctionReal): #abstract
  def init(self):
    (<MeshFunction[double]*> self.thisptr).init()
  def reinit(self):
    (<MeshFunction[double]*> self.thisptr).reinit()
  def set_quad_2d(self, PyQuad2D quad_2d):
    (<MeshFunction[double]*> self.thisptr).set_quad_2d(quad_2d.thisptr)
  def set_active_element(self, PyElement e):
    (<MeshFunction[double]*> self.thisptr).set_active_element(e.thisptr)
  def get_mesh(self, ):
    cdef PyMesh r = PyMesh(init=False)
    r.thisptr = (<MeshFunction[double]*> self.thisptr).get_mesh()
    return r
  def get_refmap(self):
    cdef PyRefMap r = PyRefMap(init=False)
    r.thisptr = <Transformable*> (<MeshFunction[double]*> self.thisptr).get_refmap()
  def get_edge_fn_order(self, int edge):
    return (<MeshFunction[double]*> self.thisptr).get_edge_fn_order(edge)
  def get_pt_value(self, double x, double y, item=None):
    if item is not None:
      return (<MeshFunction[double]*> self.thisptr).get_pt_value(x, y, item)
    else:
      return (<MeshFunction[double]*> self.thisptr).get_pt_value(x, y)
  def handle_overflow_idx(self):
    (<MeshFunction[double]*> self.thisptr).handle_overflow_idx()
  def push_transform(self, int son):
    (<MeshFunction[double]*> self.thisptr).push_transform(son)
  def pop_transform(self):
    (<MeshFunction[double]*> self.thisptr).pop_transform()
  def update_refmap(self):
    (<MeshFunction[double]*> self.thisptr).update_refmap()

cdef class PyMeshFunctionComplex(PyFunctionComplex): #abstract
  def init(self):
    (<MeshFunction[cComplex[double]]*> self.thisptr).init()
  def reinit(self):
    (<MeshFunction[cComplex[double]]*> self.thisptr).reinit()
  def set_quad_2d(self, PyQuad2D quad_2d):
    (<MeshFunction[cComplex[double]]*> self.thisptr).set_quad_2d(quad_2d.thisptr)
  def set_active_element(self, PyElement e):
    (<MeshFunction[cComplex[double]]*> self.thisptr).set_active_element(e.thisptr)
  def get_mesh(self, ):
    cdef PyMesh r = PyMesh(init=False)
    r.thisptr = (<MeshFunction[cComplex[double]]*> self.thisptr).get_mesh()
    return r
  def get_refmap(self):
    cdef PyRefMap r = PyRefMap(init=False)
    r.thisptr = <Transformable*> (<MeshFunction[cComplex[double]]*> self.thisptr).get_refmap()
  def get_edge_fn_order(self, int edge):
    return (<MeshFunction[cComplex[double]]*> self.thisptr).get_edge_fn_order(edge)
  def get_pt_value(self, double x, double y, item = None):
    if item is not None:
      return pcomplex((<MeshFunction[cComplex[double]]*> self.thisptr).get_pt_value(x, y, item))
    else:
      return pcomplex((<MeshFunction[cComplex[double]]*> self.thisptr).get_pt_value(x, y))
  def handle_overflow_idx(self):
    (<MeshFunction[cComplex[double]]*> self.thisptr).handle_overflow_idx()
  def push_transform(self, int son):
    (<MeshFunction[cComplex[double]]*> self.thisptr).push_transform(son)
  def pop_transform(self):
    (<MeshFunction[cComplex[double]]*> self.thisptr).pop_transform()
  def update_refmap(self):
    (<MeshFunction[cComplex[double]]*> self.thisptr).update_refmap()


H2D_FN_VAL_0 = 0x0001
H2D_FN_VAL_1 = 0x0040
H2D_FN_DX_0  = 0x0002
H2D_FN_DX_1  = 0x0080
H2D_FN_DY_0  = 0x0004
H2D_FN_DY_1  = 0x0100
H2D_FN_DXX_0 = 0x0008
H2D_FN_DXX_1 = 0x0200
H2D_FN_DYY_0 = 0x0010
H2D_FN_DYY_1 = 0x0400
H2D_FN_DXY_0 = 0x0020
H2D_FN_DXY_1 = 0x0800

H2D_FN_VAL = H2D_FN_VAL_0 | H2D_FN_VAL_1
H2D_FN_DX  = H2D_FN_DX_0  | H2D_FN_DX_1
H2D_FN_DY  = H2D_FN_DY_0  | H2D_FN_DY_1
H2D_FN_DXX = H2D_FN_DXX_0 | H2D_FN_DXX_1
H2D_FN_DYY = H2D_FN_DYY_0 | H2D_FN_DYY_1
H2D_FN_DXY = H2D_FN_DXY_0 | H2D_FN_DXY_1

H2D_FN_DEFAULT = H2D_FN_VAL | H2D_FN_DX | H2D_FN_DY            
H2D_FN_ALL = H2D_FN_DEFAULT | H2D_FN_DXX | H2D_FN_DYY | H2D_FN_DXY 

H2D_FN_COMPONENT_0 = H2D_FN_VAL_0 | H2D_FN_DX_0 | H2D_FN_DY_0 | H2D_FN_DXX_0 | H2D_FN_DYY_0 | H2D_FN_DXY_0
H2D_FN_COMPONENT_1 = H2D_FN_VAL_1 | H2D_FN_DX_1 | H2D_FN_DY_1 | H2D_FN_DXX_1 | H2D_FN_DYY_1 | H2D_FN_DXY_1

cdef class PyFunctionReal(PyTransformable): #abstract
  def get_num_components(self):
    return (<Function[double]*> self.thisptr).get_num_components()
  def get_fn_values(self, component = None):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_fn_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_fn_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r

  def get_dx_values(self, int component):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_dx_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_dx_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r
  def get_dy_values(self, int component):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_dy_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_dy_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r
  def get_dx_dy_values(self, int component):
    """ returns [dx, dy] (you can write dx, dy = get_dx_dy_values(component) )"""
    cdef double * dx = NULL
    cdef double * dy = NULL
    cdef int i
    if component is not None:
      (<Function[double]*> self.thisptr).get_dx_dy_values(dx,dy,component)
    else:
      (<Function[double]*> self.thisptr).get_dx_dy_values(dx,dy)
    rx = []
    ry = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      rx.append(dx[i])
      ry.append(dy[i])
    return [rx, ry]
  def get_dxx_values(self, int component):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_dxx_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_dxx_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r
  def get_dyy_values(self, int component):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_dyy_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_dyy_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r
  def get_dxy_values(self, int component):
    cdef double * cr
    cdef int i
    if component is not None:
      cr = (<Function[double]*> self.thisptr).get_dxy_values(component)
    else:
      cr = (<Function[double]*> self.thisptr).get_dxy_values()
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
    return r
  def get_quad_2d(self):
    cdef PyQuad2D r = PyQuad2D(init=False)
    r.thisptr = (<Function[double]*> self.thisptr).get_quad_2d()
    return r 
  def set_quad_order(self, unsigned int order, mask = None):
    if order is not None:
      (<Function[double]*> self.thisptr).set_quad_order(order, mask)
    else:
      (<Function[double]*> self.thisptr).set_quad_order(order)
  def get_values(self, int a, int b):
    cdef double * cr
    cdef int i
    cr = (<Function[double]*> self.thisptr).get_values(a, b)
    r = []
    for i in range((<Function[double]*> self.thisptr).get_quad_2d().get_num_points((<Function[double]*> self.thisptr).get_fn_order())):
      r.append(cr[i])
  def get_fn_order(self):
    return (<Function[double]*> self.thisptr).get_fn_order()


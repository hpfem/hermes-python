class PyGIP2DIndices:
    H2D_GIP2D_X = 0
    H2D_GIP2D_Y = 1
    H2D_GIP2D_W = 2

H2D_GIP1D_X = 0
H2D_GIP1D_W = 1

g_max_quad = 24
g_max_tri = 20

cdef class PyQuad1D:
  def get_points(self, int order):
    cdef double2 * cr
    cdef int i
    cr = self.thisptr.get_points(order)
    r=[]
    for i in range(self.thisptr.get_num_points(order)):
      r.append([cr[i][0],cr[i][1]])
    return r
  def get_num_points(self, int order):
    return self.thisptr.get_num_points(order)

  def get_max_order(self):
    return self.thisptr.get_max_order()
  def get_ref_vertex(self, int n):
    return self.thisptr.get_ref_vertex(n)

cdef class PyQuad2D:
  def set_mode(self, int mode):
    self.thisptr.set_mode(mode)
  def  get_mode(self):
    return self.thisptr.get_mode()
  def get_num_points(self, int order):
    return self.thisptr.get_num_points(order)
  def get_points(self, int order):
    cdef double3 * cr
    cdef int i
    cr = self.thisptr.get_points(order)
    r=[]
    for i in range(self.thisptr.get_num_points(order)):
      r.append([cr[i][0], cr[i][1], cr[i][2]])
    return r
  def get_edge_points(self, int edge):
    return self.thisptr.get_edge_points(edge)
  def get_edge_points(self, int edge, int order):
    return self.thisptr.get_edge_points(edge, order)
  def get_max_order(self, ):
    return self.thisptr.get_max_order()
  def get_safe_max_order(self, ):
    return self.thisptr.get_safe_max_order()
  def get_num_tables(self, ):
    return self.thisptr.get_num_tables()
  def get_ref_vertex(self, int n):
    cdef double2 * cr
    cr = self.thisptr.get_ref_vertex(n)
    return [cr[0][0], cr[0][1]]


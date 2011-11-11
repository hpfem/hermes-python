
HERMES_EPS_LOW      = 0.007;
HERMES_EPS_NORMAL   = 0.0004;
HERMES_EPS_HIGH     = 0.0001;
HERMES_EPS_VERYHIGH = 0.000002;
#  double3 lin_pts_0_tri[] TODO
#  double3 lin_pts_0_quad[]
#  double3 lin_pts_1_tri[12]
#  double3 lin_pts_1_quad[21]
#  int quad_indices[9][5]
#  int tri_indices[5][3]
#  int lin_np_tri[2]
#  int lin_np_quad[2]
#  int* lin_np[2]
#  double3*  lin_tables_tri[2]
#  double3*  lin_tables_quad[2]
#  double3** lin_tables[2]

cdef class PyQuad2DLin(PyQuad2D):
  def __cinit__(self, init=True):
    if not init:
      return
    if type(self)!=PyQuad2DLin:
      return
    self.thisptr=<Quad2D*> new Quad2DLin()


#Quad2DLin g_quad_lin
LIN_MAX_LEVEL = 6;

cdef class PyLinearizerBase:
  def set_max_absolute_value(self, double max_abs):
    self.thisptr.set_max_absolute_value(max_abs)
  def get_min_value(self):
    return self.thisptr.get_min_value()
  def get_max_value(self):
    return self.thisptr.get_max_value()
  def lock_data(self):
    self.thisptr.lock_data()
  def unlock_data(self):
    self.thisptr.unlock_data()
  def get_triangles(self):
    cdef int3 * cr = self.thisptr.get_triangles()
    cdef int i
    r = []
    for i in range(self.thisptr.get_num_triangles()):
      r.append([cr[i][0], cr[i][1], cr[i][2]])
    return r
  def get_num_triangles(self):
    return self.thisptr.get_num_triangles()
  def get_edges(self ):
    cdef int3 * cr = self.thisptr.get_edges()
    cdef int i
    r = []
    for i in range(self.thisptr.get_num_edges()):
      r.append([cr[i][0], cr[i][1], cr[i][2]])
    return r
  def get_num_edges(self):
    return self.thisptr.get_num_edges()


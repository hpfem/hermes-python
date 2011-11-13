cdef extern from "views/linearizer_base.h" namespace "Hermes::Hermes2D::Views" :
#const double HERMES_EPS_LOW      = 0.007;
#const double HERMES_EPS_NORMAL   = 0.0004;
#const double HERMES_EPS_HIGH     = 0.0001;
#const double HERMES_EPS_VERYHIGH = 0.000002;
  double3 lin_pts_0_tri[]
  double3 lin_pts_0_quad[]
  double3 lin_pts_1_tri[12]
  double3 lin_pts_1_quad[21]
  int quad_indices[9][5]
  int tri_indices[5][3]
  int lin_np_tri[2]
  int lin_np_quad[2]
  int* lin_np[2]
  double3*  lin_tables_tri[2]
  double3*  lin_tables_quad[2]
  double3** lin_tables[2]

  cdef cppclass Quad2DLin :# public Quad2D
    Quad2DLin()

  Quad2DLin g_quad_lin

  cdef cppclass LinearizerBase:
    void set_max_absolute_value(double max_abs)

    double get_min_value()
    double get_max_value()

    void lock_data()
    void unlock_data()

    int3* get_triangles()
    int get_num_triangles()
    int3* get_edges()
    int get_num_edges()

#LIN_MAX_LEVEL = 6;
cdef class PyLinearizerBase:
  cdef LinearizerBase * thisptr


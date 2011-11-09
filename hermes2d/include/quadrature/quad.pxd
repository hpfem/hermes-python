cdef extern from "quadrature/quad.h" namespace "Hermes::Hermes2D" :
  enum GIP2DIndices:
    H2D_GIP2D_X # 0
    H2D_GIP2D_Y # 1
    H2D_GIP2D_W # 2

#    static int H2D_GIP1D_X = 0;
#    static int H2D_GIP1D_W = 1;
#
#    const int g_max_quad = 24;
#    const int g_max_tri = 20;

  cdef cppclass  Quad1D:
    double2* get_points(int order)
    int get_num_points(int order)

    int get_max_order()
    double get_ref_vertex(int n)

  cdef cppclass Quad2D:
    void set_mode(int mode)
    int  get_mode()
    int get_num_points(int order)
    double3* get_points(int order)
    int get_edge_points(int edge)
    int get_edge_points(int edge, int order)
    int get_max_order()
    int get_safe_max_order()
    int get_num_tables()
    double2* get_ref_vertex(int n)


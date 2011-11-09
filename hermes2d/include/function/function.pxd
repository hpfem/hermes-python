cdef extern from "function/function.h" namespace "Hermes::Hermes2D" :
#    H2D_FN_VAL_0 = 0x0001
#    H2D_FN_VAL_1 = 0x0040
#    H2D_FN_DX_0  = 0x0002
#    H2D_FN_DX_1  = 0x0080
#    H2D_FN_DY_0  = 0x0004
#    H2D_FN_DY_1  = 0x0100
#    H2D_FN_DXX_0 = 0x0008
#    H2D_FN_DXX_1 = 0x0200
#    H2D_FN_DYY_0 = 0x0010
#    H2D_FN_DYY_1 = 0x0400
#    H2D_FN_DXY_0 = 0x0020
#
#    const int H2D_FN_VAL = H2D_FN_VAL_0 | H2D_FN_VAL_1
#    const int H2D_FN_DX  = H2D_FN_DX_0  | H2D_FN_DX_1
#    const int H2D_FN_DY  = H2D_FN_DY_0  | H2D_FN_DY_1
#    const int H2D_FN_DXX = H2D_FN_DXX_0 | H2D_FN_DXX_1
#    const int H2D_FN_DYY = H2D_FN_DYY_0 | H2D_FN_DYY_1
#    const int H2D_FN_DXY = H2D_FN_DXY_0 | H2D_FN_DXY_1
#
#    const int H2D_FN_DEFAULT = H2D_FN_VAL | H2D_FN_DX | H2D_FN_DY            ///< default precalculation mask
#    const int H2D_FN_ALL = H2D_FN_DEFAULT | H2D_FN_DXX | H2D_FN_DYY | H2D_FN_DXY ///< precalculate everything
#
#    const int H2D_FN_COMPONENT_0 = H2D_FN_VAL_0 | H2D_FN_DX_0 | H2D_FN_DY_0 | H2D_FN_DXX_0 | H2D_FN_DYY_0 | H2D_FN_DXY_0
#    const int H2D_FN_COMPONENT_1 = H2D_FN_VAL_1 | H2D_FN_DX_1 | H2D_FN_DY_1 | H2D_FN_DXX_1 | H2D_FN_DYY_1 | H2D_FN_DXY_1

  cdef cppclass Function[Scalar]: #public Transformable
      int get_num_components()
      Scalar* get_fn_values(int component)
      Scalar* get_fn_values()
      Scalar* get_dx_values(int component)
      Scalar* get_dx_values()
      Scalar* get_dy_values(int component)
      Scalar* get_dy_values()
      void get_dx_dy_values(Scalar*& dx, Scalar*& dy, int component)
      void get_dx_dy_values(Scalar*& dx, Scalar*& dy)
      Scalar* get_dxx_values(int component)
      Scalar* get_dxx_values()
      Scalar* get_dyy_values(int component)
      Scalar* get_dyy_values()
      Scalar* get_dxy_values(int component)
      Scalar* get_dxy_values()
      Quad2D* get_quad_2d()
      void set_quad_order(unsigned int order, int mask)
      void set_quad_order(unsigned int order)
      Scalar* get_values(int a, int b)
      int get_fn_order()


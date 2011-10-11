cdef extern from "hermes2d_common_defs.h" namespace "Hermes::Hermes2D":
  enum node_types:
    HERMES_TYPE_VERTEX = 0
    HERMES_TYPE_EDGE = 1

  enum ElementMode2D:
    HERMES_MODE_TRIANGLE = 0
    HERMES_MODE_QUAD = 1

  cdef cppclass Ord2:
    Ord2(int order_h, int order_v)
    Ord2(int order)
    int order_h
    int order_v

  enum SpaceType:
    HERMES_H1_SPACE = 0
    HERMES_HCURL_SPACE = 1
    HERMES_HDIV_SPACE = 2
    HERMES_L2_SPACE = 3
    HERMES_INVALID_SPACE = -9999

  enum GeomType:
    HERMES_PLANAR = 0
    HERMES_AXISYM_X = 1
    HERMES_AXISYM_Y = 2

  enum ProjNormType:
    HERMES_L2_NORM
    HERMES_H1_NORM
    HERMES_H1_SEMINORM
    HERMES_HCURL_NORM
    HERMES_HDIV_NORM
    HERMES_UNSET_NORM

  ctypedef void* pSolution "Solution<Scalar>*" #cython error override
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


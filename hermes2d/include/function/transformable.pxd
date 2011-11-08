cdef extern from "function/transformable.h" namespace "Hermes::Hermes2D":
  cdef struct Trf:
    double2 m
    double2 t


  #static const int H2D_TRF_TRI_NUM = 4;
  #static const int H2D_TRF_QUAD_NUM = 8;
  #static const int H2D_TRF_NUM = (H2D_TRF_QUAD_NUM + 1);
  #static const int H2D_TRF_IDENTITY = H2D_TRF_QUAD_NUM;


  cdef cppclass Transformable:
    Element* get_active_element()
    void set_transform(int idx)
    int get_transform()

cdef class PyTransformable:
  cdef Transformable* thisptr

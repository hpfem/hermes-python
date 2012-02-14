cdef extern from "function/mesh_function.h" namespace "Hermes::Hermes2D":
  ctypedef void* pMeshFunction "MeshFunction<Scalar>*" #cython error override
  ctypedef void* pMeshFunctionReal "Hermes::Hermes2D::MeshFunction<double>*" #cython error override
  ctypedef void* pMeshFunctionComplex "Hermes::Hermes2D::MeshFunction<std::complex<double> >*" #cython error override
  cdef cppclass MeshFunction[Scalar]: # public Function<Scalar> Abstract
    MeshFunction()
    MeshFunction(Mesh *mesh)
    void init()
    void reinit()
    void set_quad_2d(Quad2D* quad_2d)
    void set_active_element(Element* e)
    Mesh*   get_mesh()
    RefMap* get_refmap()
    int get_edge_fn_order(int edge)
    Scalar get_pt_value(double x, double y, int item)
    Scalar get_pt_value(double x, double y)
    void handle_overflow_idx()
    void push_transform(int son)
    void pop_transform()
    void update_refmap()

cdef class PyMeshFunctionReal(PyFunctionReal):
  pass


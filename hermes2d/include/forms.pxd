cdef extern from "forms.h" namespace "Hermes::Hermes2D":
  char* ERR_UNDEFINED_NEIGHBORING_ELEMENTS 
  ctypedef void* pFunc "Func<Scalar>*" #cython error override
  ctypedef void* pFuncReal "Hermes::Hermes2D::Func<double>*" #cython error override
  ctypedef void* pFuncComplex "Hermes::Hermes2D::Func<std::complex<double> >*" #cython error override
  ctypedef void* pFuncOrd "Hermes::Hermes2D::Func<Hermes::Ord >*" #cython error override
  cdef cppclass Func[T]:
    T *val
    T *dx, *dy
    T *laplace
    T *val0, *val1
    T *dx0, *dx1
    T *dy0, *dy1
    T *curl
    T *div
    T& get_val_central(int k)
    T& get_val_neighbor(int k)
    T& get_dx_central(int k)
    T& get_dx_neighbor(int k)
    T& get_dy_central(int k)
    T& get_dy_neighbor(int k)
    T& get_laplace_central(int k)
    T& get_laplace_neighbor(int k)
    void free_ord()
    void free_fn()
    void subtract(Func[T]& func)
    void add(T* attribute, T* other_attribute)
    int get_num_gip()

  cdef cppclass DiscontinuousFunc[T]: #public Func[T]
    DiscontinuousFunc(Func[T]* fn, bool support_on_neighbor, bool reverse)
    DiscontinuousFunc(Func[T]* fn, bool support_on_neighbor)
    DiscontinuousFunc(Func[T]* fn)
    DiscontinuousFunc(Func[T]* fn_c, Func[T]* fn_n, bool reverse)
    DiscontinuousFunc(Func[T]* fn_c, Func[T]* fn_n)
    Func[T] *fn_central
    Func[T] *fn_neighbor

  cdef cppclass Geom[T]:
    T diam
    T area
    T *x, *y  #TODO getter and setter (elements count needed)
    T *nx, *ny
    T *tx, *ty
    int id
    int get_neighbor_marker()
    int get_neighbor_id()
    T   get_neighbor_diam()
    
    void free()
    void free_ord()
    int elem_marker
    int edge_marker
      
  cdef cppclass InterfaceGeom[T]:# public Geom[T]
    int neighb_id
    T   neighb_diam

  Geom[Ord]* init_geom_ord()
  Geom[double]* init_geom_vol(RefMap *rm, int order)
  Geom[double]* init_geom_surf(RefMap *rm, SurfPos* surf_pos, int order)
  Func[Ord]* init_fn_ord(int order)
  Func[double]* init_fn(PrecalcShapeset *fu, RefMap *rm, int order)
  Func[double]* init_fn(MeshFunction[double]*fu, int order)
#  Func[cComplex[double]]* init_fn(MeshFunction[cComplex[double]]*fu, int order)
  Func[double]* init_fn(Solution[double]*fu, int order)
  Func[cComplex[double]]* init_fn(Solution[cComplex[double]]*fu, int order)

  cdef cppclass ExtData[T]:
    Func[T]** fn
    int get_nf()

cdef class PyFuncReal:
  cdef bool dealloc
  cdef Func[double]* thisptr

cdef class PyGeomReal:
  cdef bool dealloc
  cdef Geom[double]* thisptr

cdef class PyExtDataReal:
  cdef bool dealloc
  cdef ExtData[double]* thisptr

cdef class PyFuncComplex:
  cdef bool dealloc
  cdef Func[cComplex[double]]* thisptr

cdef class PyGeomComplex:
  cdef bool dealloc
  cdef Geom[cComplex[double]]* thisptr

cdef class PyExtDataComplex:
  cdef bool dealloc
  cdef ExtData[cComplex[double]]* thisptr

cdef class PyFuncOrd:
  cdef bool dealloc
  cdef Func[Ord]* thisptr

cdef class PyGeomOrd:
  cdef bool dealloc
  cdef Geom[Ord]* thisptr

cdef class PyExtDataOrd:
  cdef bool dealloc
  cdef ExtData[Ord]* thisptr

cdef class PyFuncRealArray:
  cdef Func[double] ** thisptr
cdef class PyFuncComplexArray:
  cdef Func[cComplex[double]] ** thisptr
cdef class PyFuncOrdArray:
  cdef Func[Ord] ** thisptr


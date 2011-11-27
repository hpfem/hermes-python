cdef extern from "weakform/weakform.h" namespace "Hermes::Hermes2D":
  enum SymFlag:
    HERMES_ANTISYM # -1,
    HERMES_NONSYM # 0,
    HERMES_SYM # 1

  ctypedef void* pMatrixFormVol "MatrixFormVol<Scalar>*" #cython error override
  ctypedef void* pMatrixFormVolReal "Hermes::Hermes2D::MatrixFormVol<double>*" #cython error override
  ctypedef void* pMatrixFormVolComplex "Hermes::Hermes2D::MatrixFormVol<std::complex<double> >*" #cython error override

  ctypedef void* pVectorFormVol "VectorFormVol<Scalar>*" #cython error override
  ctypedef void* pVectorFormVolReal "Hermes::Hermes2D::VectorFormVol<double>*" #cython error override
  ctypedef void* pVectorFormVolComplex "Hermes::Hermes2D::VectorFormVol<std::complex<double> >*" #cython error override

  ctypedef void* pMatrixFormSurf "MatrixFormSurf<Scalar>*" #cython error override
  ctypedef void* pMatrixFormSurfReal "Hermes::Hermes2D::MatrixFormSurf<double>*" #cython error override
  ctypedef void* pMatrixFormSurfComplex "Hermes::Hermes2D::MatrixFormSurf<std::complex<double> >*" #cython error override

  ctypedef void* pVectorFormSurf "VectorFormSurf<Scalar>*" #cython error override
  ctypedef void* pVectorFormSurfReal "Hermes::Hermes2D::VectorFormSurf<double>*" #cython error override
  ctypedef void* pVectorFormSurfComplex "Hermes::Hermes2D::VectorFormSurf<std::complex<double> >*" #cython error override

  ctypedef void* pMultiComponentMatrixFormVol "MultiComponentMatrixFormVol<Scalar>*" #cython error override
  ctypedef void* pMultiComponentMatrixFormVolReal "Hermes::Hermes2D::MultiComponentMatrixFormVol<double>*" #cython error override
  ctypedef void* pMultiComponentMatrixFormVolComplex "Hermes::Hermes2D::MultiComponentMatrixFormVol<std::complex<double> >*" #cython error override

  ctypedef void* pMultiComponentVectorFormVol "MultiComponentVectorFormVol<Scalar>*" #cython error override
  ctypedef void* pMultiComponentVectorFormVolReal "Hermes::Hermes2D::MultiComponentVectorFormVol<double>*" #cython error override
  ctypedef void* pMultiComponentVectorFormVolComplex "Hermes::Hermes2D::MultiComponentVectorFormVol<std::complex<double> >*" #cython error override

  ctypedef void* pMultiComponentMatrixFormSurf "MultiComponentMatrixFormSurf<Scalar>*" #cython error override
  ctypedef void* pMultiComponentMatrixFormSurfReal "Hermes::Hermes2D::MultiComponentMatrixFormSurf<double>*" #cython error override
  ctypedef void* pMultiComponentMatrixFormSurfComplex "Hermes::Hermes2D::MultiComponentMatrixFormSurf<std::complex<double> >*" #cython error override

  ctypedef void* pMultiComponentVectorFormSurf "MultiComponentVectorFormSurf<Scalar>*" #cython error override
  ctypedef void* pMultiComponentVectorFormSurfReal "Hermes::Hermes2D::MultiComponentVectorFormSurf<double>*" #cython error override
  ctypedef void* pMultiComponentVectorFormSurfComplex "Hermes::Hermes2D::MultiComponentVectorFormSurf<std::complex<double> >*" #cython error override

  ctypedef void upair "pair<unsigned int, unsigned int>" #cython error override

  cdef cppclass MatrixFormVol[Scalar]: # public Form[Scalar]
    MatrixFormVol(unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MatrixFormVol(unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    MatrixFormVol(unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext)
    MatrixFormVol(unsigned int i, unsigned int j,string area, SymFlag sym)
    MatrixFormVol(unsigned int i, unsigned int j,string area)
    MatrixFormVol(unsigned int i, unsigned int j)
    MatrixFormVol(unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MatrixFormVol(unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    MatrixFormVol(unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext)
    MatrixFormVol(unsigned int i, unsigned int j, vector[string] areas, SymFlag sym)
    MatrixFormVol(unsigned int i, unsigned int j, vector[string] areas)
    MatrixFormVol* clone()
    unsigned int i
    unsigned int j
    int sym
    Scalar value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v,
      Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass MatrixFormSurf[Scalar]: #public Form[Scalar]
    MatrixFormSurf(unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MatrixFormSurf(unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext, double scaling_factor)
    MatrixFormSurf(unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext)
    MatrixFormSurf(unsigned int i, unsigned int j, string area)
    MatrixFormSurf(unsigned int i, unsigned int j)
    MatrixFormSurf(unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MatrixFormSurf(unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    MatrixFormSurf(unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext)
    MatrixFormSurf(unsigned int i, unsigned int j, vector[string] areas)
    MatrixFormSurf* clone()
    unsigned int i
    unsigned int j
    Scalar value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass VectorFormVol[Scalar]: #public Form[Scalar]
    VectorFormVol(unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    VectorFormVol(unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor)
    VectorFormVol(unsigned int i, string area, vector[pMeshFunction] ext)
    VectorFormVol(unsigned int i, string area)
    VectorFormVol(unsigned int i)
    VectorFormVol(unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    VectorFormVol(unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    VectorFormVol(unsigned int i, vector[string] areas, vector[pMeshFunction] ext)
    VectorFormVol(unsigned int i, vector[string] areas)
    VectorFormVol* clone()
    unsigned int i
    Scalar value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass VectorFormSurf[Scalar]: #public Form[Scalar]
    VectorFormSurf(unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    VectorFormSurf(unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor)
    VectorFormSurf(unsigned int i, string area, vector[pMeshFunction] ext)
    VectorFormSurf(unsigned int i, string area)
    VectorFormSurf(unsigned int i)
    VectorFormSurf(unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    VectorFormSurf(unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    VectorFormSurf(unsigned int i, vector[string] areas, vector[pMeshFunction] ext)
    VectorFormSurf(unsigned int i, vector[string] areas)
    VectorFormSurf* clone()
    unsigned int i
    Scalar value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass MultiComponentMatrixFormVol[Scalar]: # public Form[Scalar]
    MultiComponentMatrixFormVol(vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, string area, SymFlag sym)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, string area)
    MultiComponentMatrixFormVol(vector[upair ]coordinates)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, vector[string] areas, SymFlag sym)
    MultiComponentMatrixFormVol(vector[upair ]coordinates, vector[string] areas)
    MultiComponentMatrixFormVol* clone()
    vector[upair ] coordinates
    int sym
    void value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext, vector[Scalar]& result)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass MultiComponentMatrixFormSurf[Scalar]: #public Form[Scalar]
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, string area, vector[pMeshFunction] ext)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, string area)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext)
    MultiComponentMatrixFormSurf(vector[upair ]coordinates, vector[string] areas)
    MultiComponentMatrixFormSurf* clone()
    vector[upair] coordinates
    void value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext, vector[Scalar]& result)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass MultiComponentVectorFormVol[Scalar]: #public Form[Scalar]
    MultiComponentVectorFormVol(vector[unsigned] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, string area, vector[pMeshFunction] ext)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, string area)
    MultiComponentVectorFormVol(vector[unsigned] coordinates)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext)
    MultiComponentVectorFormVol(vector[unsigned] coordinates, vector[string] areas)
    MultiComponentVectorFormVol* clone()
    vector[unsigned int] coordinates
    void value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext, vector[Scalar]& result)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass MultiComponentVectorFormSurf[Scalar]: # public Form[Scalar]
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, string area)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext)
    MultiComponentVectorFormSurf(vector[unsigned int] coordinates, vector[string] areas)
    MultiComponentVectorFormSurf* clone()
    vector[unsigned int] coordinates
    void value(int n, double *wt, Func[Scalar] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[Scalar] *ext, vector[Scalar]& result)
    Ord ord(int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext)

  cdef cppclass Stage[Scalar]:
    vector[int] idx
    vector[Mesh*] meshes
    vector[Transformable*] fns
    vector[pMeshFunction] ext
    vector[pMatrixFormVol] mfvol
    vector[pMatrixFormSurf] mfsurf
    vector[pVectorFormVol] vfvol
    vector[pVectorFormSurf] vfsurf
    vector[pMultiComponentMatrixFormVol] mfvol_mc
    vector[pMultiComponentMatrixFormSurf] mfsurf_mc
    vector[pMultiComponentVectorFormVol] vfvol_mc
    vector[pMultiComponentVectorFormSurf] vfsurf_mc
    cSet[int] idx_set
    cSet[unsigned] seq_set
    cSet[pMeshFunction] ext_set

  cdef cppclass WeakForm[Scalar]:
    WeakForm(unsigned int neq, bool mat_free)
    WeakForm(unsigned int neq)
    WeakForm()
    void add_matrix_form(MatrixFormVol[Scalar]* mfv)
    void add_matrix_form_surf(MatrixFormSurf[Scalar]* mfs)
    void add_vector_form(VectorFormVol[Scalar]* vfv)
    void add_vector_form_surf(VectorFormSurf[Scalar]* vfs)
    void add_multicomponent_matrix_form(MultiComponentMatrixFormVol[Scalar]* mfv)
    void add_multicomponent_matrix_form_surf(MultiComponentMatrixFormSurf[Scalar]* mfs)
    void add_multicomponent_vector_form(MultiComponentVectorFormVol[Scalar]* vfv)
    void add_multicomponent_vector_form_surf(MultiComponentVectorFormSurf[Scalar]* vfs)
    unsigned int get_neq()
    bool is_matrix_free()
    void set_current_time(double time)
    double get_current_time()
    vector[pMatrixFormVol] get_mfvol()
    vector[pMatrixFormSurf] get_mfsurf()
    vector[pVectorFormVol] get_vfvol()
    vector[pVectorFormSurf] get_vfsurf()
    vector[pMultiComponentMatrixFormVol] get_mfvol_mc()
    vector[pMultiComponentMatrixFormSurf] get_mfsurf_mc()
    vector[pMultiComponentVectorFormVol] get_vfvol_mc()
    vector[pMultiComponentVectorFormSurf] get_vfsurf_mc()

  cdef cppclass Form[Scalar]:
    Form(string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    Form(string area, vector[pMeshFunction] ext, double scaling_factor)
    Form(string area, vector[pMeshFunction] ext)
    Form(string area)
    Form()
    Form(vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    Form(vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    Form(vector[string] areas, vector[pMeshFunction] ext)
    Form(vector[string] areas)
    void set_weakform(WeakForm[Scalar]* wf)
    void set_current_stage_time(double time)
    double get_current_stage_time()
    vector[string] areas
    vector[pMeshFunction] ext
    double scaling_factor
    int u_ext_offset

cdef class PyFormReal:
  cdef Form[double] * thisptr

cdef class PyFormComplex:
  cdef Form[cComplex[double]] * thisptr

cdef class PyWeakFormReal:
  cdef WeakForm[double] * thisptr

cdef class PyWeakFormComplex:
  cdef WeakForm[cComplex[double]] * thisptr

cdef class PyStageReal:
  cdef Stage[double] * thisptr

cdef class PyStageComplex:
  cdef Stage[cComplex[double]] * thisptr





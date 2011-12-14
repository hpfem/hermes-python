cdef extern from "customclasses/weakform.h" namespace "Hermes::Hermes2D":
  #ctypedef void upair "std::pair<unsigned int, unsigned int>" #cython error override

  cdef cppclass CustomMatrixFormVol[Scalar]: # public Form[Scalar]
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j,string area, SymFlag sym, vector[pMeshFunction] ext)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j,string area, SymFlag sym)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j,string area)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j, vector[string] areas, SymFlag sym)
    CustomMatrixFormVol(object self, unsigned int i, unsigned int j, vector[string] areas)

  cdef cppclass CustomMatrixFormSurf[Scalar]: #public Form[Scalar]
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, string area, vector[pMeshFunction] ext)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, string area)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, vector[string] areas, vector[pMeshFunction] ext)
    CustomMatrixFormSurf(object self, unsigned int i, unsigned int j, vector[string] areas)

  cdef cppclass CustomVectorFormVol[Scalar]: #public Form[Scalar]
    CustomVectorFormVol(object self, unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomVectorFormVol(object self, unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomVectorFormVol(object self, unsigned int i, string area, vector[pMeshFunction] ext)
    CustomVectorFormVol(object self, unsigned int i, string area)
    CustomVectorFormVol(object self, unsigned int i)
    CustomVectorFormVol(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomVectorFormVol(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomVectorFormVol(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext)
    CustomVectorFormVol(object self, unsigned int i, vector[string] areas)

  cdef cppclass CustomVectorFormSurf[Scalar]: #public Form[Scalar]
    CustomVectorFormSurf(object self, unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomVectorFormSurf(object self, unsigned int i, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomVectorFormSurf(object self, unsigned int i, string area, vector[pMeshFunction] ext)
    CustomVectorFormSurf(object self, unsigned int i, string area)
    CustomVectorFormSurf(object self, unsigned int i)
    CustomVectorFormSurf(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomVectorFormSurf(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomVectorFormSurf(object self, unsigned int i, vector[string] areas, vector[pMeshFunction] ext)
    CustomVectorFormSurf(object self, unsigned int i, vector[string] areas)

  cdef cppclass CustomMultiComponentMatrixFormVol[Scalar]: # public Form[Scalar]
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, string area, SymFlag sym, vector[pMeshFunction] ext)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, string area, SymFlag sym)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, string area)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, vector[string] areas, SymFlag sym, vector[pMeshFunction] ext)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, vector[string] areas, SymFlag sym)
    CustomMultiComponentMatrixFormVol(object self, vector[upair ]coordinates, vector[string] areas)

  cdef cppclass CustomMultiComponentMatrixFormSurf[Scalar]: #public Form[Scalar]
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, string area, vector[pMeshFunction] ext)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, string area)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, vector[string] areas, vector[pMeshFunction] ext)
    CustomMultiComponentMatrixFormSurf(object self, vector[upair ]coordinates, vector[string] areas)

  cdef cppclass CustomMultiComponentVectorFormVol[Scalar]: #public Form[Scalar]
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, string area, vector[pMeshFunction] ext)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, string area)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, vector[string] areas, vector[pMeshFunction] ext)
    CustomMultiComponentVectorFormVol(object self, vector[unsigned] coordinates, vector[string] areas)

  cdef cppclass CustomMultiComponentVectorFormSurf[Scalar]: # public Form[Scalar]
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, string area, vector[pMeshFunction] ext)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, string area)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor, int u_ext_offset)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext, double scaling_factor)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, vector[string] areas, vector[pMeshFunction] ext)
    CustomMultiComponentVectorFormSurf(object self, vector[unsigned int] coordinates, vector[string] areas)

cdef class PyCustomMatrixFormVolReal(PyMatrixFormVolReal):
  pass
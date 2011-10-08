cdef extern from "mesh/mesh_reader_h2d_xml.h" namespace "Hermes::Hermes2D":
  cdef cppclass MeshReaderH2DXML:
    bool load(char *filename, Mesh *mesh)
    bool save(char *filename, Mesh *mesh)
    bool load(char *filename, vector[Mesh *] meshes)
    bool save(char *filename, vector[Mesh *] meshes)

cdef class PyMeshReaderH2DXML:
  cdef MeshReaderH2DXML * thisptr


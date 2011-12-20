cdef extern from "mesh/mesh_reader_h1d_xml.h" namespace "Hermes::Hermes2D":
  cdef cppclass MeshReaderH1DXML:
    bool load(char *filename, Mesh *mesh)
    bool save(char *filename, Mesh *mesh)

cdef class PyMeshReaderH1DXML:
  cdef MeshReaderH1DXML * thisptr


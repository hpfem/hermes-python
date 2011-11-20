cdef extern from "space/space_hcurl.h" namespace "Hermes::Hermes2D":
  cdef cppclass HcurlSpace[Scalar]: #public Space<Scalar>
    HcurlSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init, Shapeset* shapeset)
    HcurlSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init)
    HcurlSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions)
    HcurlSpace(Mesh* mesh, int p_init, Shapeset* shapeset)
    HcurlSpace(Mesh* mesh, int p_init)
    HcurlSpace(Mesh* mesh)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs)
    void load(char *filename, Mesh* mesh, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh)

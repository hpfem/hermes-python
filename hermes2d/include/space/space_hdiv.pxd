cdef extern from "space/space_hdiv.h" namespace "Hermes::Hermes2D":
  cdef cppclass HdivSpace[Scalar]: #public Space<Scalar>
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init, Shapeset* shapeset)
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init)
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions)
    HdivSpace(Mesh* mesh, int p_init, Shapeset* shapeset)
    HdivSpace(Mesh* mesh, int p_init)
    HdivSpace(Mesh* mesh)

    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs)
    void load(char *filename, Mesh* mesh, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh)

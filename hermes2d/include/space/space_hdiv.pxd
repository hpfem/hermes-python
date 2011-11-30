cdef extern from "space/space_hdiv.h" namespace "Hermes::Hermes2D":
  cdef cppclass HdivSpace[Scalar]: #public Space<Scalar>
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init, Shapeset* shapeset) except + translateException
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init) except + translateException
    HdivSpace(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions) except + translateException
    HdivSpace(Mesh* mesh, int p_init, Shapeset* shapeset) except + translateException
    HdivSpace(Mesh* mesh, int p_init) except + translateException
    HdivSpace(Mesh* mesh) except + translateException

    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs)
    void load(char *filename, Mesh* mesh, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh)

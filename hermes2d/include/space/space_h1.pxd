cdef extern from "space/space_h1.h" namespace "Hermes::Hermes2D":
  cdef cppclass H1Space[Scalar]: #public Space<Scalar>
    H1Space(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init, Shapeset* shapeset)except +translateException
    H1Space(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions, int p_init)except +translateException
    H1Space(Mesh* mesh, EssentialBCs[Scalar]* boundary_conditions)except +translateException
    H1Space(Mesh* mesh, int p_init, Shapeset* shapeset)except +translateException
    H1Space(Mesh* mesh, int p_init)except +translateException
    H1Space(Mesh* mesh)except +translateException
    void fix_vertex(int id, Scalar value)
    void fix_vertex(int id)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs)
    void load(char *filename, Mesh* mesh, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh)

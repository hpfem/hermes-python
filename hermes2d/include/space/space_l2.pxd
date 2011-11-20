cdef extern from "space/space_l2.h" namespace "Hermes::Hermes2D":
  cdef cppclass L2Space[Scalar]: #public Space<Scalar>
    L2Space(Mesh* mesh, int p_init, Shapeset* shapeset)
    L2Space(Mesh* mesh, int p_init)
    L2Space(Mesh* mesh)
    void load(char *filename, Mesh* mesh, Shapeset* shapeset)
    void load(char *filename, Mesh* mesh)

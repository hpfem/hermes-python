cdef extern from "views/mesh_view.h" namespace "Hermes::Hermes2D::Views":
  cdef cppclass MeshView: # public View
    MeshView(char* title, WinGeom* wg )
    MeshView(char* title)
    MeshView()
    void show(Mesh* mesh)


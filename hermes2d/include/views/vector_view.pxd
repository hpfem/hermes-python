cdef extern from "views/vector_view.h" namespace "Hermes::Hermes2D::Views":
  cdef cppclass VectorView : # public View
    VectorView(char* title, WinGeom* wg)
    VectorView(char* title)
    VectorView()
    void show(MeshFunction[double]* sln)
    void show(MeshFunction[double]* sln, double eps)
    void show(MeshFunction[double]* xsln, MeshFunction[double]* ysln, double eps)
    void show(MeshFunction[double]* xsln, MeshFunction[double]* ysln)
    void show(MeshFunction[double]* xsln, MeshFunction[double]* ysln, double eps, int xitem, int yitem)
    inline void set_grid_type(bool hexa)
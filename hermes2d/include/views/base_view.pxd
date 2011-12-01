cdef extern from "views/base_view.h" namespace "Hermes::Hermes2D::Views":
  cdef cppclass BaseView[Scalar]: #public View
    BaseView(char* title, WinGeom* wg)
    BaseView(char* title)
    BaseView()
    void show(Space[Scalar]* space)
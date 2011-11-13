cdef extern from "views/order_view.h" namespace "Hermes::Hermes2D::Views":
  cdef cppclass OrderView: #public View
    OrderView(char* title, WinGeom* wg)
    OrderView(char* title)
    OrderView()
    void show(Space[double]* space)
    void show(Space[cComplex[double]]* space)


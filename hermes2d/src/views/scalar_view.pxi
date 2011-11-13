cdef class PyScalarView(PyView):
  def __cinit__(self,title = None, wg = None, init = True):
    if not init:
      return
    if type(self)!=PyScalarView:
      return
    if wg is not None:
      self.thisptr = <View*> new ScalarView(title, (<PyWinGeom> wg).thisptr)
      return
    if title is not None:
      self.thisptr = <View*> new ScalarView(title)
      return
    self.thisptr = <View*> new ScalarView()
  def init(self):
    (<ScalarView*> self.thisptr).init()
  def show(self, PyMeshFunctionReal sln, eps = None, item = None , xdisp = None, ydisp = None, dmult = None):
    if dmult is not None:
      (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps, item, 
          <MeshFunction[double]*> (<PyMeshFunctionReal> xdisp).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> ydisp).thisptr, dmult)
      return
    if ydisp is not None:
      (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps, item, 
          <MeshFunction[double]*> (<PyMeshFunctionReal> xdisp).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> ydisp).thisptr)
      return
    if xdisp is not None:
      (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps, item, 
          <MeshFunction[double]*> (<PyMeshFunctionReal> xdisp).thisptr)
      return
    if item is not None:
      (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps, item)
      return
    if eps is not None:
      (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr, eps)
      return
    (<ScalarView*> self.thisptr).show(<MeshFunction[double]*> sln.thisptr)
  def show_linearizer_data(self, eps = None, item0 = None):
    if item0 is not None:
      (<ScalarView*> self.thisptr).show_linearizer_data(eps, item0)
      return
    if eps is not None:
      (<ScalarView*> self.thisptr).show_linearizer_data(eps)
      return
    (<ScalarView*> self.thisptr).show_linearizer_data()
  def show_mesh(self, show = None):
    if show is not None:
      (<ScalarView*> self.thisptr).show_mesh(show)
    else:
      (<ScalarView*> self.thisptr).show_mesh()
  def show_bounding_box(self, show = None):
    if show is not None:
      (<ScalarView*> self.thisptr).show_bounding_box(show)
    else:
      (<ScalarView*> self.thisptr).show_bounding_box()
  def show_contours(self, double step, orig = None):
    if orig is not None:
      (<ScalarView*> self.thisptr).show_contours(step, orig)
    else:
      (<ScalarView*> self.thisptr).show_contours(step)
  def hide_contours(self):
    (<ScalarView*> self.thisptr).hide_contours()
  def set_3d_mode(self, enable = None):
    if enable is not None:
      (<ScalarView*> self.thisptr).set_3d_mode(enable)
    else:
      (<ScalarView*> self.thisptr).set_3d_mode()
  def set_vertical_scaling(self, double sc):
    (<ScalarView*> self.thisptr).set_vertical_scaling(sc)
  def set_min_max_range(self, double min, double max):
    (<ScalarView*> self.thisptr).set_min_max_range(min, max)
  property lin:
    def __set__(self, PyLinearizer value):
      (<ScalarView*> self.thisptr).lin = <Linearizer*> value.thisptr
    def __get__(self):
      cdef PyLinearizer r = PyLinearizer(init=False)
      r.thisptr = <LinearizerBase*> (<ScalarView*> self.thisptr).lin
      return r

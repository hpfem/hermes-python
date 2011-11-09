cdef class PyOrderView(PyView): 
  def __cinit__(self, title = None, wg = None):
    if type(self)!=PyOrderView:
      return
    if title is not None and wg is not None:
      self.thisptr = <View*> new OrderView(title, (<PyWinGeom> wg).thisptr)
      return
    if title is not None:
      self.thisptr = <View*> new OrderView(title)
      return
    self.thisptr = <View*> new OrderView()
  def show(self, space):
    if isinstance(space, PySpaceReal):
      (<OrderView*> self.thisptr).show((<PySpaceReal> space).thisptr)
      return 
    (<OrderView*> self.thisptr).show((<PySpaceComplex> space).thisptr)


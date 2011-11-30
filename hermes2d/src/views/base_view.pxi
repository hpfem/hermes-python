cdef class PyBaseViewReal(PyView): 
  def __cinit__(self, title = None, wg = None):
    if type(self)!=PyBaseViewReal:
      return
    if title is not None and wg is not None:
      self.thisptr = <View*> new BaseView[double](title, (<PyWinGeom> wg).thisptr)
      return
    if title is not None:
      self.thisptr = <View*> new BaseView[double](title)
      return
    self.thisptr = <View*> new BaseView[double]()
    
  def show(self, space):
    (<BaseView[double]*> self.thisptr).show((<PySpaceReal> space).thisptr)

cdef class PyBaseViewComplex(PyView): 
  def __cinit__(self, title = None, wg = None):
    if type(self)!=PyBaseViewComplex:
      return
    if title is not None and wg is not None:
      self.thisptr = <View*> new BaseView[cComplex[double]](title, (<PyWinGeom> wg).thisptr)
      return
    if title is not None:
      self.thisptr = <View*> new BaseView[cComplex[double]](title)
      return
    self.thisptr = <View*> new BaseView[cComplex[double]]()
    
  def show(self, space):
    (<BaseView[cComplex[double]]*> self.thisptr).show((<PySpaceComplex> space).thisptr)
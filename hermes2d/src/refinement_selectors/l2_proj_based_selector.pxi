cdef class PyL2ProjBasedSelectorReal(PySelectorReal):
  def __cinit__(self,cand_list, double conv_exp = 1.0, int max_order = -1, PyL2Shapeset user_shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyL2ProjBasedSelectorReal:
      return
    if isinstance(user_shapeset,PyL2Shapeset):
      shapeset = user_shapeset

    if shapeset is not None:
      self.thisptr = <Selector[double]*> new L2ProjBasedSelector[double](cand_list, conv_exp, max_order, (<PyL2Shapeset> shapeset).thisptr)
      return
    else:
      self.thisptr = <Selector[double]*> new L2ProjBasedSelector[double](cand_list, conv_exp, max_order)
      return
      
cdef class PyL2ProjBasedSelectorComplex(PySelectorComplex):
  def __cinit__(self,cand_list, double conv_exp = 1.0, int max_order = -1, PyL2Shapeset user_shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyL2ProjBasedSelectorComplex:
      return
    if isinstance(user_shapeset,PyL2Shapeset):
      shapeset = user_shapeset

    if shapeset is not None:
      self.thisptr = <Selector[cComplex[double]]*> new L2ProjBasedSelector[cComplex[double]](cand_list, conv_exp, max_order, (<PyL2Shapeset> shapeset).thisptr)
      return
    else:
      self.thisptr = <Selector[cComplex[double]]*> new L2ProjBasedSelector[cComplex[double]](cand_list, conv_exp, max_order)
      return

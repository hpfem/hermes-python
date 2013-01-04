cdef class PyH1ProjBasedSelectorReal(PySelectorReal):
  def __cinit__(self,cand_list, conv_exp = None, max_order = None, user_shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyH1ProjBasedSelectorReal:
      return
    if isinstance(user_shapeset,PyH1Shapeset):
      shapeset = user_shapeset
        
    if conv_exp is not None:
      if max_order is not None:
        if user_shapeset is not None:
          self.thisptr = <Selector[double]*> new H1ProjBasedSelector[double](cand_list, conv_exp, max_order, (<PyH1Shapeset> user_shapeset).thisptr)
        else:
          self.thisptr = <Selector[double]*> new H1ProjBasedSelector[double](cand_list, conv_exp, max_order)
      else:
        self.thisptr = <Selector[double]*> new H1ProjBasedSelector[double](cand_list, conv_exp)
    else:
      self.thisptr = <Selector[double]*> new H1ProjBasedSelector[double](cand_list)
    return
      
cdef class PyH1ProjBasedSelectorComplex(PySelectorComplex):
  def __cinit__(self,cand_list, conv_exp = None, max_order = None, user_shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyH1ProjBasedSelectorComplex:
      return
    if isinstance(user_shapeset,PyH1Shapeset):
      shapeset = user_shapeset
        
    if conv_exp is not None:
      if max_order is not None:
        if user_shapeset is not None:
          self.thisptr = <Selector[cComplex[double]]*> new H1ProjBasedSelector[cComplex[double]](cand_list, conv_exp, max_order, (<PyH1Shapeset> user_shapeset).thisptr)
        else:
          self.thisptr = <Selector[cComplex[double]]*> new H1ProjBasedSelector[cComplex[double]](cand_list, conv_exp, max_order)
      else:
        self.thisptr = <Selector[cComplex[double]]*> new H1ProjBasedSelector[cComplex[double]](cand_list, conv_exp)
    else:
      self.thisptr = <Selector[cComplex[double]]*> new H1ProjBasedSelector[cComplex[double]](cand_list)
    return

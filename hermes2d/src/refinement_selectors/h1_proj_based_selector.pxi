cdef class PyH1ProjBasedSelectorReal:
  def __cinit__(self,cand_list, double conv_exp = 1.0, int max_order = -1, PyH1Shapeset user_shapeset = None, init = True):
    if not init:
      return
    if type(self)!=PyH1ProjBasedSelectorReal:
      return
    if isinstance(user_shapeset,PyH1Shapeset):
      shapeset = user_shapeset
        
    if shapeset is not None:
      self.thisptr = <H1ProjBasedSelector[double]*> new H1ProjBasedSelector[double](cand_list, conv_exp, max_order, (<PyH1Shapeset> shapeset).thisptr)
      return
    else:
      self.thisptr = <H1ProjBasedSelector[double]*> new H1ProjBasedSelector[double](cand_list, conv_exp, max_order)
      return
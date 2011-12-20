cdef class PySpaceReal:
  def __dealloc__(self):
    del self.thisptr
  def set_element_order(self, int id, int order):
    self.thisptr.set_element_order(id, order)
  def set_element_orders(self, elem_orders):
    cdef int * celem_orders=intArray(elem_orders)
    self.thisptr.set_element_orders(celem_orders)
    delBuffer[int](celem_orders)
  def get_element_order(self, int id):
    return self.thisptr.get_element_order(id)
  def set_uniform_order(self, int order,char * marker):
    cdef string cmarker
    cmarker.assign(marker)
    self.thisptr.set_uniform_order(order, cmarker)
  def set_uniform_order(self, int order):
    self.thisptr.set_uniform_order(order)
  def adjust_element_order(self, int horizontal_order_change, int vertical_order_change, horizontal_min_order=None, vertical_min_order=None):
    if vertical_min_order is not None:
      self.thisptr.adjust_element_order(horizontal_order_change, vertical_order_change, horizontal_min_order, vertical_min_order)
    else:
      self.thisptr.adjust_element_order(horizontal_order_change, vertical_order_change)
  def unrefine_all_mesh_elements(self, bool keep_initial_refinements):
    self.thisptr.unrefine_all_mesh_elements(keep_initial_refinements)
  def unrefine_all_mesh_elements(self):
    self.thisptr.unrefine_all_mesh_elements()
  def update_element_orders_after_refinement(self):
    self.thisptr.update_element_orders_after_refinement()
  def set_shapeset(self, PyShapeset shapeset):
    self.thisptr.set_shapeset(shapeset.thisptr)
  def copy_orders(self, PySpaceReal space,inc=None):
    if inc is not None:
      self.thisptr.copy_orders(space.thisptr, inc)
    else:
      self.thisptr.copy_orders(space.thisptr)
  def get_num_dofs(self, spaces=None):
    cdef vector[pcSpaceReal] cspaces
    cdef PySpaceReal sp
    if isinstance(spaces,list):
      for sp in spaces:
        cspaces.push_back(sp.thisptr)
      return self.thisptr.get_num_dofs(cspaces)
    if spaces is not None:
      return self.thisptr.get_num_dofs((<PySpaceReal>spaces).thisptr)
    else:
      return self.thisptr.get_num_dofs()
  def get_mesh(self):
    cdef PyMesh m = PyMesh(init=False)
    m.thisptr = self.thisptr.get_mesh()
    return m
  def set_mesh(self, PyMesh mesh):
    self.thisptr.set_mesh(mesh.thisptr)
  def set_essential_bcs(self, PyEssentialBCsReal essential_bcs):
    self.thisptr.set_essential_bcs(essential_bcs.thisptr)
  def get_essential_bcs(self):
    cdef PyEssentialBCsReal ebc = PyEssentialBCsReal(init=False)
    ebc.thisptr = self.thisptr.get_essential_bcs()
    return ebc
  def update_essential_bc_values(self):
    self.thisptr.update_essential_bc_values()
  def get_bc_projection(self, PySurfPos surf_pos, int order):
    cdef double * cp
    cdef int i
    p=[]
    cp=self.thisptr.get_bc_projection(surf_pos.thisptr, order)
    for i in range(order+1):
      p.append(cp[i])
    return p
  def get_element_assembly_list(self, PyElement e, PyAsmListReal al):
    self.thisptr.get_element_assembly_list(e.thisptr, al.thisptr)
  def get_shapeset(self):
    cdef PyShapeset s = PyShapeset(init=False)
    s.thisptr = self.thisptr.get_shapeset()
    return s
  def set_element_order_internal(self, int id, int order):
    self.thisptr.set_element_order_internal(id, order)
  def assign_dofs(self, first_dof = None, stride = None):
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal s
    if isinstance(first_dof, list): #spaces
      for s in first_dof:
        cspaces.push_back(s.thisptr)
      return self.thisptr.assign_dofs(cspaces)
    if stride is not None:
      return self.thisptr.assign_dofs(first_dof, stride)
    if first_dof is not None:
      return self.thisptr.assign_dofs(<int> first_dof)
    return self.thisptr.assign_dofs()
  def get_type(self):
    return self.thisptr.get_type()
  def construct_refined_spaces(self, coarse, order_increase = None, refinement_type = None):
    cdef vector[pSpaceReal] ccoarse
    cdef PySpaceReal sp = PySpaceReal(init = False)
    cdef vector[pSpaceReal] * cr
    for sp in coarse:
      ccoarse.push_back(sp.thisptr)
    if refinement_type is not None:
      cr = self.thisptr.construct_refined_spaces(ccoarse, order_increase, refinement_type)
    else:
      if order_increase is not None:
        cr = self.thisptr.construct_refined_spaces(ccoarse, order_increase)
      else:
        cr = self.thisptr.construct_refined_spaces(ccoarse)
    r = []
    for i in range(cr.size()):
      sp = PySpaceReal(init = False)
      sp.thisptr = <Space[double]*> cr.at(i)
      r.append(sp)
    return r
  def construct_refined_space(self, PySpaceReal coarse, order_increase = None, refinement_type = None):
    cdef PySpaceReal r = PySpaceReal(init = False)
    if order_increase is not None:
      r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr, order_increase, refinement_type)
      return r
    if  order_increase is not None:
      r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr, order_increase)
      return r
    r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr)
    return r
  def update_essential_bc_values(self, spaces, double time):
    cdef vector[pSpaceReal] cspaces
    if isinstance(spaces,list):
      for sp in spaces:
        cspaces.push_back((<PySpaceReal>sp).thisptr)
      self.thisptr.update_essential_bc_values(cspaces, time)
    else:
      self.thisptr.update_essential_bc_values((<PySpaceReal> spaces).thisptr, time)
  def save(self, char *filename):
    return self.thisptr.save(filename)
  def load(self, char *filename, essential_bcs = None):
    if essential_bcs is not None:
      self.thisptr.load(filename, (<PyEssentialBCsReal> essential_bcs).thisptr)
    self.thisptr.load(filename)


cdef class PySpaceComplex:
  def __dealloc__(self):
    del self.thisptr
  def set_element_order(self, int id, int order):
    self.thisptr.set_element_order(id, order)
  def set_element_orders(self, elem_orders):
    cdef int * celem_orders=intArray(elem_orders)
    self.thisptr.set_element_orders(celem_orders)
    delBuffer[int](celem_orders)
  def get_element_order(self, int id):
    return self.thisptr.get_element_order(id)
  def set_uniform_order(self, int order,char * marker):
    cdef string cmarker
    cmarker.assign(marker)
    self.thisptr.set_uniform_order(order, cmarker)
  def set_uniform_order(self, int order):
    self.thisptr.set_uniform_order(order)
  def adjust_element_order(self, int horizontal_order_change, int vertical_order_change, horizontal_min_order=None, vertical_min_order=None):
    if vertical_min_order is not None:
      self.thisptr.adjust_element_order(horizontal_order_change, vertical_order_change, horizontal_min_order, vertical_min_order)
    else:
      self.thisptr.adjust_element_order(horizontal_order_change, vertical_order_change)
  def unrefine_all_mesh_elements(self, bool keep_initial_refinements):
    self.thisptr.unrefine_all_mesh_elements(keep_initial_refinements)
  def unrefine_all_mesh_elements(self):
    self.thisptr.unrefine_all_mesh_elements()
  def update_element_orders_after_refinement(self):
    self.thisptr.update_element_orders_after_refinement()
  def set_shapeset(self, PyShapeset shapeset):
    self.thisptr.set_shapeset(shapeset.thisptr)
  def copy_orders(self, PySpaceComplex space,inc=None):
    if inc is not None:
      self.thisptr.copy_orders(space.thisptr, inc)
    else:
      self.thisptr.copy_orders(space.thisptr)
  def get_num_dofs(self, spaces=None):
    cdef vector[pcSpaceComplex] cspaces
    cdef PySpaceComplex sp
    if isinstance(spaces,list):
      for sp in spaces:
        cspaces.push_back(sp.thisptr)
      return self.thisptr.get_num_dofs(cspaces)
    if spaces is not None:
      return self.thisptr.get_num_dofs((<PySpaceComplex>spaces).thisptr)
    else:
      return self.thisptr.get_num_dofs()
  def get_mesh(self):
    cdef PyMesh m = PyMesh(init=False)
    m.thisptr = self.thisptr.get_mesh()
    return m
  def set_mesh(self, PyMesh mesh):
    self.thisptr.set_mesh(mesh.thisptr)
  def set_essential_bcs(self, PyEssentialBCsComplex essential_bcs):
    self.thisptr.set_essential_bcs(essential_bcs.thisptr)
  def get_essential_bcs(self):
    cdef PyEssentialBCsComplex ebc = PyEssentialBCsComplex(init=False)
    ebc.thisptr = self.thisptr.get_essential_bcs()
    return ebc
  def update_essential_bc_values(self):
    self.thisptr.update_essential_bc_values()
  def get_bc_projection(self, PySurfPos surf_pos, int order):
    cdef cComplex[double] * cp
    cdef int i
    p=[]
    cp=self.thisptr.get_bc_projection(surf_pos.thisptr, order)
    for i in range(order+1):
      p.append(pcomplex(cp[i]))
    return p
  def get_element_assembly_list(self, PyElement e, PyAsmListComplex al):
    self.thisptr.get_element_assembly_list(e.thisptr, al.thisptr)
  def get_shapeset(self):
    cdef PyShapeset s = PyShapeset(init=False)
    s.thisptr = self.thisptr.get_shapeset()
    return s
  def set_element_order_internal(self, int id, int order):
    self.thisptr.set_element_order_internal(id, order)
  def assign_dofs(self, first_dof = None, stride = None):
    cdef vector[pSpaceComplex] cspaces
    cdef PySpaceComplex s
    if isinstance(first_dof, list): #spaces
      for s in first_dof:
        cspaces.push_back(s.thisptr)
      return self.thisptr.assign_dofs(cspaces)
    if stride is not None:
      return self.thisptr.assign_dofs(first_dof, stride)
    if first_dof is not None:
      return self.thisptr.assign_dofs(<int> first_dof)
    return self.thisptr.assign_dofs()
  def get_type(self):
    return self.thisptr.get_type()
  def construct_refined_spaces(self, coarse, order_increase = None, refinement_type = None):
    cdef vector[pSpaceComplex] ccoarse
    cdef PySpaceComplex sp = PySpaceComplex(init = False)
    cdef vector[pSpaceComplex] * cr
    for sp in coarse:
      ccoarse.push_back(sp.thisptr)
    if refinement_type is not None:
      cr = self.thisptr.construct_refined_spaces(ccoarse, order_increase, refinement_type)
    else:
      if order_increase is not None:
        cr = self.thisptr.construct_refined_spaces(ccoarse, order_increase)
      else:
        cr = self.thisptr.construct_refined_spaces(ccoarse)
    r = []
    for i in range(cr.size()):
      sp = PySpaceComplex(init = False)
      sp.thisptr = <Space[cComplex[double]]*> cr.at(i)
      r.append(sp)
    return r
  def construct_refined_space(self, PySpaceComplex coarse, order_increase = None, refinement_type = None):
    cdef PySpaceComplex r = PySpaceComplex(init = False)
    if order_increase is not None:
      r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr, order_increase, refinement_type)
      return r
    if  order_increase is not None:
      r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr, order_increase)
      return r
    r.thisptr = self.thisptr.construct_refined_space(coarse.thisptr)
    return r
  def update_essential_bc_values(self, spaces, double time):
    cdef vector[pSpaceComplex] cspaces
    if isinstance(spaces,list):
      for sp in spaces:
        cspaces.push_back((<PySpaceComplex>sp).thisptr)
      self.thisptr.update_essential_bc_values(cspaces, time)
    else:
      self.thisptr.update_essential_bc_values((<PySpaceComplex> spaces).thisptr, time)
  def save(self, char *filename):
    return self.thisptr.save(filename)
  def load(self, char *filename, essential_bcs = None):
    if essential_bcs is not None:
      self.thisptr.load(filename, (<PyEssentialBCsComplex> essential_bcs).thisptr)
    self.thisptr.load(filename)

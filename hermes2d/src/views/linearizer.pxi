cdef class PyLinearizer(PyLinearizerBase):
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyLinearizer:
      return
    self.thisptr = <LinearizerBase*> new Linearizer()
  def process_solution(self, PyMeshFunctionReal sln, item = None, eps = None):
    if eps is not None:
      (<Linearizer*> self.thisptr).process_solution(<MeshFunction[double]*> sln.thisptr, item, eps)
      return
    if item is not None:
      (<Linearizer*> self.thisptr).process_solution(<MeshFunction[double]*> sln.thisptr, item)
      return
    (<Linearizer*> self.thisptr).process_solution(<MeshFunction[double]*> sln.thisptr)
  def save_solution_vtk(self, PyMeshFunctionReal sln, char* filename, char* quantity_name, mode_3D = None, item = None, eps = None):
    if eps is not None:
      (<Linearizer*> self.thisptr).save_solution_vtk(<MeshFunction[double]*> sln.thisptr, filename, quantity_name, mode_3D, item, eps)
      return
    if item is not None:
      (<Linearizer*> self.thisptr).save_solution_vtk(<MeshFunction[double]*> sln.thisptr, filename, quantity_name, mode_3D, item)
      return
    if mode_3D is not None:
      (<Linearizer*> self.thisptr).save_solution_vtk(<MeshFunction[double]*> sln.thisptr, filename, quantity_name, mode_3D)
      return
    (<Linearizer*> self.thisptr).save_solution_vtk(<MeshFunction[double]*> sln.thisptr, filename, quantity_name)
  def set_displacement(self, PyMeshFunctionReal xdisp, PyMeshFunctionReal ydisp, dmult = None):
    if dmult is not None:
      (<Linearizer*> self.thisptr).set_displacement(<MeshFunction[double]*> xdisp.thisptr, <MeshFunction[double]*> ydisp.thisptr, dmult)
    else:
      (<Linearizer*> self.thisptr).set_displacement(<MeshFunction[double]*> xdisp.thisptr, <MeshFunction[double]*> ydisp.thisptr, dmult)
  def calc_vertices_aabb(self):
    """ returns [min_x, max_x, min_y, max_y] """
    cdef double min_x
    cdef double max_x
    cdef double min_y
    cdef double max_y
    (<Linearizer*> self.thisptr).calc_vertices_aabb(&min_x, &max_x, &min_y, &max_y)
    return [min_x, max_x, min_y, max_y]
  def get_num_vertices(self):
    return (<Linearizer*> self.thisptr).get_num_vertices()
  def get_vertices(self):
    cdef double3 * cr = (<Linearizer*> self.thisptr).get_vertices()
    cdef int i
    r = []
    for i in range((<Linearizer*> self.thisptr).get_num_vertices()):
      r.append([cr[i][0], cr[i][1], cr[i][2]]) 
    return r

class PyIdentificationMethod:
    timeAndNumber,onlyTime,onlyNumber=range(3)

cdef class PyContinuityReal:
  def  __cinit__(self, identification_method):
    if (type(self)!=PyContinuityReal):
      return
    self.thisptr= new Continuity[double](identification_method)

  def add_record(self, time=None, number=None):
    if (type(time)==int):
      number=time
      time=None
    if time and number:
      self.thisptr.add_record(time, number)
      return
    if time:
      self.thisptr.add_record(<double>time)
      return
    if number:
      self.thisptr.add_record(<unsigned int>number) 
      return
  def have_record_available(self):
    return self.thisptr.have_record_available()
  def get_last_record(self):
    cdef PyRecordReal r=PyRecordReal(0,init = False)
    r.thisptr=self.thisptr.get_last_record()
    return r
  def get_num(self):
    return self.thisptr.get_num()

cdef class PyRecordReal:
  def __cinit__(self,time, number=None, init=True):
    if not init:
      return
    if (type(self)!=PyRecordReal):
      return 
    if number:
      self.thisptr=new Continuity[double].Record(time, number)
    if (type(time)==int):
      self.thisptr=new Continuity[double].Record(<unsigned int>time)
    else:
      self.thisptr=new Continuity[double].Record(<double>time) 

  def save_meshes(self, meshes):
    cdef vector[Mesh *] cmeshes
    cdef PyMesh m
    for m in meshes:
      cmeshes.push_back(m.thisptr)
    self.thisptr.save_meshes(cmeshes)
  def save_mesh(self, PyMesh mesh):
    self.thisptr.save_mesh(mesh.thisptr)
  def save_spaces(self, spaces):
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal s
    for s in spaces:
      cspaces.push_back(s.thisptr)
    self.thisptr.save_spaces(cspaces)
  def save_space(self, PySpaceReal space):
    self.thisptr.save_space(space.thisptr)
  def save_solutions(self, solutions):
    cdef vector[pSolutionReal] csolutions
    cdef PySolutionReal s
    for s in solutions:
      csolutions.push_back(s.thisptr)
    self.thisptr.save_solutions(csolutions)
  def save_solution(self, PySolutionReal solution):
    self.thisptr.save_solution(solution.thisptr)
  def save_time_step_length(self, double time_step_length_to_save):
    self.thisptr.save_time_step_length(time_step_length_to_save)
  def save_error(self, double error):
    self.thisptr.save_error(error)

  def load_meshes(self, meshes):
    cdef vector[Mesh *] cmeshes
    cdef PyMesh m
    for m in meshes:
      cmeshes.push_back(m.thisptr)
    self.thisptr.load_meshes(cmeshes)
  def load_mesh(self, PyMesh mesh):
    self.thisptr.load_mesh(mesh.thisptr)
  def load_spaces(self, spaces, space_types, meshes, essential_bcs=None, shapeset=None):
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal s
    cdef vector[SpaceType] cspace_types
    cdef SpaceType st
    cdef vector[Mesh*] cmeshes
    cdef PyMesh m
    cdef vector[pEssentialBCsReal] cessential_bcs
    cdef PyEssentialBCsReal eb
    cdef vector[Shapeset*] cshapeset
    cdef PyShapeset ss

    for s in spaces:
      cspaces.push_back(s.thisptr)
    for st in space_types:
      cspace_types.push_back(st)
    for m in meshes:
      cmeshes.push_back(m.thisptr)

    if isinstance(essential_bcs[0],PyShapeset):
      shapeset=essential_bcs
      essential_bcs=None

    if essential_bcs:
      for eb in essential_bcs:
        cessential_bcs.push_back((<PyEssentialBCsReal> eb).thisptr)
    if shapeset:
      for ss in shapeset:
        cshapeset.push_back(ss.thisptr)

    if essential_bcs and shapeset:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cessential_bcs, cshapeset)
      return
    if essential_bcs:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cessential_bcs)
      return
    if shapeset:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cshapeset) 
      return
    self.thisptr.load_spaces(cspaces, cspace_types, cmeshes)

  def load_space(self, PySpaceReal space, space_type, PyMesh mesh, PyEssentialBCsReal essential_bcs=None, PyShapeset shapeset=None):
    if shapeset:
      self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr, essential_bcs.thisptr, shapeset.thisptr)
      return
    if essential_bcs:
      self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr, essential_bcs.thisptr)
      return
    self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr)

  def load_solutions(self, solutions, spaces):
    cdef vector[pSolutionReal] csolutions 
    cdef PySolutionReal s
    cdef vector[pSpaceReal] cspaces
    cdef PySpaceReal sp
    for s in solutions:
      csolutions.push_back(s.thisptr)
    for sp in spaces:
      cspaces.push_back(sp.thisptr)
    self.thisptr.load_solutions(csolutions, cspaces)
  def load_solution(self, PySolutionReal solution, PySpaceReal space):
    self.thisptr.load_solution(solution.thisptr, space.thisptr)
  def load_time_step_length(self):
    """function returns value instead of setting refernce"""
    cdef double time_step_length=0
    self.thisptr.load_time_step_length(time_step_length)
    return time_step_length
  def load_error(self):
    """function returns value instead of setting refernce"""
    cdef double error=0
    self.thisptr.load_error(error)
    return error
  def get_time(self):
    return self.thisptr.get_time()
  def get_number(self):
    return self.thisptr.get_number()

cdef class PyContinuityComplex:
  def  __cinit__(self, identification_method):
    if (type(self)!=PyContinuityComplex):
      return
    self.thisptr= new Continuity[cComplex[double]](<IdentificationMethodComplex>identification_method)

  def add_record(self, time=None, number=None):
    if (type(time)==int):
      number=time
      time=None
    if time and number:
      self.thisptr.add_record(time, number)
      return
    if time:
      self.thisptr.add_record(<double>time)
      return
    if number:
      self.thisptr.add_record(<unsigned int>number) 
      return
  def have_record_available(self):
    return self.thisptr.have_record_available()
  def get_last_record(self):
    cdef PyRecordComplex r=PyRecordComplex(0,init = False)
    r.thisptr=self.thisptr.get_last_record()
    return r
  def get_num(self):
    return self.thisptr.get_num()

cdef class PyRecordComplex:
  def __cinit__(self,time, number=None, init=True):
    if not init:
      return
    if (type(self)!=PyRecordComplex):
      return 
    if number:
      self.thisptr=new Continuity[cComplex[double]].Record(time, number)
    if (type(time)==int):
      self.thisptr=new Continuity[cComplex[double]].Record(<unsigned int>time)
    else:
      self.thisptr=new Continuity[cComplex[double]].Record(<double>time) 

  def save_meshes(self, meshes):
    cdef vector[Mesh *] cmeshes
    cdef PyMesh m
    for m in meshes:
      cmeshes.push_back(m.thisptr)
    self.thisptr.save_meshes(cmeshes)
  def save_mesh(self, PyMesh mesh):
    self.thisptr.save_mesh(mesh.thisptr)
  def save_spaces(self, spaces):
    cdef vector[pSpaceComplex] cspaces
    cdef PySpaceComplex s
    for s in spaces:
      cspaces.push_back(s.thisptr)
    self.thisptr.save_spaces(cspaces)
  def save_space(self, PySpaceComplex space):
    self.thisptr.save_space(space.thisptr)
  def save_solutions(self, solutions):
    cdef vector[pSolutionComplex] csolutions
    cdef PySolutionComplex s
    for s in solutions:
      csolutions.push_back(s.thisptr)
    self.thisptr.save_solutions(csolutions)
  def save_solution(self, PySolutionComplex solution):
    self.thisptr.save_solution(solution.thisptr)
  def save_time_step_length(self, double time_step_length_to_save):
    self.thisptr.save_time_step_length(time_step_length_to_save)
  def save_error(self, double error):
    self.thisptr.save_error(error)

  def load_meshes(self, meshes):
    cdef vector[Mesh *] cmeshes
    cdef PyMesh m
    for m in meshes:
      cmeshes.push_back(m.thisptr)
    self.thisptr.load_meshes(cmeshes)
  def load_mesh(self, PyMesh mesh):
    self.thisptr.load_mesh(mesh.thisptr)
  def load_spaces(self, spaces, space_types, meshes, essential_bcs=None, shapeset=None):
    cdef vector[pSpaceComplex] cspaces
    cdef PySpaceComplex s
    cdef vector[SpaceType] cspace_types
    cdef SpaceType st
    cdef vector[Mesh*] cmeshes
    cdef PyMesh m
    cdef vector[pEssentialBCsComplex] cessential_bcs
    cdef PyEssentialBCsComplex eb
    cdef vector[Shapeset*] cshapeset
    cdef PyShapeset ss

    for s in spaces:
      cspaces.push_back(s.thisptr)
    for st in space_types:
      cspace_types.push_back(st)
    for m in meshes:
      cmeshes.push_back(m.thisptr)

    if isinstance(essential_bcs[0],PyShapeset):
      shapeset=essential_bcs
      essential_bcs=None

    if essential_bcs:
      for eb in essential_bcs:
        cessential_bcs.push_back((<PyEssentialBCsComplex> eb).thisptr)
    if shapeset:
      for ss in shapeset:
        cshapeset.push_back(ss.thisptr)

    if essential_bcs and shapeset:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cessential_bcs, cshapeset)
      return
    if essential_bcs:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cessential_bcs)
      return
    if shapeset:
      self.thisptr.load_spaces(cspaces, cspace_types, cmeshes, cshapeset) 
      return
    self.thisptr.load_spaces(cspaces, cspace_types, cmeshes)

  def load_space(self, PySpaceComplex space, space_type, PyMesh mesh, PyEssentialBCsComplex essential_bcs=None, PyShapeset shapeset=None):
    if shapeset:
      self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr, essential_bcs.thisptr, shapeset.thisptr)
      return
    if essential_bcs:
      self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr, essential_bcs.thisptr)
      return
    self.thisptr.load_space(space.thisptr, space_type, mesh.thisptr)

  def load_solutions(self, solutions, spaces):
    cdef vector[pSolutionComplex] csolutions 
    cdef PySolutionComplex s
    cdef vector[pSpaceComplex] cspaces
    cdef PySpaceComplex sp
    for s in solutions:
      csolutions.push_back(s.thisptr)
    for sp in spaces:
      cspaces.push_back(sp.thisptr)
    self.thisptr.load_solutions(csolutions, cspaces)
  def load_solution(self, PySolutionComplex solution, PySpaceComplex space):
    self.thisptr.load_solution(solution.thisptr, space.thisptr)
  def load_time_step_length(self):
    """function returns value instead of setting refernce"""
    cdef double time_step_length=0
    self.thisptr.load_time_step_length(time_step_length)
    return time_step_length
  def load_error(self):
    """function returns value instead of setting refernce"""
    cdef double error=0
    self.thisptr.load_error(error)
    return error
  def get_time(self):
    return self.thisptr.get_time()
  def get_number(self):
    return self.thisptr.get_number()

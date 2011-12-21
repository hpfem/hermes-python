class PySolutionType:
    HERMES_UNDEF = -1
    HERMES_SLN = 0
    HERMES_EXACT = 1

cdef class PySolutionReal(PyMeshFunctionReal):
  def __cinit__(self, s = None, coeff_vec = None, init = True):
    cdef double * ccoeff_vec
    cdef int i
    cdef int ndofs
    if not init:
      return
    if type(self)!=PySolutionReal:
      return
    if coeff_vec is not None:
      if isinstance(coeff_vec, PyVectorReal):
        self.thisptr = <Transformable*> new Solution[double]((<PySpaceReal> s).thisptr, (<PyVectorReal> coeff_vec).thisptr)
      else:
        ndofs = (<PySpaceReal> s).thisptr.get_num_dofs()
        ccoeff_vec = <double*> newBuffer[double](ndofs)
        for i in range(ndofs):
          ccoeff_vec[i] = coeff_vec[i]
        self.thisptr = <Transformable*> new Solution[double]((<PySpaceReal> s).thisptr, ccoeff_vec)
        delBuffer[double](ccoeff_vec)
    else:
      if s is not None:
        self.thisptr = <Transformable*> new Solution[double]((<PyMesh> s).thisptr)
      else:
        self.thisptr = <Transformable*> new Solution[double]()

  def assign(self, PySolutionReal sln):
    (<Solution[double]*> self.thisptr).assign(<Solution[double]*> sln.thisptr)
  def copy(self, PySolutionReal sln):
    (<Solution[double]*> self.thisptr).copy(<Solution[double]*> sln.thisptr)
  def set_dirichlet_lift(self, PySpaceReal space, pss = None):
    if pss is not None:
      (<Solution[double]*> self.thisptr).set_dirichlet_lift(space.thisptr,<PrecalcShapeset*> (<PyPrecalcShapeset> pss).thisptr)
    else:
      (<Solution[double]*> self.thisptr).set_dirichlet_lift(space.thisptr)
  def save(self, filename):
    (<Solution[double]*> self.thisptr).save(filename)
  def save1D(self, x, y, num_points, filename = None):
    cdef double * cx
    cdef double * cy
    cx = <double*> newBuffer[double](num_points)
    cy = <double*> newBuffer[double](num_points)
    if filename is not None:
      (<Solution[double]*> self.thisptr).save1D(cx, cy, num_points, filename)
    else:
      (<Solution[double]*> self.thisptr).save1D(cx, cy, num_points)
    del x[:]
    del y[:]
    for i in range(num_points):
      x.append(cx[i])
      y.append(cy[i])
  def load(self, filename, PyMesh mesh):
    (<Solution[double]*> self.thisptr).load(filename, mesh.thisptr)
  def get_ref_value(self, PyElement e, double xi1, double xi2, component = None, item = None):
    if item is not None:
      return (<Solution[double]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2, component, item)
    if component is not None:
      return (<Solution[double]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2, component)
    return (<Solution[double]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2)
  def get_ref_value_transformed(self, PyElement e, double xi1, double xi2, int a, int b):
    return (<Solution[double]*> self.thisptr).get_ref_value_transformed(e.thisptr, xi1, xi2, a, b)
  def multiply(self, double coef):
    (<Solution[double]*> self.thisptr).multiply(coef)
  def get_type(self):
    return (<Solution[double]*> self.thisptr).get_type() 
  def get_space_type(self):
    return (<Solution[double]*> self.thisptr).get_space_type()
  def get_space_seq(self):
    return (<Solution[double]*> self.thisptr).get_space_seq()
  def get_space(self):
    cdef PySpaceReal r = PySpaceReal(init = False)
    r.thisptr = <Space[double]*> (<Solution[double]*> self.thisptr).get_space()	#TODO const
    return r
  def get_sln_vector(self):
    cdef double * cr = (<Solution[double]*> self.thisptr).get_sln_vector()
    cdef int i 
    cdef Space[double] * sp = <Space[double]*> (<Solution[double]*> self.thisptr).get_space()
    r = []
    for i in range(sp.get_num_dofs()):
      r.append(cr[i])

  def vector_to_solution(self, solution_vector, PySpaceReal space, PySolutionReal solution, pss = None, add_dir_lift = None):
    cdef double * csolution_vector
    cdef int i
    cdef int ndofs
    if not isinstance(pss,PyPrecalcShapeset):
      add_dir_lift = pss
      pss = None
    if isinstance(solution_vector,PyVectorReal):
      if add_dir_lift is not None:
        (<Solution[double]*> self.thisptr).vector_to_solution((<PyVectorReal> solution_vector).thisptr,space.thisptr, 
            <Solution[double]*> solution.thisptr, <bool> add_dir_lift)
      else:
        (<Solution[double]*> self.thisptr).vector_to_solution((<PyVectorReal> solution_vector).thisptr, space.thisptr, <Solution[double]*> solution.thisptr)
    else:
      ndofs = space.thisptr.get_num_dofs()
      csolution_vector = <double*> newBuffer[double](ndofs)
      for i in range(ndofs):
        csolution_vector[i] = solution_vector[i]

      if pss is not None:
        if add_dir_lift is not None:
          (<Solution[double]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[double]*> solution.thisptr, 
            <PrecalcShapeset*> (<PyPrecalcShapeset> pss).thisptr, <bool> add_dir_lift)
        else:
          (<Solution[double]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[double]*> solution.thisptr,
            <PrecalcShapeset*>  (<PyPrecalcShapeset> pss).thisptr)
      else:
        if add_dir_lift is not None:
          (<Solution[double]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[double]*> solution.thisptr, <bool> add_dir_lift)
        else:
          (<Solution[double]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[double]*> solution.thisptr)
      delBuffer[double](csolution_vector)

  def vector_to_solutions(self, solution_vector, spaces, solutions, pss, add_dir_lift):
    cdef double * csolution_vector
    cdef vector[pcSpaceReal] cspaces
    cdef PySpaceReal sp
    cdef vector[pSolutionReal] csolutions 
    cdef PySolutionReal sl
    cdef vector[bool] cadd_dir_lift
    cdef vector[PrecalcShapeset*] cpss
    cdef PyPrecalcShapeset ps
    cdef bool a
    cdef int i
    cdef int ndofs = 0
    if not isinstance(pss,PyPrecalcShapeset):
      add_dir_lift = pss
      pss = None

    for sp in spaces:
      cspaces.push_back(sp.thisptr)
      ndofs = ndofs + sp.thisptr.get_num_dofs()
    for sl in solutions:
      csolutions.push_back(<Solution[double]*> sl.thisptr)
    if add_dir_lift is not None:
      for a in add_dir_lift:
        cadd_dir_lift.push_back(a)
    if pss is not None:
      for ps in pss:
        cpss.push_back(<PrecalcShapeset*> ps.thisptr)

    if isinstance(solution_vector,PyVectorReal):
      if add_dir_lift is not None:
        (<Solution[double]*> self.thisptr).vector_to_solutions((<PyVectorReal> solution_vector).thisptr, cspaces, csolutions, cadd_dir_lift)
      else:
        (<Solution[double]*> self.thisptr).vector_to_solutions((<PyVectorReal> solution_vector).thisptr, cspaces, csolutions)
    else:
      csolution_vector = <double*> newBuffer[double](ndofs)
      for i in range(ndofs):
        csolution_vector[i] = solution_vector[i]

      if pss is not None:
        if add_dir_lift is not None:
          (<Solution[double]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions, cpss, cadd_dir_lift)
        else:
          (<Solution[double]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions, cpss)
      else:
        if add_dir_lift is not None:
          (<Solution[double]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions,  cadd_dir_lift)
        else:
          (<Solution[double]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions)
      delBuffer[double](csolution_vector)

  property own_mesh:
    def __set__(self, bool value):
      (<Solution[double]*> self.thisptr).own_mesh = value
    def __get__(self):
      return (<Solution[double]*> self.thisptr).own_mesh

cdef class PySolutionComplex(PyMeshFunctionComplex):
  def __cinit__(self, s = None, coeff_vec = None, init = True):
    cdef cComplex[double] * ccoeff_vec
    cdef int i
    cdef int ndofs
    if not init:
      return
    if type(self)!=PySolutionComplex:
      return
    if coeff_vec is not None:
      if isinstance(coeff_vec, PyVectorComplex):
        self.thisptr = <Transformable*> new Solution[cComplex[double]]((<PySpaceComplex> s).thisptr, (<PyVectorComplex> coeff_vec).thisptr)
      else:
        ndofs = (<PySpaceComplex> s).thisptr.get_num_dofs()
        ccoeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](ndofs)
        for i in range(ndofs):
          ccoeff_vec[i] = ccomplex(coeff_vec[i])
        self.thisptr = <Transformable*> new Solution[cComplex[double]]((<PySpaceComplex> s).thisptr, ccoeff_vec)
        delBuffer[cComplex[double]](ccoeff_vec)
    else:
      if s is not None:
        self.thisptr = <Transformable*> new Solution[cComplex[double]]((<PyMesh> s).thisptr)
      else:
        self.thisptr = <Transformable*> new Solution[cComplex[double]]()

  def assign(self, PySolutionComplex sln):
    (<Solution[cComplex[double]]*> self.thisptr).assign(<Solution[cComplex[double]]*> sln.thisptr)
  def copy(self, PySolutionComplex sln):
    (<Solution[cComplex[double]]*> self.thisptr).copy(<Solution[cComplex[double]]*> sln.thisptr)
  def set_dirichlet_lift(self, PySpaceComplex space, pss = None):
    if pss is not None:
      (<Solution[cComplex[double]]*> self.thisptr).set_dirichlet_lift(space.thisptr,<PrecalcShapeset*> (<PyPrecalcShapeset> pss).thisptr)
    else:
      (<Solution[cComplex[double]]*> self.thisptr).set_dirichlet_lift(space.thisptr)
  def save(self, filename):
    (<Solution[cComplex[double]]*> self.thisptr).save(filename)
  def save1D(self, x, y, num_points, filename = None):
    cdef double* cx
    cdef cComplex[double]* cy
    cx = <double*> newBuffer[double](num_points)
    cy = <cComplex[double]*> newBuffer[cComplex[double]](num_points)
    if filename is not None:
      (<Solution[cComplex[double]]*> self.thisptr).save1D(cx, cy, num_points, filename)
    else:
      (<Solution[cComplex[double]]*> self.thisptr).save1D(cx, cy, num_points)
    del x[:]
    del y[:]
    for i in range(num_points):
      x.append(cx[i])
      y.append(pcomplex(cy[i]))
  def load(self, filename, PyMesh mesh):
    (<Solution[cComplex[double]]*> self.thisptr).load(filename, mesh.thisptr)
  def get_ref_value(self, PyElement e, double xi1, double xi2, component = None, item = None):
    if item is not None:
      return pcomplex((<Solution[cComplex[double]]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2, component, item))
    if component is not None:
      return pcomplex((<Solution[cComplex[double]]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2, component))
    return pcomplex((<Solution[cComplex[double]]*> self.thisptr).get_ref_value(e.thisptr, xi1, xi2))
  def get_ref_value_transformed(self, PyElement e, double xi1, double xi2, int a, int b):
    return pcomplex((<Solution[cComplex[double]]*> self.thisptr).get_ref_value_transformed(e.thisptr, xi1, xi2, a, b))
  def multiply(self, coef):
    (<Solution[cComplex[double]]*> self.thisptr).multiply(ccomplex(coef))
  def get_type(self):
    return (<Solution[cComplex[double]]*> self.thisptr).get_type() 
  def get_space_type(self):
    return (<Solution[cComplex[double]]*> self.thisptr).get_space_type()
  def get_space_seq(self):
    return (<Solution[cComplex[double]]*> self.thisptr).get_space_seq()
  def get_space(self):
    cdef PySpaceComplex r = PySpaceComplex(init = False)
    r.thisptr = <Space[cComplex[double]]*> (<Solution[cComplex[double]]*> self.thisptr).get_space()	#TODO const
    return r
  def get_sln_vector(self):
    cdef cComplex[double] * cr = (<Solution[cComplex[double]]*> self.thisptr).get_sln_vector()
    cdef int i 
    cdef Space[cComplex[double]] * sp = <Space[cComplex[double]]*> (<Solution[cComplex[double]]*> self.thisptr).get_space()
    r = []
    for i in range(sp.get_num_dofs()):
      r.append(pcomplex(cr[i]))

  def vector_to_solution(self, solution_vector, PySpaceComplex space, PySolutionComplex solution, pss = None, add_dir_lift = None):
    cdef cComplex[double] * csolution_vector
    cdef int i
    cdef int ndofs
    if not isinstance(pss,PyPrecalcShapeset):
      add_dir_lift = pss
      pss = None
    if isinstance(solution_vector,PyVectorComplex):
      if add_dir_lift is not None:
        (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution((<PyVectorComplex> solution_vector).thisptr,space.thisptr, 
            <Solution[cComplex[double]]*> solution.thisptr, <bool> add_dir_lift)
      else:
        (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution((<PyVectorComplex> solution_vector).thisptr, space.thisptr, <Solution[cComplex[double]]*> solution.thisptr)
    else:
      ndofs = space.thisptr.get_num_dofs()
      csolution_vector = <cComplex[double]*> newBuffer[cComplex[double]](ndofs)
      for i in range(ndofs):
        csolution_vector[i] = ccomplex(solution_vector[i])

      if pss is not None:
        if add_dir_lift is not None:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[cComplex[double]]*> solution.thisptr, 
            <PrecalcShapeset*> (<PyPrecalcShapeset> pss).thisptr, <bool> add_dir_lift)
        else:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[cComplex[double]]*> solution.thisptr,
            <PrecalcShapeset*>  (<PyPrecalcShapeset> pss).thisptr)
      else:
        if add_dir_lift is not None:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[cComplex[double]]*> solution.thisptr, <bool> add_dir_lift)
        else:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solution(csolution_vector, space.thisptr, <Solution[cComplex[double]]*> solution.thisptr)
      delBuffer[cComplex[double]](csolution_vector)

  def vector_to_solutions(self, solution_vector, spaces, solutions, pss, add_dir_lift):
    cdef cComplex[double] * csolution_vector
    cdef vector[pcSpaceComplex] cspaces
    cdef PySpaceComplex sp
    cdef vector[pSolutionComplex] csolutions 
    cdef PySolutionComplex sl
    cdef vector[bool] cadd_dir_lift
    cdef vector[PrecalcShapeset*] cpss
    cdef PyPrecalcShapeset ps
    cdef bool a
    cdef int i
    cdef int ndofs = 0
    if not isinstance(pss,PyPrecalcShapeset):
      add_dir_lift = pss
      pss = None

    for sp in spaces:
      cspaces.push_back(sp.thisptr)
      ndofs = ndofs + sp.thisptr.get_num_dofs()
    for sl in solutions:
      csolutions.push_back(<Solution[cComplex[double]]*> sl.thisptr)
    if add_dir_lift is not None:
      for a in add_dir_lift:
        cadd_dir_lift.push_back(a)
    if pss is not None:
      for ps in pss:
        cpss.push_back(<PrecalcShapeset*> ps.thisptr)

    if isinstance(solution_vector,PyVectorComplex):
      if add_dir_lift is not None:
        (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions((<PyVectorComplex> solution_vector).thisptr, cspaces, csolutions, cadd_dir_lift)
      else:
        (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions((<PyVectorComplex> solution_vector).thisptr, cspaces, csolutions)
    else:
      csolution_vector = <cComplex[double]*> newBuffer[cComplex[double]](ndofs)
      for i in range(ndofs):
        csolution_vector[i] = ccomplex(solution_vector[i])

      if pss is not None:
        if add_dir_lift is not None:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions, cpss, cadd_dir_lift)
        else:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions, cpss)
      else:
        if add_dir_lift is not None:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions,  cadd_dir_lift)
        else:
          (<Solution[cComplex[double]]*> self.thisptr).vector_to_solutions(csolution_vector, cspaces, csolutions)
      delBuffer[cComplex[double]](csolution_vector)

  property own_mesh:
    def __set__(self, bool value):
      (<Solution[cComplex[double]]*> self.thisptr).own_mesh = value
    def __get__(self):
      return (<Solution[cComplex[double]]*> self.thisptr).own_mesh

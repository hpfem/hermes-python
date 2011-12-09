cdef class PyDiscreteProblemReal:
  def __cinit__(self, PyWeakFormReal wf, spaces, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemReal:
      return
    cdef vector[pcSpaceReal] cspaces
    if isinstance(spaces,list):
      for s in spaces:
        cspaces.push_back((<PySpaceReal> s).thisptr)
        
    self.thisptr = <DiscreteProblem[double]*> new DiscreteProblem[double](wf.thisptr, cspaces)
  
  def __cinit__(self, PyWeakFormReal wf, PySpaceReal space, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemReal:
      return
    self.thisptr = <DiscreteProblem[double]*> new DiscreteProblem[double](wf.thisptr, (<PySpaceReal> space).thisptr)
  
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemReal:
      return
    self.thisptr = <DiscreteProblem[double]*> new DiscreteProblem[double]()

  def assemble(self,PyMatrixReal mat, coeff_vec = None, PyVectorReal rhs = None, bool force_diagonal_blocks = True, bool add_dir_lift = True, PyTable block_weights = None):
    cdef double * c_coeff_vec
    if coeff_vec is not None:
      c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=coeff_vec[i]
      if rhs is not None:
        if block_weights is not None:
          self.thisptr.assemble(c_coeff_vec, <SparseMatrix[double]*>mat.thisptr, <Vector[double]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift, block_weights.thisptr)
        else:
          self.thisptr.assemble(c_coeff_vec, <SparseMatrix[double]*>mat.thisptr, <Vector[double]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift)
      else:
        self.thisptr.assemble(c_coeff_vec, <SparseMatrix[double]*>mat.thisptr, <Vector[double]*>(0), force_diagonal_blocks, add_dir_lift)
      for i in range(len(coeff_vec)):
        delDoubles(c_coeff_vec)
    else:
      if rhs is not None:
        if block_weights is not None:
          self.thisptr.assemble(<SparseMatrix[double]*>mat.thisptr, <Vector[double]*>rhs.thisptr, force_diagonal_blocks, block_weights.thisptr)
        else:
          self.thisptr.assemble(<SparseMatrix[double]*>mat.thisptr, <Vector[double]*>rhs.thisptr, force_diagonal_blocks)
      else:
        self.thisptr.assemble(<SparseMatrix[double]*>mat.thisptr, <Vector[double]*>(0), force_diagonal_blocks)
    return
    
  def assemble(self, PyVectorReal rhs, coeff_vec = None, bool force_diagonal_blocks = True, bool add_dir_lift = True, PyTable block_weights = None):
    cdef double * c_coeff_vec
    if coeff_vec is not None:
      c_coeff_vec = <double*> newBuffer[double](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=coeff_vec[i]
      if block_weights is not None:
        self.thisptr.assemble(c_coeff_vec, <Vector[double]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift, block_weights.thisptr)
      else:
        self.thisptr.assemble(c_coeff_vec, <Vector[double]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift)
      for i in range(len(coeff_vec)):
        delDoubles(c_coeff_vec)
    else:
      if block_weights is not None:
        self.thisptr.assemble(<Vector[double]*>rhs.thisptr, force_diagonal_blocks, block_weights.thisptr)
      else:
        self.thisptr.assemble(<Vector[double]*>rhs.thisptr, force_diagonal_blocks)
    return
    
    
cdef class PyDiscreteProblemComplex:
  def __cinit__(self, PyWeakFormComplex wf, spaces, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemComplex:
      return
    cdef vector[pcSpaceComplex] cspaces
    if isinstance(spaces,list):
      for s in spaces:
        cspaces.push_back((<PySpaceComplex> s).thisptr)
        
    self.thisptr = <DiscreteProblem[cComplex[double]]*> new DiscreteProblem[cComplex[double]](wf.thisptr, cspaces)
  
  def __cinit__(self, PyWeakFormComplex wf, PySpaceComplex space, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemReal:
      return
    self.thisptr = <DiscreteProblem[cComplex[double]]*> new DiscreteProblem[cComplex[double]](wf.thisptr, (<PySpaceComplex> space).thisptr)
  
  def __cinit__(self, init = True):
    if not init:
      return
    if type(self)!=PyDiscreteProblemComplex:
      return
    self.thisptr = <DiscreteProblem[cComplex[double]]*> new DiscreteProblem[cComplex[double]]()
    
  def assemble(self,PyMatrixComplex mat, coeff_vec = None, PyVectorComplex rhs = None, bool force_diagonal_blocks = True, bool add_dir_lift = True, PyTable block_weights = None):
    cdef cComplex[double] * c_coeff_vec
    if coeff_vec is not None:
      c_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=cComplex[double](coeff_vec[i].real,coeff_vec[i].imag)
      if rhs is not None:
        if block_weights is not None:
          self.thisptr.assemble(c_coeff_vec, <SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift, block_weights.thisptr)
        else:
          self.thisptr.assemble(c_coeff_vec, <SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift)
      else:
        self.thisptr.assemble(c_coeff_vec, <SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>(0), force_diagonal_blocks, add_dir_lift)
      for i in range(len(coeff_vec)):
        delComplexes(c_coeff_vec)
    else:
      if rhs is not None:
        if block_weights is not None:
          self.thisptr.assemble(<SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, block_weights.thisptr)
        else:
          self.thisptr.assemble(<SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks)
      else:
        self.thisptr.assemble(<SparseMatrix[cComplex[double]]*>mat.thisptr, <Vector[cComplex[double]]*>(0), force_diagonal_blocks)
    return
    
  def assemble(self,PyVectorComplex rhs, coeff_vec = None, bool force_diagonal_blocks = True, bool add_dir_lift = True, PyTable block_weights = None):
    cdef cComplex[double] * c_coeff_vec
    if coeff_vec is not None:
      c_coeff_vec = <cComplex[double]*> newBuffer[cComplex[double]](len(coeff_vec))
      for i in range(len(coeff_vec)):
        c_coeff_vec[i]=cComplex[double](coeff_vec[i].real,coeff_vec[i].imag)
      if block_weights is not None:
        self.thisptr.assemble(c_coeff_vec, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift, block_weights.thisptr)
      else:
        self.thisptr.assemble(c_coeff_vec, <Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, add_dir_lift)
      for i in range(len(coeff_vec)):
        delComplexes(c_coeff_vec)
    else:
      if block_weights is not None:
        self.thisptr.assemble(<Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks, block_weights.thisptr)
      else:
        self.thisptr.assemble(<Vector[cComplex[double]]*>rhs.thisptr, force_diagonal_blocks)
    return
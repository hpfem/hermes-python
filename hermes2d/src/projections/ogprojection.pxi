cdef class PyOGProjectionReal:
  def __cinit__(self,init = True):
    if not init:
      return
    if type(self)!=PyOGProjectionReal:
      return
    self.thisptr = new OGProjection[double]()

  def __dealloc__(self):
    del self.thisptr

  def project_global(self, space, source, target_vec, matrix_solver = None,  proj_norms = None, delete_old_mesh = None, newton_tol = None, newton_max_iter = None):
    cdef vector[pcSpaceReal] cspaces
    cdef vector[pMeshFunctionReal] csource_meshfns
    cdef vector[pSolutionReal] csource_slns
    cdef vector[pSolutionReal] ctarget_slns
    cdef double * ctarget_vec
    cdef vector[ProjNormType] cproj_norms
    if isinstance(space,list):
      dofs=0
      for s in space:
        cspaces.push_back((<PySpaceReal> s).thisptr)
        dofs += (<PySpaceReal> s).thisptr.get_num_dofs()
      if isinstance(source[0],PySolutionReal):
        for s in source:
          csource_slns.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
        if isinstance(target_vec[0],PySolutionReal):
          for s in source:
            ctarget_slns.push_back(<Solution[double]*> (<PySolutionReal> s).thisptr)
            if proj_norms is not None:
              for s in proj_norms:
                cproj_norms.push_back(s)
              if newton_max_iter is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh, <double> newton_tol, <int> newton_max_iter)
                return
              if newton_tol is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh, <double> newton_tol)
                return
              if delete_old_mesh is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh)
                return
              self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms)
            else:
              if matrix_solver is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver)
              else:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns)
        else:
          ctarget_vec = <double*> newBuffer[double](dofs)
          if newton_max_iter is not None:
            raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
          newton_max_iter = newton_tol
          newton_tol = delete_old_mesh
          if proj_norms is not None:
            for s in proj_norms:
              cproj_norms.push_back(s)
            if newton_max_iter is not None:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol, <int> newton_max_iter)
            else:
              if newton_tol is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol)
              else:
                  self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms)
          else:
            if matrix_solver is  not None:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver)
            else:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver)
          del target_vec[:]
          for i in range(dofs):
            target_vec.append(ctarget_vec[i])
          delBuffer[double](ctarget_vec)
      else:
        for s in source:
          csource_meshfns.push_back(<MeshFunction[double]*> (<PyMeshFunctionReal> s).thisptr)
        ctarget_vec = <double*> newBuffer[double](dofs)
        if newton_max_iter is not None:
          raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
        newton_max_iter = newton_tol
        newton_tol = delete_old_mesh
        if proj_norms is not None:
          for s in proj_norms:
            cproj_norms.push_back(s)
          if newton_max_iter is not None:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol, <int> newton_max_iter)
          else:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol)
        else:
          if matrix_solver is not None:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver)
          else:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec)
        for i in range(dofs):
          target_vec.append(ctarget_vec[i])
        delBuffer[double](ctarget_vec)
    else:
      dofs = (<PySpaceReal> space).thisptr.get_num_dofs()
      if isinstance(source,PyMatrixFormVolReal):
        if newton_tol is not None:
          raise TypeError('custom_projection is provided, function takes only 7 arguments')
        ctarget_vec = <double*> newBuffer[double](dofs)
        custom_projection_jacobian = source
        custom_projection_residual = target_vec        
        target_vec = matrix_solver
        newton_tol = proj_norms
        newton_max_iter = delete_old_mesh

        if newton_max_iter is not None:
          self.thisptr.project_global((<PySpaceReal> space).thisptr, <MatrixFormVol[double]*> (<PyMatrixFormVolReal> custom_projection_jacobian).thisptr, <VectorFormVol[double]*> (<PyVectorFormVolReal> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver,  <double> newton_tol, <int> newton_max_iter)
        else:
          if newton_tol is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <MatrixFormVol[double]*> (<PyMatrixFormVolReal> custom_projection_jacobian).thisptr, <VectorFormVol[double]*> (<PyVectorFormVolReal> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver,  <double> newton_tol)
          else:
            if matrix_solver is not None:
              self.thisptr.project_global((<PySpaceReal> space).thisptr, <MatrixFormVol[double]*> (<PyMatrixFormVolReal> custom_projection_jacobian).thisptr, <VectorFormVol[double]*> (<PyVectorFormVolReal> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver)
            else:
              self.thisptr.project_global((<PySpaceReal> space).thisptr, <MatrixFormVol[double]*> (<PyMatrixFormVolReal> custom_projection_jacobian).thisptr, <VectorFormVol[double]*> (<PyVectorFormVolReal> custom_projection_residual).thisptr, ctarget_vec)
        for i in range(dofs):
          target_vec.append(ctarget_vec[i])
        delBuffer[double](ctarget_vec)
      else:
        if newton_max_iter is not None:
          raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
        newton_max_iter = newton_tol
        newton_tol = delete_old_mesh
        if isinstance(source,PyMeshFunctionReal):
          for s in source:
            csource_meshfns.push_back(<MeshFunction[double]*> (<PyMeshFunctionReal> s).thisptr)
          ctarget_vec = <double*> newBuffer[double](dofs)
          if newton_max_iter is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol, <int> newton_max_iter)
          else:
            if newton_tol is not None:
              self.thisptr.project_global((<PySpaceReal> space).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol)
            else:
              if proj_norms is not None:
                self.thisptr.project_global((<PySpaceReal> space).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms)
              else:
                if matrix_solver is not None:
                  self.thisptr.project_global((<PySpaceReal> space).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver)
                else:
                  self.thisptr.project_global((<PySpaceReal> space).thisptr, <MeshFunction[double]*> (<PyMeshFunctionReal> source).thisptr, ctarget_vec)
          for i in range(dofs):
            target_vec.append(ctarget_vec[i])
          delBuffer[double](ctarget_vec)
        else:
          if newton_max_iter is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <Solution[double]*> (<PySolutionReal> source).thisptr, <Solution[double]*> (<PySolutionReal> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol, <int> newton_max_iter)
            return
          if newton_tol is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <Solution[double]*> (<PySolutionReal> source).thisptr, <Solution[double]*> (<PySolutionReal> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol)
            return
          if proj_norms is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <Solution[double]*> (<PySolutionReal> source).thisptr, <Solution[double]*> (<PySolutionReal> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms)
            return
          if matrix_solver is not None:
            self.thisptr.project_global((<PySpaceReal> space).thisptr, <Solution[double]*> (<PySolutionReal> source).thisptr, <Solution[double]*> (<PySolutionReal> target_vec).thisptr, <MatrixSolverType> matrix_solver)
            return
          self.thisptr.project_global((<PySpaceReal> space).thisptr, <Solution[double]*> (<PySolutionReal> source).thisptr, <Solution[double]*> (<PySolutionReal> target_vec).thisptr)


cdef class PyOGProjectionComplex:
  def __cinit__(self,init = True):
    if not init:
      return
    if type(self)!=PyOGProjectionComplex:
      return
    self.thisptr = new OGProjection[cComplex[double]]()

  def __dealloc__(self):
    del self.thisptr

  def project_global(self, space, source, target_vec, matrix_solver = None,  proj_norms = None, delete_old_mesh = None, newton_tol = None, newton_max_iter = None):
    cdef vector[pcSpaceComplex] cspaces
    cdef vector[pMeshFunctionComplex] csource_meshfns
    cdef vector[pSolutionComplex] csource_slns
    cdef vector[pSolutionComplex] ctarget_slns
    cdef cComplex[double] * ctarget_vec
    cdef vector[ProjNormType] cproj_norms
    if isinstance(space,list):
      dofs=0
      for s in space:
        cspaces.push_back((<PySpaceComplex> s).thisptr)
        dofs += (<PySpaceComplex> s).thisptr.get_num_dofs()
      if isinstance(source[0],PySolutionComplex):
        for s in source:
          csource_slns.push_back(<Solution[cComplex[double]]*> (<PySolutionComplex> s).thisptr)
        if isinstance(target_vec[0],PySolutionComplex):
          for s in source:
            ctarget_slns.push_back(<Solution[cComplex[double]]*> (<PySolutionComplex> s).thisptr)
            if proj_norms is not None:
              for s in proj_norms:
                cproj_norms.push_back(s)
              if newton_max_iter is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh, <double> newton_tol, <int> newton_max_iter)
                return
              if newton_tol is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh, <double> newton_tol)
                return
              if delete_old_mesh is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms, <bool> delete_old_mesh)
                return
              self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver, cproj_norms)
            else:
              if matrix_solver is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns, <MatrixSolverType> matrix_solver)
              else:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_slns)
        else:
          ctarget_vec = <cComplex[double]*> newBuffer[cComplex[double]](dofs)
          if newton_max_iter is not None:
            raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
          newton_max_iter = newton_tol
          newton_tol = delete_old_mesh
          if proj_norms is not None:
            for s in proj_norms:
              cproj_norms.push_back(s)
            if newton_max_iter is not None:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol, <int> newton_max_iter)
            else:
              if newton_tol is not None:
                self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol)
              else:
                  self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms)
          else:
            if matrix_solver is  not None:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver)
            else:
              self.thisptr.project_global(cspaces, csource_slns, ctarget_vec, <MatrixSolverType> matrix_solver)
          del target_vec[:]
          for i in range(dofs):
            target_vec.append(pcomplex(ctarget_vec[i]))
          delBuffer[cComplex[double]](ctarget_vec)
      else:
        for s in source:
          csource_meshfns.push_back(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> s).thisptr)
        ctarget_vec = <cComplex[double]*> newBuffer[cComplex[double]](dofs)
        if newton_max_iter is not None:
          raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
        newton_max_iter = newton_tol
        newton_tol = delete_old_mesh
        if proj_norms is not None:
          for s in proj_norms:
            cproj_norms.push_back(s)
          if newton_max_iter is not None:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol, <int> newton_max_iter)
          else:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver, cproj_norms, <double> newton_tol)
        else:
          if matrix_solver is not None:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec, <MatrixSolverType> matrix_solver)
          else:
            self.thisptr.project_global(cspaces, csource_meshfns, ctarget_vec)
        for i in range(dofs):
          target_vec.append(pcomplex(ctarget_vec[i]))
        delBuffer[cComplex[double]](ctarget_vec)
    else:
      dofs = (<PySpaceComplex> space).thisptr.get_num_dofs()
      if isinstance(source,PyMatrixFormVolComplex):
        if newton_tol is not None:
          raise TypeError('custom_projection is provided, function takes only 7 arguments')
        ctarget_vec = <cComplex[double]*> newBuffer[cComplex[double]](dofs)
        custom_projection_jacobian = source
        custom_projection_residual = target_vec        
        target_vec = matrix_solver
        newton_tol = proj_norms
        newton_max_iter = delete_old_mesh

        if newton_max_iter is not None:
          self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MatrixFormVol[cComplex[double]]*> (<PyMatrixFormVolComplex> custom_projection_jacobian).thisptr, <VectorFormVol[cComplex[double]]*> (<PyVectorFormVolComplex> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver,  <double> newton_tol, <int> newton_max_iter)
        else:
          if newton_tol is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MatrixFormVol[cComplex[double]]*> (<PyMatrixFormVolComplex> custom_projection_jacobian).thisptr, <VectorFormVol[cComplex[double]]*> (<PyVectorFormVolComplex> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver,  <double> newton_tol)
          else:
            if matrix_solver is not None:
              self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MatrixFormVol[cComplex[double]]*> (<PyMatrixFormVolComplex> custom_projection_jacobian).thisptr, <VectorFormVol[cComplex[double]]*> (<PyVectorFormVolComplex> custom_projection_residual).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver)
            else:
              self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MatrixFormVol[cComplex[double]]*> (<PyMatrixFormVolComplex> custom_projection_jacobian).thisptr, <VectorFormVol[cComplex[double]]*> (<PyVectorFormVolComplex> custom_projection_residual).thisptr, ctarget_vec)
        for i in range(dofs):
          target_vec.append(pcomplex(ctarget_vec[i]))
        delBuffer[cComplex[double]](ctarget_vec)
      else:
        if newton_max_iter is not None:
          raise TypeError('when target vector is list, function takes only 7 arguments (8 given)')
        newton_max_iter = newton_tol
        newton_tol = delete_old_mesh
        if isinstance(source,PyMeshFunctionComplex):
          for s in source:
            csource_meshfns.push_back(<MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> s).thisptr)
          ctarget_vec = <cComplex[double]*> newBuffer[cComplex[double]](dofs)
          if newton_max_iter is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol, <int> newton_max_iter)
          else:
            if newton_tol is not None:
              self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol)
            else:
              if proj_norms is not None:
                self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms)
              else:
                if matrix_solver is not None:
                  self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> source).thisptr, ctarget_vec, <MatrixSolverType> matrix_solver)
                else:
                  self.thisptr.project_global((<PySpaceComplex> space).thisptr, <MeshFunction[cComplex[double]]*> (<PyMeshFunctionComplex> source).thisptr, ctarget_vec)
          for i in range(dofs):
            target_vec.append(pcomplex(ctarget_vec[i]))
          delBuffer[cComplex[double]](ctarget_vec)
        else:
          if newton_max_iter is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> source).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol, <int> newton_max_iter)
            return
          if newton_tol is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> source).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms, <double> newton_tol)
            return
          if proj_norms is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> source).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> target_vec).thisptr, <MatrixSolverType> matrix_solver, <ProjNormType> proj_norms)
            return
          if matrix_solver is not None:
            self.thisptr.project_global((<PySpaceComplex> space).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> source).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> target_vec).thisptr, <MatrixSolverType> matrix_solver)
            return
          self.thisptr.project_global((<PySpaceComplex> space).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> source).thisptr, <Solution[cComplex[double]]*> (<PySolutionComplex> target_vec).thisptr)



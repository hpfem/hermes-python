cdef extern from "projection/ogprojection.h" namespace "Hermes::Hermes2D":
  cdef cppclass OGProjection[Scalar]:
    OGProjection()
    void project_global(Space[Scalar]* space, MatrixFormVol[Scalar]* custom_projection_jacobian, VectorFormVol[Scalar]* custom_projection_residual, Scalar* target_vec, MatrixSolverType matrix_solver,  double newton_tol, int newton_max_iter)
    void project_global(Space[Scalar]* space, MatrixFormVol[Scalar]* custom_projection_jacobian, VectorFormVol[Scalar]* custom_projection_residual, Scalar* target_vec, MatrixSolverType matrix_solver,  double newton_tol)
    void project_global(Space[Scalar]* space, MatrixFormVol[Scalar]* custom_projection_jacobian, VectorFormVol[Scalar]* custom_projection_residual, Scalar* target_vec, MatrixSolverType matrix_solver)
    void project_global(Space[Scalar]* space, MatrixFormVol[Scalar]* custom_projection_jacobian, VectorFormVol[Scalar]* custom_projection_residual, Scalar* target_vec)

    void project_global(Space[Scalar]* space, MeshFunction[Scalar]* source_meshfn, Scalar* target_vec, MatrixSolverType matrix_solver, ProjNormType proj_norm, double newton_tol, int newton_max_iter)
    void project_global(Space[Scalar]* space, MeshFunction[Scalar]* source_meshfn, Scalar* target_vec, MatrixSolverType matrix_solver, ProjNormType proj_norm, double newton_tol)
    void project_global(Space[Scalar]* space, MeshFunction[Scalar]* source_meshfn, Scalar* target_vec, MatrixSolverType matrix_solver, ProjNormType proj_norm)
    void project_global(Space[Scalar]* space, MeshFunction[Scalar]* source_meshfn, Scalar* target_vec, MatrixSolverType matrix_solver)
    void project_global(Space[Scalar]* space, MeshFunction[Scalar]* source_meshfn, Scalar* target_vec)

    void project_global(Space[Scalar]* space, Solution[Scalar]* source_sln, Solution[Scalar]* target_sln, MatrixSolverType matrix_solver, ProjNormType proj_norm, double newton_tol, int newton_max_iter)
    void project_global(Space[Scalar]* space, Solution[Scalar]* source_sln, Solution[Scalar]* target_sln, MatrixSolverType matrix_solver, ProjNormType proj_norm, double newton_tol)
    void project_global(Space[Scalar]* space, Solution[Scalar]* source_sln, Solution[Scalar]* target_sln, MatrixSolverType matrix_solver, ProjNormType proj_norm)
    void project_global(Space[Scalar]* space, Solution[Scalar]* source_sln, Solution[Scalar]* target_sln, MatrixSolverType matrix_solver)
    void project_global(Space[Scalar]* space, Solution[Scalar]* source_sln, Solution[Scalar]* target_sln)

    void project_global(vector[pSpace] spaces, vector[pMeshFunction] source_meshfns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, double newton_tol, int newton_max_iter)
    void project_global(vector[pSpace] spaces, vector[pMeshFunction] source_meshfns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, double newton_tol)
    void project_global(vector[pSpace] spaces, vector[pMeshFunction] source_meshfns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms)
    void project_global(vector[pSpace] spaces, vector[pMeshFunction] source_meshfns, Scalar* target_vec, MatrixSolverType matrix_solver)
    void project_global(vector[pSpace] spaces, vector[pMeshFunction] source_meshfns, Scalar* target_vec)

    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, double newton_tol, int newton_max_iter)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, double newton_tol)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, Scalar* target_vec, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, Scalar* target_vec, MatrixSolverType matrix_solver)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, Scalar* target_vec)

    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, bool delete_old_mesh, double newton_tol, int newton_max_iter)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, bool delete_old_mesh, double newton_tol)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms, bool delete_old_mesh)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns, MatrixSolverType matrix_solver, vector[ProjNormType] proj_norms)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns, MatrixSolverType matrix_solver)
    void project_global(vector[pSpace] spaces, vector[pSolution] source_slns, vector[pSolution] target_slns)

      

cdef extern from "function/solution.h" namespace "Hermes::Hermes2D":
  enum SolutionType:
    HERMES_UNDEF # -1
    HERMES_SLN # 0
    HERMES_EXACT # 1

  ctypedef void* pSolution "Solution<Scalar>*" #cython error override
  ctypedef void* pSolutionReal "Hermes::Hermes2D::Solution<double>*" #cython error override
  ctypedef void* pSolutionComplex "Hermes::Hermes2D::Solution<std::complex<double> >*" #cython error override
  cdef cppclass Solution[Scalar]:# public MeshFunction[Scalar]
    Solution()
    Solution(Mesh *mesh)
    Solution (Space[Scalar]* s, Vector[Scalar]* coeff_vec)
    Solution (Space[Scalar]* s, Scalar* coeff_vec)
    void assign(Solution* sln)
    void copy(Solution[Scalar]* sln)
    void set_dirichlet_lift(Space[Scalar]* space, PrecalcShapeset* pss)
    void set_dirichlet_lift(Space[Scalar]* space)
    void save(char* filename)
    void save1D(double* x, Scalar* y, int num_points, char* filename)
    void save1D(double* x, Scalar* y, int num_points)
    void load(char* filename, Mesh* mesh)
    Scalar get_ref_value(Element* e, double xi1, double xi2, int component, int item)
    Scalar get_ref_value(Element* e, double xi1, double xi2, int component)
    Scalar get_ref_value(Element* e, double xi1, double xi2)
    Scalar get_ref_value_transformed(Element* e, double xi1, double xi2, int a, int b)
    void multiply(Scalar coef)
    inline SolutionType get_type() 
    inline SpaceType get_space_type()
    int get_space_seq()
    Space[Scalar]* get_space()
    Scalar* get_sln_vector()
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift)
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution)
    void vector_to_solution(Vector[Scalar]* vec, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift)
    void vector_to_solution(Vector[Scalar]* vec, Space[Scalar]* space, Solution[Scalar]* solution)
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,PrecalcShapeset* pss, bool add_dir_lift)
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,PrecalcShapeset* pss)

    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces, vector[pSolution] solutions, vector[bool] add_dir_lift)
    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces, vector[pSolution] solutions)
    void vector_to_solutions(Vector[Scalar]* vec, vector[pSpace] spaces,vector[pSolution] solutions,vector[bool] add_dir_lift)
    void vector_to_solutions(Vector[Scalar]* vec, vector[pSpace] spaces,vector[pSolution] solutions)
    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces,vector[pSolution] solutions, vector[PrecalcShapeset*] pss,vector[bool] add_dir_lift)
    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces,vector[pSolution] solutions, vector[PrecalcShapeset*] pss)
    bool own_mesh


cdef extern from "function/solution.h" namespace "Hermes::Hermes2D":
  enum SolutionType:
    HERMES_UNDEF = -1
    HERMES_SLN = 0
    HERMES_EXACT = 1

  cdef cppclass Solution[Scalar]:# public MeshFunction[Scalar]
  #not implement function implemented in super class
    Solution()
    Solution(Mesh *mesh)
    Solution (Space[Scalar]* s, Vector[Scalar]* coeff_vec)
    Solution (Space[Scalar]* s, Scalar* coeff_vec)
    void assign(Solution* sln)
    void copy(Solution[Scalar]* sln)
    void set_dirichlet_lift(Space[Scalar]* space, PrecalcShapeset* pss)
   #void set_dirichlet_lift(Space[Scalar]* space, PrecalcShapeset* pss = NULL)
    void save(char* filename)
    void load(char* filename, Mesh* mesh)
    Scalar get_ref_value(Element* e, double xi1, double xi2, int component, int item)
    #Scalar get_ref_value(Element* e, double xi1, double xi2, int component = 0, int item = 0)
    Scalar get_ref_value_transformed(Element* e, double xi1, double xi2, int a, int b)
    Scalar get_pt_value(double x, double y, int item)
    #virtual Scalar get_pt_value(double x, double y, int item = H2D_FN_VAL_0)
    void multiply(Scalar coef)
    inline SolutionType get_type() 
    inline SpaceType get_space_type()
    int get_space_seq()
    Space[Scalar]* get_space()
    Scalar* get_sln_vector()
    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces,vector[pSolution] solutions,vector[bool] add_dir_lift)
    #static void vector_to_solutions(Scalar* solution_vector, vector[Space[Scalar] *] spaces,vector[Solution[Scalar]*] solutions,vector[bool] add_dir_lift = vector[bool]())
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift)
    #static void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift = true)
    void vector_to_solutions(Vector[Scalar]* vec, vector[pSpace] spaces,vector[pSolution] solutions,vector[bool] add_dir_lift)
    #static void vector_to_solutions(Vector[Scalar]* vec, vector[Space[Scalar] *] spaces,vector[Solution[Scalar]*] solutions,vector[bool] add_dir_lift = vector[bool]())
    void vector_to_solution(Vector[Scalar]* vec, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift)
    #static void vector_to_solution(Vector[Scalar]* vec, Space[Scalar]* space, Solution[Scalar]* solution,bool add_dir_lift = true)
    #static void vector_to_solutions(Scalar* solution_vector, Hermes::vector[Space[Scalar] *] spaces,Hermes::vector[Solution[Scalar]*] solutions, Hermes::vector[PrecalcShapeset *] pss,Hermes::vector[bool] add_dir_lift = Hermes::vector[bool]())
    void vector_to_solutions(Scalar* solution_vector, vector[pSpace] spaces,vector[pSolution] solutions, vector[PrecalcShapeset *] pss,vector[bool] add_dir_lift)
    void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,PrecalcShapeset* pss, bool add_dir_lift)
    #void vector_to_solution(Scalar* solution_vector, Space[Scalar]* space, Solution[Scalar]* solution,PrecalcShapeset* pss, bool add_dir_lift = true);
    bool own_mesh

cdef class PySolutionReal:
  cdef Solution[double]* thisptr

cdef class PySolutionComplex:
  cdef Solution[cComplex[double]]* thisptr

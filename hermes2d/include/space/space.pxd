cdef extern from "space/space.h" namespace "Hermes::Hermes2D":
  ctypedef void* pSpace "Space<Scalar>*" #cython error override
  ctypedef void* pSpaceReal "Hermes::Hermes2D::Space<double>*" #cython error override
  ctypedef void* pcSpaceReal "const Hermes::Hermes2D::Space<double>*" #cython error override
  ctypedef void* pSpaceComplex "Hermes::Hermes2D::Space<std::complex<double> >*" #cython error override
  ctypedef void* pcSpaceComplex "const Hermes::Hermes2D::Space<std::complex<double> >*" #cython error override
  cdef cppclass Space[Scalar]:
    Space(Mesh* mesh, Shapeset* shapeset, EssentialBCs[Scalar]* essential_bcs, Ord2 p_init)
    void set_element_order(int id, int order)
    void set_element_orders(int* elem_orders)
    int get_element_order(int id)
    void set_uniform_order(int order, string marker)
    void set_uniform_order(int order)
    void adjust_element_order(int order_change, int min_order)
    void adjust_element_order(int horizontal_order_change, int vertical_order_change, unsigned int horizontal_min_order, unsigned int vertical_min_order)
    void unrefine_all_mesh_elements(bool keep_initial_refinements)
    void unrefine_all_mesh_elements()
    void update_element_orders_after_refinement()
    void set_shapeset(Shapeset* shapeset)
    void copy_orders(Space[Scalar]* space,int inc)
    void copy_orders(Space[Scalar]* space)
    int get_num_dofs()
    int get_num_dofs(vector[pSpace] spaces)
    int get_num_dofs(Space[Scalar]* space)
    Mesh* get_mesh()
    void set_mesh(Mesh* mesh)
    void set_essential_bcs(EssentialBCs[Scalar]* essential_bcs)
    EssentialBCs[Scalar]* get_essential_bcs()
    void update_essential_bc_values()
    Scalar* get_bc_projection(SurfPos* surf_pos, int order)
    void get_element_assembly_list(Element* e, AsmList[Scalar]* al)
    Shapeset* get_shapeset()
    void set_element_order_internal(int id, int order)
    int assign_dofs(int first_dof, int stride)
    int assign_dofs(int first_dof)
    int assign_dofs()
    int assign_dofs(vector[pSpace] spaces)
    SpaceType get_type()
    vector[pSpace]* construct_refined_spaces(vector[pSpace]coarse, int order_increase, int refinement_type)
    vector[pSpace]* construct_refined_spaces(vector[pSpace]coarse, int order_increase)
    vector[pSpace]* construct_refined_spaces(vector[pSpace]coarse)
    Space[Scalar]* construct_refined_space(Space[Scalar]* coarse, int order_increase, int refinement_type)
    Space[Scalar]* construct_refined_space(Space[Scalar]* coarse, int order_increase)
    Space[Scalar]* construct_refined_space(Space[Scalar]* coarse)
    void update_essential_bc_values(vector[pSpace] spaces, double time)
    void update_essential_bc_values(Space[Scalar]* s, double time)
    bool save(char *filename)
    void load(char *filename, EssentialBCs[Scalar]* essential_bcs)
    void load(char *filename)

cdef class PySpaceReal:
  cdef Space[double]* thisptr

cdef class PySpaceComplex:
  cdef Space[cComplex[double]]* thisptr
  


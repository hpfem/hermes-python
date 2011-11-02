cdef extern from "mesh/mesh.h" namespace "Hermes::Hermes2D":
  cdef struct Node:
    int id
#    unsigned ref
#    unsigned type
#    unsigned bnd
#    unsigned used
#
#    double x
#    double y
#    int marker
#    Element* elem[2]
#
#    int p1
#    int p2
#    Node* next_hash
#    bool is_constrained_vertex()
#    #void ref_element(Element* e = NULL)
#    void ref_element(Element* e)
#    void unref_element(HashTable* ht, Element* e)
#    #void unref_element(HashTable* ht, Element* e = NULL)

  cdef cppclass Element:
    Element()
#    int id
#    unsigned active
#    unsigned used
#    Element* parent
#    bool visited
#    int get_num_surf()
#    double get_area()
#    double get_diameter()
#    
#    Node* vn[4]
#    Node* en[4]
#    Element* sons[4]
#
#    int marker
#    CurvMap* cm
#
#    int get_edge_orientation(int ie)
#    int  get_mode()

  cdef cppclass Mesh: 
    Mesh()
#    bool rescale(double x_ref, double y_ref)
#    void copy(Mesh* mesh)
#    void copy_base(Mesh* mesh)
#    void copy_converted(Mesh* mesh)
#    void create(int nv, double2* verts, int nt, int3* tris, string* tri_markers,
#                int nq, int4* quads, string* quad_markers, int nm, int2* mark, string* boundary_markers)
#    void free()
#    Element* get_element(int id)
#    int get_num_elements()
#    int get_num_base_elements()
#    int get_num_active_elements()
#    int get_max_element_id()
#    void refine_element_id(int id, int refinement)
#    #void refine_element_id(int id, int refinement = 0)
#    void refine_all_elements(int refinement, bool mark_as_initial)
#    #void refine_all_elements(int refinement = 0, bool mark_as_initial = false)
#    void refine_by_criterion(int (*criterion)(Element* e), int depth, bool mark_as_initial)
#    #void refine_by_criterion(int (*criterion)(Element* e), int depth, bool mark_as_initial = false)
#    void refine_towards_vertex(int vertex_id, int depth, bool mark_as_initial)
#    #void refine_towards_vertex(int vertex_id, int depth, bool mark_as_initial = false)
#    void refine_towards_boundary(vector[string] markers, int depth, bool aniso, bool mark_as_initial)
#    #void refine_towards_boundary(vector<string> markers, int depth, bool aniso = true, bool mark_as_initial = false)
#    void refine_towards_boundary(string marker, int depth, bool aniso, bool mark_as_initial)
#    #void refine_towards_boundary(std::string marker, int depth, bool aniso = true, bool mark_as_initial = false)
#    int* regularize(int n)
#    void unrefine_element_id(int id)
#    void unrefine_all_elements(bool keep_initial_refinements)
#    #void unrefine_all_elements(bool keep_initial_refinements = true)
#    Element* get_element_fast(int id)
#    unsigned get_seq()
#    void set_seq(unsigned seq)
#    void convert_triangles_to_quads()

cdef class PyMesh:
  cdef Mesh* thisptr

cdef class PyElement:
  cdef Element* thisptr


cdef class PyNode:
  def __cinit(self,init=True):
    if not init:
      return
    if (type(self)!=PyNode):
      return
    self.thisptr=<Node*> newBuffer(sizeof(Node))

  property id:
    def __set__(self, int value):
      self.thisptr.id = value
    def __get__(self):
      return self.thisptr.id
  property ref:
    def __set__(self, unsigned value):
      self.thisptr.ref=value
    def __get__(self):
      return self.thisptr.ref
  property type:
    def __set__(self, unsigned value):
      self.thisptr.type=value
    def __get__(self):
      return self.thisptr.type
  property bnd:
    def __set__(self, unsigned value):
      self.thisptr.bnd=value
    def __get__(self):
      return self.thisptr.bnd
  property used:
    def __set__(self, unsigned value):
      self.thisptr.used=value
    def __get__(self):
      return self.thisptr.used
  property x:
    def __set__(self, double value):
      self.thisptr.x=value
    def __get__(self):
      return self.thisptr.x
  property y:
    def __set__(self, double value):
      self.thisptr.y=value
    def __get__(self):
      return self.thisptr.y

  property marker:
    def __set__(self, int value):
      self.thisptr.marker=value
    def __get__(self):
      return self.thisptr.marker
  
  property elem:
    def __set__(self, value):
      self.thisptr.elem[0]=(<PyElement> value[0]).thisptr
      self.thisptr.elem[1]=(<PyElement> value[1]).thisptr
    def __get__(self):
      cdef PyElement e1=PyElement(init=False)
      cdef PyElement e2=PyElement(init=False)
      e1.thisptr=self.thisptr.elem[0]
      e2.thisptr=self.thisptr.elem[1]
      return [e1, e2]

  property p1:
    def __set__(self, int value):
      self.thisptr.p1=value
    def __get__(self):
      return self.thisptr.p1
  property p2:
    def __set__(self, int value):
      self.thisptr.p2=value
    def __get__(self):
      return self.thisptr.p2

  property next_hash:
    def __set__(self,PyNode value):
      self.thisptr.next_hash=value.thisptr
    def __get__(self):
      cdef PyNode n = PyNode(init=False)
      n.thisptr=self.thisptr.next_hash
      return n
  def is_constrained_vertex(self):
    return self.thisptr.is_constrained_vertex()
  def ref_element(self, e=None):
    if e:
      self.thisptr.ref_element((<PyElement> e).thisptr)
    else:
      self.thisptr.ref_element(NULL)

  def unref_element(self, PyHashTable ht, e=None):
    if e:
      self.thisptr.unref_element(ht.thisptr, (<PyElement> e).thisptr)
    else:
      self.thisptr.unref_element(ht.thisptr, NULL)

#  cdef cppclass Element:
#    Element()
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
#
#  cdef cppclass Mesh: 
#    Mesh()
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
#    void refine_element_id(int id)
#    void refine_all_elements(int refinement, bool mark_as_initial)
#    void refine_all_elements()
#    void refine_by_criterion(int (*criterion)(Element* e), int depth, bool mark_as_initial)
#    void refine_by_criterion(int (*criterion)(Element* e), int depth)
#    void refine_towards_vertex(int vertex_id, int depth, bool mark_as_initial)
#    void refine_towards_vertex(int vertex_id, int depth)
#    void refine_towards_boundary(vector[string] markers, int depth, bool aniso, bool mark_as_initial)
#    void refine_towards_boundary(vector[string] markers, int depth, bool aniso)
#    void refine_towards_boundary(vector[string] markers, int depth)
#    void refine_towards_boundary(string marker, int depth, bool aniso, bool mark_as_initial)
#    void refine_towards_boundary(string marker, int depth, bool aniso)
#    void refine_towards_boundary(string marker, int depth)
#    int* regularize(int n)
#    void unrefine_element_id(int id)
#    void unrefine_all_elements(bool keep_initial_refinements)
#    void unrefine_all_elements()
#    Element* get_element_fast(int id)
#    unsigned get_seq()
#    void set_seq(unsigned seq)
#    void convert_triangles_to_quads()


cdef class PyNode:
  def __cinit__(self,init=True):
    if not init:
      return
    if (type(self)!=PyNode):
      return
    self.thisptr=<Node*> newBuffer[Node](1)

  def __dealloc__(self):
    delBuffer[Node](self.thisptr)

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

cdef class PyElement:
  def __cinit__(self,init=True):
    if not init:
      return
    if (type(self)!=PyElement):
      return
    self.thisptr=new Element()
  property id:
    def __set__(self, int value):
      self.thisptr.id = value
    def __get__(self):
      return self.thisptr.id
  property active:
    def __set__(self, int value):
      self.thisptr.active = value
    def __get__(self):
      return self.thisptr.active
  property used:
    def __set__(self, int value):
      self.thisptr.used = value
    def __get__(self):
      return self.thisptr.used
  property parent:
    def __set__(self, PyElement value):
      self.thisptr.parent = value.thisptr
    def __get__(self):
      cdef PyElement e = PyElement(init=False)
      e.thisptr = self.thisptr.parent
      return e

  property visited:
    def __set__(self, int value):
      self.thisptr.visited = value
    def __get__(self):
      return self.thisptr.visited

  def get_num_surf(self):
    return self.thisptr.get_num_surf()
  def get_area(self):
    return self.thisptr.get_area()
  def get_diameter(self):
    return self.thisptr.get_diameter()
  
  property vn:
    def __set__(self, value):
      cdef int i
      for i in range(4):
        self.thisptr.vn[i]=(<PyNode> value[i]).thisptr
    def __get__(self):
      cdef int i
      nn=range(4)
      for i in range(4):
        nn[i] = PyNode(init=False)
        (<PyNode> nn[i]).thisptr=self.thisptr.vn[i]
      return nn

  property en:
    def __set__(self, value):
      cdef int i
      for i in range(4):
        self.thisptr.en[i]=(<PyNode> value[i]).thisptr
    def __get__(self):
      cdef int i
      nn=range(4)
      for i in range(4):
        nn[i] = PyNode(init=False)
        (<PyNode> nn[i]).thisptr=self.thisptr.en[i]
      return nn

  property sons:
    def __set__(self, value):
      cdef int i
      for i in range(4):
        self.thisptr.sons[i]=(<PyElement> value[i]).thisptr
    def __get__(self):
      cdef int i
      nn=range(4)
      for i in range(4):
        nn[i] = PyElement(init=False)
        (<PyElement> nn[i]).thisptr=self.thisptr.sons[i]
      return nn

  property marker:
    def __set__(self, int value):
      self.thisptr.marker = value
    def __get__(self):
      return self.thisptr.marker

  property cm:
    def __set__(self, PyCurvMap value):
      self.thisptr.cm = value.thisptr
    def __get__(self):
      cdef PyCurvMap c = PyCurvMap(init=False)
      c.thisptr = self.thisptr.cm
      return c

  def get_edge_orientation(self, int ie):
    return self.thisptr.get_edge_orientation(ie)
  def  get_mode(self):
    return self.thisptr.get_mode()

cdef class PyMesh: 
  def __cinit__(self,init=True):
    if not init:
      return
    if (type(self)!=PyMesh):
      return
    self.thisptr=new Mesh()

  def rescale(self, double x_ref, double y_ref):
    return self.thisptr.rescale(x_ref, y_ref)
  def copy(self, PyMesh mesh):
    self.thisptr.copy(mesh.thisptr)
  def copy_base(self, PyMesh mesh):
    self.thisptr.copy_base(mesh.thisptr)
  def copy_converted(self, PyMesh mesh):
    self.thisptr.copy_converted(mesh.thisptr)
  def create(self, int nv, verts, int nt, tris, tri_markers,
      int nq, quads, quad_markers, int nm, mark, boundary_markers):
    cdef double2 * cverts =<double2*> newBuffer[double2](len(verts))
    cdef int3 * ctris = <int3*> newBuffer[int3](len(tris))
    cdef string * ctri_markers = <string*> newBuffer[string](len(tri_markers))
    cdef int4 * cquads = <int4*> newBuffer[int4](len(quads))
    cdef string * cquad_markers = <string*> newBuffer[string](len(quad_markers))
    cdef int2 * cmark = <int2*> newBuffer[int2](len(mark))
    cdef string * cboundary_markers = <string*> newBuffer[string](len(boundary_markers))
    cdef string cs
    cdef int i

    for i in range(len(verts)):
      cverts[i][0]=verts[i][0]
      cverts[i][1]=verts[i][1]
    for i in range(len(tris)):
      ctris[i][0]=tris[i][0]
      ctris[i][1]=tris[i][1]
      ctris[i][2]=tris[i][2]
    for i in range(len(tri_markers)):
      cs.assign(<char*>tri_markers[i])
      ctri_markers[i]=cs
    for i in range(len(quads)):
      cquads[i][0]=quads[i][0]
      cquads[i][1]=quads[i][1]
      cquads[i][2]=quads[i][2]
      cquads[i][3]=quads[i][3]
    for i in range(len(quad_markers)):
      cs.assign(<char*>quad_markers[i])
      cquad_markers[i]=cs
    for i in range(len(mark)):
      cmark[i][0]=mark[i][0]
      cmark[i][1]=mark[i][1]
    for i in range(len(boundary_markers)):
      cs.assign(<char*>boundary_markers[i])
      cboundary_markers[i]=cs

    self.thisptr.create(nv, cverts, nt, ctris, ctri_markers, nq, cquads, cquad_markers, nm, cmark, cboundary_markers)
    delBuffer[double2](cverts)    
    delBuffer[int3](ctris)    
    delBuffer[string](ctri_markers)    
    delBuffer[int4](cquads)    
    delBuffer[string](cquad_markers)    
    delBuffer[int2](cmark)    
    delBuffer[string](cboundary_markers)    
  def free(self):
    self.thisptr.free()
  def get_element(self, int id):
    cdef PyElement e = PyElement(init=False)
    e.thisptr = self.thisptr.get_element(id)
    return e
  def get_num_elements(self):
    return self.thisptr.get_num_elements()
  def get_num_base_elements(self):
    return self.thisptr.get_num_base_elements()
  def get_num_active_elements(self):
    return self.thisptr.get_num_active_elements()
  def get_max_element_id(self):
    return self.thisptr.get_max_element_id()
  def refine_element_id(self, int id, int refinement):
    self.thisptr.refine_element_id(id, refinement)
    self.thisptr.refine_element_id(id)
  def refine_all_elements(self, refinement = None,  mark_as_initial = None):
    if mark_as_initial is not None:
      self.thisptr.refine_all_elements(refinement, mark_as_initial)
      return
    if refinement is not None:
      self.thisptr.refine_all_elements(refinement)
      return
    self.thisptr.refine_all_elements()
  def refine_by_criterion(self, criterion, int depth, mark_as_initial=None):
  #def refine_by_criterion(self, int (*criterion)(Element* e), int depth, bool mark_as_initial):
    criter_function=criterion
    if (mark_as_initial!=None):
      self.thisptr.refine_by_criterion(criter, depth, mark_as_initial)
    else:
      self.thisptr.refine_by_criterion(criter, depth)
  def refine_towards_vertex(self, int vertex_id, int depth, mark_as_initial=None):
    if (mark_as_initial!=None):
      self.thisptr.refine_towards_vertex(vertex_id, depth, mark_as_initial)
    else:
      self.thisptr.refine_towards_vertex(vertex_id, depth)
  def refine_towards_boundary(self, markers, int depth, aniso=None, mark_as_initial=None):
    cdef vector[string] cmarkers
    cdef string cm
    if isinstance(markers,list):
      for m in markers:
        cm.assign(<char*>m)
        cmarkers.push_back(cm)
      if mark_as_initial!=None:
        self.thisptr.refine_towards_boundary(cmarkers, depth, <bool> aniso, <bool> mark_as_initial)
        return
      if aniso!=None:
        self.thisptr.refine_towards_boundary(cmarkers, depth, <bool> aniso)
      self.thisptr.refine_towards_boundary(cmarkers, depth)
    else:
      cm.assign(<char*> markers)
      if mark_as_initial!=None:
        self.thisptr.refine_towards_boundary(cm, depth, <bool> aniso, <bool> mark_as_initial)
        return
      if aniso!=None:
        self.thisptr.refine_towards_boundary(cm, depth, <bool> aniso)
      self.thisptr.refine_towards_boundary(cm, depth)
  def regularize(self, int n):
    cdef int* ib = self.thisptr.regularize(n)
    cdef int i
    out=[]
    for i in range(2*self.thisptr.get_max_element_id()):
      out.append(ib[i])
    delBuffer[int](ib)
    return out

  def unrefine_element_id(self, int id):
    self.thisptr.unrefine_element_id(id)
  def unrefine_all_elements(self, bool keep_initial_refinements):
    self.thisptr.unrefine_all_elements(keep_initial_refinements)
  def unrefine_all_elements(self):
    self.thisptr.unrefine_all_elements()
  def get_element_fast(self, id):
    cdef PyElement e = PyElement(init=False)
    e.thisptr = self.thisptr.get_element_fast(id)
    return e
  def get_seq(self):
    return self.thisptr.get_seq()
  def set_seq(self, seq):
    self.thisptr.set_seq(seq)
  def convert_triangles_to_quads(self):
    self.thisptr.convert_triangles_to_quads()

cdef int (*criter_function)(PyElement)

cdef int criter(Element *e):
  cdef PyElement pe= PyElement(init=False)
  pe.thisptr = e
  return criter_function(pe)

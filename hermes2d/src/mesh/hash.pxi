cdef class PyHashTable:
  def get_node(self, int id):
    cdef PyNode r = PyNode(init = False)
    r.thisptr = self.thisptr.get_node(id)
    return r
  def get_num_nodes(self):
    return self.thisptr.get_num_nodes()
  def get_max_node_id(self):
    return self.thisptr.get_max_node_id()

cdef extern from "mesh/hash.h" namespace "Hermes::Hermes2D":
  cdef cppclass HashTable:
    Node* get_node(int id)
    int get_num_nodes()
    int get_max_node_id()

cdef class PyHashTable:
  cdef HashTable* thisptr

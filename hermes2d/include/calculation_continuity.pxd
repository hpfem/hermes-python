cdef extern from "calculation_continuity.h" namespace "Hermes::Hermes2D":
  enum IdentificationMethod "Hermes::Hermes2D::Continuity<double>::IdentificationMethod":
    timeAndNumber
    onlyTime
    onlyNumber
  cdef cppclass Continuity[Scalar]:
    Continuity(IdentificationMethod identification_method)
    cppclass Record:
      Record(double time, unsigned int number)
      Record(double time)
      Record(unsigned int number)
      void save_meshes(vector[Mesh*] meshes)
      void save_mesh(Mesh* mesh)
      void save_spaces(vector[pSpace] spaces)
      void save_space(Space[Scalar]* space)
      void save_solutions(vector[pSolution] solutions)
      void save_solution(Solution[Scalar]* solution)
      void save_time_step_length(double time_step_length_to_save)
      void save_error(double error)
      void load_meshes(vector[Mesh*] meshes)
      void load_mesh(Mesh* mesh)
      void load_spaces(vector[pSpace] spaces, vector[SpaceType] space_types, vector[Mesh*] meshes, vector[pEssentialBCs] essential_bcs, vector[Shapeset*] shapeset)
      void load_spaces(vector[pSpace] spaces, vector[SpaceType] space_types, vector[Mesh*] meshes, vector[pEssentialBCs] essential_bcs)
      void load_spaces(vector[pSpace] spaces, vector[SpaceType] space_types, vector[Mesh*] meshes, vector[Shapeset*] shapeset) 
      void load_spaces(vector[pSpace] spaces, vector[SpaceType] space_types, vector[Mesh*] meshes)
      void load_space(Space[Scalar]* space, SpaceType space_type, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs, Shapeset* shapeset)
      void load_space(Space[Scalar]* space, SpaceType space_type, Mesh* mesh, EssentialBCs[Scalar]* essential_bcs)
      void load_space(Space[Scalar]* space, SpaceType space_type, Mesh* mesh)
      void load_solutions(vector[pSolution] solutions, vector[pSpace] spaces)
      void load_solution(Solution[Scalar]* solution, Space[Scalar]* mesh)
      void load_time_step_length(double & time_step_length)
      void load_error(double & error)
      double get_time()
      unsigned int get_number()

    void add_record(double time, unsigned int number)
    void add_record(double time)
    void add_record(unsigned int number)
    bool have_record_available()
    Record* get_last_record()
    int get_num()

cdef class PyContinuityReal:
  cdef Continuity[double]* thisptr
cdef class PyContinuityComplex:
  cdef Continuity[cComplex[double]]* thisptr
cdef class PyRecordReal:
  cdef Continuity[double].Record* thisptr
cdef class PyRecordComplex:
  cdef Continuity[cComplex[double]].Record* thisptr

cdef extern from "views/linearizer.h" namespace "Hermes::Hermes2D::Views":
  cdef cppclass Linearizer : #public LinearizerBase
    Linearizer()
    void process_solution(MeshFunction[double]* sln, int item, double eps) except +translateException
    void process_solution(MeshFunction[double]* sln, int item) except +translateException
    void process_solution(MeshFunction[double]* sln) except +translateException
    void save_solution_vtk(MeshFunction[double]* sln, char* filename, char* quantity_name, bool mode_3D, int item, double eps) except +translateException
    void save_solution_vtk(MeshFunction[double]* sln, char* filename, char* quantity_name, bool mode_3D, int item) except +translateException
    void save_solution_vtk(MeshFunction[double]* sln, char* filename, char* quantity_name, bool mode_3D) except +translateException
    void save_solution_vtk(MeshFunction[double]* sln, char* filename, char* quantity_name) except +translateException
    string save_solution_vtk_to_stream(MeshFunction[double]* sln, char* quantity_name, bool mode_3D, int item, double eps) except +translateException
    string save_solution_vtk_to_stream(MeshFunction[double]* sln, char* quantity_name, bool mode_3D, int item) except +translateException
    string save_solution_vtk_to_stream(MeshFunction[double]* sln, char* quantity_name, bool mode_3D) except +translateException
    string save_solution_vtk_to_stream(MeshFunction[double]* sln, char* quantity_name) except +translateException
    void set_displacement(MeshFunction[double]* xdisp, MeshFunction[double]* ydisp, double dmult)
    void set_displacement(MeshFunction[double]* xdisp, MeshFunction[double]* ydisp)
    void calc_vertices_aabb(double* min_x, double* max_x, double* min_y, double* max_y)
    int get_num_vertices()
    double3* get_vertices()

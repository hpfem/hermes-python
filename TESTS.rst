=============================
Testing of Hermes wrappers
=============================

Tests are located in
--------------------

- /hermes_common/test.py
 - algebraic operations
 - responsible of testing
  - create_matrix() global function
  - create_vector() global function
  - matrix_solver_type global enum
  - Matrix(SparseMatrix) class
  - Vector class
  - LinearSolver class
 - needed to add
  - **complex numbers**


- /hermes2d/tests/mesh/test.py
 - mesh and subdomains handling, loading, saving, displaying
 - responsible of testing
  - Mesh class
  - MeshReaderH2DXML class
  - MeshView class
 - needed to add


- /hermes2d/tests/space/test.py
 - space generation, order setting, boundary condition setting, displaying
 - responsible of testing
  - Space (SpaceH1, SpaceL2, SpaceHcurl, SpaceHdiv) class
  - EssentialBoundaryCondition, EssentialBCs classes
  - OrderView class
 - needed to add
  - **All types and custom sub-types of EssentialBoundaryCondition**
  - **BaseView**
  - **save / load via Continuity**


- /hermes2d/tests/function/test.py
 - creating, setting, and displaying of (mesh) functions
 - responsible of testing
  - Solution, ConstantSolution, ExactSolution classes and all related classes
  - ScalarView class
 - needed to add
  - **all the related classes**
  - **VectorView**
  - **save / load via Continuity**

=============================
Testing of Hermes wrappers
=============================

Tests are located in:
- /hermes_common/test.py
 algebraic operations
 responsible of testing
 - create_matrix() global function
 - create_vector() global function
 - matrix_solver_type global enum
 - Matrix(SparseMatrix) class
 - Vector class
 - LinearSolver class
 needed to add
 - ** complex numbers **

- /hermes2d/tests/mesh/test.py
 - mesh and subdomains handling, loading, saving, displaying
 - responsible of testing
  - Mesh class
  - MeshReaderH2DXML class
  - MeshView class
 - needed to add

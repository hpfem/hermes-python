cdef extern from "discrete_problem.h" namespace "Hermes::Hermes2D":
  ctypedef void* pDiscreteProblem "DiscreteProblem<Scalar>*" #cython error override
  ctypedef void* pDiscreteProblemReal "DiscreteProblem<double>*" #cython error override
  ctypedef void* pDiscreteProblemComplex "DiscreteProblem<std::complex<double>>*" #cython error override
  cdef cppclass DiscreteProblem[Scalar]:
    DiscreteProblem(WeakForm[Scalar]* wf, vector[pSpace] spaces)
    DiscreteProblem(WeakForm[Scalar]* wf, Space[Scalar]* space)
    DiscreteProblem()
      
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights)
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift)
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks)
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs)
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat)
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights)
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift)
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks)
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs)
    
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights)
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift)
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks)
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs)
    void assemble(SparseMatrix[Scalar]* mat)
    void assemble(Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights)
    void assemble(Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift)
    void assemble(Vector[Scalar]* rhs, bool force_diagonal_blocks)
    void assemble(Vector[Scalar]* rhs)

    void invalidate_matrix()

    void set_fvm()
      
cdef class PyDiscreteProblemReal:
  cdef DiscreteProblem[double]* thisptr

cdef class PyDiscreteProblemComplex:
  cdef DiscreteProblem[cComplex[double]]* thisptr
  


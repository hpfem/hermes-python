cdef extern from "discrete_problem.h" namespace "Hermes::Hermes2D":
  ctypedef void* pDiscreteProblem "DiscreteProblem<Scalar>*" #cython error override
  ctypedef void* pDiscreteProblemReal "DiscreteProblem<double>*" #cython error override
  ctypedef void* pDiscreteProblemComplex "DiscreteProblem<std::complex<double>>*" #cython error override
  cdef cppclass DiscreteProblem[Scalar]:
    DiscreteProblem(WeakForm[Scalar]* wf, vector[pSpace] spaces)
    DiscreteProblem(WeakForm[Scalar]* wf, Space[Scalar]* space)
    DiscreteProblem()
      
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights) except +translateException
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift) except +translateException
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks) except +translateException
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs) except +translateException
    void assemble(Scalar* coeff_vec, SparseMatrix[Scalar]* mat) except +translateException
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift, Table* block_weights) except +translateException
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks, bool add_dir_lift) except +translateException
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs, bool force_diagonal_blocks) except +translateException
    void assemble(Scalar* coeff_vec, Vector[Scalar]* rhs) except +translateException
    
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks, Table* block_weights) except +translateException
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs, bool force_diagonal_blocks) except +translateException
    void assemble(SparseMatrix[Scalar]* mat, Vector[Scalar]* rhs) except +translateException
    void assemble(SparseMatrix[Scalar]* mat) except +translateException
    void assemble(Vector[Scalar]* rhs, bool force_diagonal_blocks, Table* block_weights) except +translateException
    void assemble(Vector[Scalar]* rhs, bool force_diagonal_blocks) except +translateException
    void assemble(Vector[Scalar]* rhs) except +translateException

    void invalidate_matrix()

    void set_fvm()
      
cdef class PyDiscreteProblemReal:
  cdef DiscreteProblem[double]* thisptr

cdef class PyDiscreteProblemComplex:
  cdef DiscreteProblem[cComplex[double]]* thisptr
  


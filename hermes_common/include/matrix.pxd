cdef extern from "matrix.h" namespace "Hermes::Algebra::DenseMatrixOperations":
  cdef void ludcmp(double **a, int n, int *indx, double *d)
  cdef void choldc(double **a, int n, double p[])

cdef extern from "matrix.h" namespace "Hermes::Algebra":
  enum EMatrixDumpFormat:
    DF_MATLAB_SPARSE
    DF_PLAIN_ASCII
    DF_HERMES_BIN
    DF_NATIVE
    DF_MATRIX_MARKET

  cdef cppclass Matrix[Scalar]: #abstract
    unsigned int get_size()
    void alloc()
    void free()
    Scalar get(unsigned int m, unsigned int n)
    void zero()
    void add_to_diagonal(Scalar v)
    void add(unsigned int m, unsigned int n, Scalar v)
    void add(unsigned int m, unsigned int n, Scalar **mat, int *rows, int *cols)
    bool dump(FILE *file, char *var_name, EMatrixDumpFormat fmt)
    bool dump(FILE *file, char *var_name)
    unsigned int get_matrix_size()

  cdef cppclass SparseMatrix[Scalar]:# public Matrix<Scalar> { #abstract
    SparseMatrix()
    SparseMatrix(unsigned int size)

    void prealloc(unsigned int n)
    void pre_add_ij(unsigned int row, unsigned int col)
    void finish()
    unsigned int get_size()
    void add_sparse_matrix(SparseMatrix* mat)
    void add_sparse_to_diagonal_blocks(int num_stages, SparseMatrix[Scalar]* mat)
    int get_num_row_entries(unsigned int row)
    void extract_row_copy(unsigned int row, unsigned int len,unsigned int &n_entries, double *vals,unsigned int *idxs)
    int get_num_col_entries(unsigned int col)
    void extract_col_copy(unsigned int col, unsigned int len,unsigned int &n_entries, double *vals,unsigned int *idxs)
    void multiply_with_vector(Scalar* vector_in, Scalar* vector_out)
    void multiply_with_Scalar(Scalar value)
    SparseMatrix* duplicate()
    double get_fill_in()
    unsigned row_storage
    unsigned col_storage
    unsigned int get_nnz()

  cdef cppclass Vector[Scalar]: #abstract
    void alloc(unsigned int ndofs)
    void free()
    void finish()
    Scalar get(unsigned int idx)
    void extract(Scalar *v)
    void zero()
    void change_sign()
    void set(unsigned int idx, Scalar y)
    void add(unsigned int idx, Scalar y)
    void add_vector(Vector[Scalar]* vec)
    void add_vector(Scalar* vec)
    void add(unsigned int n, unsigned int *idx, Scalar *y)
    unsigned int length()
    bool dump(FILE *file, char *var_name,EMatrixDumpFormat fmt)
    #bool dump(FILE *file, const char *var_name,EMatrixDumpFormat fmt = DF_MATLAB_SPARSE)

    #template<typename Scalar> HERMES_API SparseMatrix<Scalar>*  create_matrix(Hermes::MatrixSolverType matrix_solver_type)


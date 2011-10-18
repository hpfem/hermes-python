cdef int * intArray(a):
  cdef int n = len(a)
  cdef int *out=<int*> newBuffer(sizeof(int)*n)
  cdef int i
  for i in range(n):
    out[i]=a[i]
  return out

cdef double * doubleArray(a):
  cdef int n = len(a)
  cdef double *out=<double*> newBuffer(sizeof(double)*n)
  cdef int i
  for i in range(n):
    out[i]=a[i]
  return out

cdef int ** int2Array(a):
  cdef int n = len(a)
  cdef int **out=<int**> newBuffer(sizeof(int*)*n)
  cdef int i,j
  cdef int n2
  for i in range(n):
    n2=len(a[i])
    for j in range(n2):
      out[i]=<int*> newBuffer(sizeof(int)*n2)
      out[i][j]=a[i][j]
  return out


cdef double ** double2Array(a):
  cdef int n = len(a)
  cdef double **out=<double**> newBuffer(sizeof(double*)*n)
  cdef int i
  for i in range(n):
    out[i]=doubleArray(a[i])
  return out

cdef del2Doubles(double ** a,int n):
  cdef int i
  for i in range(n):
    delDoubles(a[i])
  delDoublesPointer(a)

cdef del2Complexes(cComplex[double] ** a,int n):
  cdef int i
  for i in range(n):
    delComplexes(a[i])
  delComplexesPointer(a)

cdef cComplex[double] * complexArray(a):
  cdef int n = len(a)
  cdef cComplex[double] *out=<cComplex[double]*> newBuffer(sizeof(cComplex[double])*n)
  cdef int i
  for i in range(n):
    out[i]=cComplex[double](a[i].real,a[i].imag)
  return out

cdef cComplex[double] ** complex2Array(a):
  cdef int n = len(a)
  cdef cComplex[double] **out=<cComplex[double]**> newBuffer(sizeof(void*)*n)
  cdef int i
  for i in range(n):
    out[i]=complexArray(a[i])
  return out

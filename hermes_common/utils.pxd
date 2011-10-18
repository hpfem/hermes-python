cdef extern from "utils.h":
  cdef void * newBuffer(size_t size)
  cdef void delInts(int*buffer)
  cdef void delDoubles(double*buffer)
  cdef void delDoublesPointer(double**buffer)

cdef int * intArray(a)
cdef int ** int2Array(a)
cdef double ** double2Array(a)
cdef del2Doubles(double ** a,int n)

cdef extern from "Python.h":
  FILE* PyFile_AsFile(object)


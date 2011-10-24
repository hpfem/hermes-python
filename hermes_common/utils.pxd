cdef extern from "utils.h":
  cdef void * newBuffer(size_t size)
  cdef void delInts(int*buffer)
  cdef void delDoubles(double*buffer)
  cdef void delDoublesPointer(double**buffer)
  cdef void delComplexes(cComplex[double] * buffer)
  cdef void delComplexesPointer(cComplex[double] ** buffer)

cdef int * intArray(a)
cdef unsigned int * uintArray(a)
cdef int ** int2Array(a)
cdef double ** double2Array(a)
cdef cComplex[double] * complexArray(a)
cdef cComplex[double] ** complex2Array(a)
cdef del2Doubles(double ** a,int n)
cdef del2Complexes(cComplex[double] ** a,int n)

cdef class PyCArray:	#TODO implement members acces
  cdef int length

cdef class PyIntArray(PyCArray):
  cdef int * buff

cdef extern from "Python.h":
  FILE* PyFile_AsFile(object)


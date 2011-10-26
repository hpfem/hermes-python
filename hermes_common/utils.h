
inline void * newBuffer(size_t size){
  return new char[size];
}

inline void delInts(int*buffer){
  delete[] buffer;
}

inline void delDoubles(double*buffer){
  delete[] buffer;
}

inline void delDoublesPointer(double**buffer){
  delete[] buffer;
}

inline void delComplexes(std::complex<double> *buffer){
  delete[] buffer;
}

inline void delComplexesPointer(std::complex<double> **buffer){
  delete[] buffer;
}

%module vector
%{
#include "vector.h"
%}

%rename (printvec) print();
%import exceptions.i
%include "vector.h"

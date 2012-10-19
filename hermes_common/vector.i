%module vector
%{
#include "/usr/local/include/hermes_common/vector.h"
%}

%rename (printvec) print();
%import exceptions.i
%include "/usr/local/include/hermes_common/vector.h"

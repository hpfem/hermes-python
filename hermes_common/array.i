%module array
%{
#include "/usr/local/include/hermes_common/array.h"
%}

%rename (get_id) *::operator[] (int id) const;
%include "/usr/local/include/hermes_common/array.h"





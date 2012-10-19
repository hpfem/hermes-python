%module common
%{
#include "/usr/local/include/hermes_common/common.h"
%}

%rename (val) *::operator[] (int idx);
%import config.i
%include "/usr/local/include/hermes_common/common.h"


 

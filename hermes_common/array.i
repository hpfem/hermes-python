%module array

%{
#include "/usr/local/include/hermes_common/array.h"

#include <vector>
#include <limits.h>

%}


%rename (get_id) *::operator[] (int id) const;
%include "array.h"




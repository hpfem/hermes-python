%module array

%{
#include "array.h"

#include <vector>
#include <limits.h>

%}


%rename (get_id) *::operator[] (int id) const;
%include "array.h"




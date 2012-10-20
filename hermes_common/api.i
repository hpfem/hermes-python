%module api

%{
#include "/usr/local/include/hermes_common/api.h"

#include "compat.h"
#include <map>
%}


%import compat.i
%include "api.h"

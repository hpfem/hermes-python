%module curved

%{
#include "mesh/curved.h"

#include "../global.h"
#include "../shapeset/shapeset_common.h"
%}

%import ../global.i
%import ../shapeset/shapeset_common.i
%include "mesh/curved.h"

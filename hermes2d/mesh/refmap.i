%module refmap

%{
#include "mesh/refmap.h"
%}

%import ../global.i
%import ../shapeset/precalc.i
%import ../quadrature/quad_all.i
%import ../shapeset/shapeset_h1_all.i
%include "mesh/refmap.h"

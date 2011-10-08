from libcpp cimport bool
from libcpp.string cimport string 
from ctypes cimport complex as cComplex
from hermes_common cimport vector

include "include/asmlist.pxd"
#include "include/calculation_continuity.pxd"
include "include/boundary_conditions/essential_boundary_conditions.pxd"
include "include/mesh/mesh.pxd"
include "include/mesh/mesh_reader_h2d_xml.pxd"

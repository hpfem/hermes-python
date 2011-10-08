from libcpp cimport bool
from libcpp.string cimport string 
from ctypes cimport complex as cComplex
from hermes_common cimport vector
from hermes_common cimport Scalar2
from hermes_common cimport Ord

include "include/asmlist.pxd"
include "include/function/exact_solution.pxd"
include "include/boundary_conditions/essential_boundary_conditions.pxd"
include "include/shapeset/shapeset.pxd"
include "include/space/space.pxd"
#include "include/calculation_continuity.pxd"
include "include/mesh/mesh.pxd"
include "include/mesh/mesh_reader_h2d_xml.pxd"

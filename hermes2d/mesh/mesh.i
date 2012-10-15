// SWIG interface file for the Mesh class.
HERMES_INCLUDE_PATH = ~/repos/hermes/hermes2d/include

% module Mesh

%{
#include "HERMES_INCLUDE_PATH/mesh/curved.h"
#include "HERMES_INCLUDE_PATH/mesh/element_to_refine.h"
#include "HERMES_INCLUDE_PATH/mesh/hash.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_data.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_h1d_xml.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_h2d_xml.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_reader_exodusii.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_reader.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h1d_xml.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h2d.h"
#include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h2d_xml.h"
#include "HERMES_INCLUDE_PATH/mesh/refinement_type.h"
#include "HERMES_INCLUDE_PATH/mesh/refmap.h"
#include "HERMES_INCLUDE_PATH/mesh/subdomains_h2d_xml.h"
#include "HERMES_INCLUDE_PATH/mesh/traverse.h"
%}

%include "HERMES_INCLUDE_PATH/mesh/curved.h"
%include "HERMES_INCLUDE_PATH/mesh/element_to_refine.h"
%include "HERMES_INCLUDE_PATH/mesh/hash.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_data.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_h1d_xml.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_h2d_xml.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_reader_exodusii.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_reader.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h1d_xml.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h2d.h"
%include "HERMES_INCLUDE_PATH/mesh/mesh_reader_h2d_xml.h"
%include "HERMES_INCLUDE_PATH/mesh/refinement_type.h"
%include "HERMES_INCLUDE_PATH/mesh/refmap.h"
%include "HERMES_INCLUDE_PATH/mesh/subdomains_h2d_xml.h"
%include "HERMES_INCLUDE_PATH/mesh/traverse.h"

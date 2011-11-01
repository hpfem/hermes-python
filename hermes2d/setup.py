from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("hermes2d", [
    "hermes2d.pyx",
    "hermes2d.pxd",
    "src/asmlist.pxi",
    "include/hermes2d_common_defs.pxd",
    "include/asmlist.pxd",
    "include/shapeset/precalc.pxd",
    "include/function/solution.pxd",
    "include/mesh/traverse.pxd",
    "include/function/exact_solution.pxd",
    "include/calculation_continuity.pxd",
    "src/calculation_continuity.pxi",
    "include/boundary_conditions/essential_boundary_conditions.pxd",
    "src/boundary_conditions/essential_boundary_conditions.pxi",
    "include/shapeset/shapeset.pxd",
    "include/space/space.pxd",
    "include/mesh/mesh.pxd",
    "src/mesh/mesh.pxi",
    "src/mesh/mesh_reader_h2d_xml.pxi",
    "include/mesh/mesh_reader_h2d_xml.pxd"
    ],language="c++",libraries=["hermes2d"])]
)

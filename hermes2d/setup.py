from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("hermes2d", [
    "hermes2d.pyx",
    "hermes2d.pxd",
    "src/asmlist.pxi",
    "include/asmlist.pxd",
    "src/mesh/mesh.pxi",
    "include/mesh/mesh.pxd",
    "src/mesh/mesh_reader_h2d_xml.pxi",
    "include/mesh/mesh_reader_h2d_xml.pxd"
    ],language="c++",libraries=["hermes2d"])]
)

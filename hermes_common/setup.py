from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("hermes_common", [
    "hermes_common.pyx",
    "hermes_common.pxd",
    "include/common.pxd",
    "include/common_time_period.pxd",
    "src/common_time_period.pxi",
    "include/ord.pxd",
    "src/ord.pxi",
    "include/matrix.pxd",
    "translate_exception.cpp",
    "include/exceptions.pxd",
    "src/exceptions.pxi",
    "include/vector.pxd",
    "include/hermes_function.pxd",
    "include/tables.pxd",
    "src/tables.pxi",
    "src/hermes_function.pxi"
    ],language="c++",libraries=["hermes_common"])]
)

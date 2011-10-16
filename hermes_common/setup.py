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
    "include/matrix.pxd",
    "translate_exception.cpp",
    "include/exceptions.pxd",
    "src/exceptions.pxi",
    "include/vector.pxd"
    ],language="c++",libraries=["hermes_common"])]
)

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [Extension("hermes_common", [
    "hermes_common.pyx",
    "hermes_common.pxd",
    "include/common.pxd",
    "src/common.pxi",
    "include/common_time_period.pxd",
    "src/common_time_period.pxi",
    "include/ord.pxd",
    "src/ord.pxi",
    "include/matrix.pxd",
    "src/matrix.pxi",
    "../translate_exceptions/translate_exception.cpp",
    "../translate_exceptions/raise_exception.pxd",
    "../translate_exceptions/raise_exception.pxi",
    "include/exceptions.pxd",
    "src/exceptions.pxi",
    "include/vector.pxd",
    "include/hermes_function.pxd",
    "include/tables.pxd",
    "src/tables.pxi",
    "utils.pxd",
    "utils.pxi",
    "include/solvers/linear_solver.pxd",
    "include/solvers/precond.pxd",
    "src/solvers/linear_solver.pxi",
    "include/solvers/dp_interface.pxd",
    "include/solvers/nonlinear_solver.pxd",
    "src/solvers/nonlinear_solver.pxi",
    "src/hermes_function.pxi"
    ],language="c++",libraries=["hermes_common"])]
)

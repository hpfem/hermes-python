import hermes_common
e=hermes_common.PyValueException("neco",3,8)
e.printMsg()
mat=hermes_common.PyCreateMatrixReal(hermes_common.PyMatrixSolverType.SOLVER_UMFPACK)
mat.prealloc(4)


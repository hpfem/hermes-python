import hermes_common
e=hermes_common.PyValueException("neco",3,8)
e.printMsg()

mat=hermes_common.PyCreateMatrixReal(hermes_common.PyMatrixSolverType.SOLVER_UMFPACK)
rhs=hermes_common.PyCreateVectorReal(hermes_common.PyMatrixSolverType.SOLVER_UMFPACK)

#1    #2
# 22  #0
# 1   #3
mat.prealloc(3)
mat.pre_add_ij(0,0)
mat.pre_add_ij(1,1)
mat.pre_add_ij(1,2)
mat.pre_add_ij(2,1)

mat.alloc()
mat.add(0,0,1)
mat.add(1,1,2)
mat.add(1,2,2)
mat.add(2,1,1)
mat.finish()

rhs.alloc(3)
rhs.add(0,2)
rhs.add(2,3)
rhs.finish()

f=open("vector","w+")
f2=open("matice","w+")
rhs.dump(f,"name")
mat.dump(f2,"name")
f.close()
f2.close()

s=hermes_common.PyCreateLinearSolverReal(hermes_common.PyMatrixSolverType.SOLVER_UMFPACK,mat,rhs)

try:
  s.solve()
  sln=s.get_sln_vector()
  print sln
except hermes_common.PyException as e:
  e.printMsg()



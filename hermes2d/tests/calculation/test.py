import hermes_common
import hermes2d
import os
from definitions import PyCustomWeakFormPoisson

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyScalarView()

# Load the mesh.
reader.load("domain.xml",mesh)

# Create a boundary condition
markers = []
markers.append("Bottom")
markers.append("Inner")
markers.append("Outer")
markers.append("Left")


bc = hermes2d.PyDefaultEssentialBCConstReal(markers, 20.0)

# Create the structure for the BCs to be passed
bcs = hermes2d.PyEssentialBCsReal(bc)

space=hermes2d.PyH1SpaceReal(mesh, bcs, 3)
 
wf= PyCustomWeakFormPoisson("Aluminum", "Copper") 

dp = hermes2d.PyDiscreteProblemReal(wf,space)

solution = hermes2d.PySolutionReal()

newton = hermes2d.PyNewtonSolverReal(dp)

coef=[]
for i in range(space.get_num_dofs()):
  coef.append(0)

newton.solve(coef)

hermes2d.PySolutionReal().vector_to_solution(newton.get_sln_vector(), space, solution)

viewer.show(solution)
viewer.wait_for_close()


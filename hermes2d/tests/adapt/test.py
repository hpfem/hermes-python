import hermes_common
import hermes2d
import os
from definitions import PyCustomWeakFormPoisson

ERR_STOP = 0.01
CAND_LIST = hermes2d.PyCandList.H2D_HP_ANISO
THRESHOLD = 0.7

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyScalarView()

# Load the mesh.
reader.load("domain.xml",mesh)
mesh.refine_all_elements()

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

solution = hermes2d.PySolutionReal()
ref_solution = hermes2d.PySolutionReal()


selector = hermes2d.PyH1ProjBasedSelectorReal(CAND_LIST)  

done = False

# adaptivity step
adaptivity_step = 1

while not(done):
  print("---- Adaptivity step " + repr(adaptivity_step) + ":")
  
  ref_space = space.construct_refined_space(space)
  print("Solving on reference mesh, ndofs:" + repr(ref_space.get_num_dofs()) + ".")
  
  newton = hermes2d.PyNewtonSolverReal(hermes2d.PyDiscreteProblemReal(wf,ref_space))
  coef=[]
  for i in range(ref_space.get_num_dofs()):
    coef.append(0)
  newton.solve(coef)
  hermes2d.PySolutionReal().vector_to_solution(newton.get_sln_vector(), ref_space, ref_solution)
  ogProjection = hermes2d.PyOGProjectionReal()
  ogProjection.project_global(space, ref_solution, solution)
  
  adaptivity = hermes2d.PyAdaptReal(space)
  print("Calculating error estimate")
  err_est_rel = adaptivity.calc_err_est(solution, ref_solution) * 100
  print("Error estimate: " + repr(err_est_rel))
  
  if(err_est_rel < ERR_STOP):
    print("Error threshold achieved.")    
    done = True
  else:
    print("Adapting coarse mesh...")
    adaptivity.adapt(selector, THRESHOLD)
    print("done")
  adaptivity_step+=1
  viewer.show(ref_solution)

viewer.wait_for_close()


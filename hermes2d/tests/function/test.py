import hermes_common
import hermes2d
import os

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyScalarView()

# Load the mesh.
reader.load("domain.xml",mesh)

sln = hermes2d.PyConstantSolutionReal(mesh, 1.0)

linearizer = hermes2d.PyLinearizer()
linearizer.save_solution_vtk(sln, "solution.vtk", "solution")
os.system("paraview --data=solution.vtk")

# Test of ScalarView
viewer.show(sln)
viewer.wait_for_close()

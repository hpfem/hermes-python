import hermes_common
import hermes2d

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyScalarView()

# Load the mesh.
reader.load("domain.xml",mesh)

sln = PyConstantSolutionReal(mesh, 1.0)

# Test of ScalarView
viewer.show(sln)
viewer.wait_for_close()

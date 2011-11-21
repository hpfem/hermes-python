import hermes_common
import hermes2d

# Load a mesh.
mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)

# Create a space with no boundary conditions.
space1=hermes2d.PySpaceReal()
space1.thisptr = l2Space(mesh.thisptr, 1)

# Create a boundary condition
bc = PyDefaultEssentialBCConstReal("HERMES_ANY", 1.0)

# Create the structure for the BCs to be passed
bcs = PyEssentialBCsReal()
#...add bc to bcs
space2=hermes2d.PySpaceReal()
space2.thisptr = H1Space(mesh.thisptr, bc, 1)

viewer=hermes2d.PyBaseView()
viewer.show(space1)
viewer.wait_for_close()
viewer.show(space2)
viewer.wait_for_close()

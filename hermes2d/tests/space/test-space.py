import hermes_common
import hermes2d

# Load a mesh.
mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)

# Create a space with no boundary conditions.
space1=hermes2d.PyL2SpaceReal(mesh, 1)

# Create a boundary condition
bc = hermes2d.PyDefaultEssentialBCConstReal("HERMES_ANY", 1.0)

# Create the structure for the BCs to be passed
bcs = hermes2d.PyEssentialBCsReal()
#...add bc to bcs
space2=hermes2d.PyH1SpaceReal(mesh, bcs, 9)

viewer=hermes2d.PyOrderView()
viewer.show(space1)
viewer.wait_for_close()
viewer.show(space2)
viewer.wait_for_close()

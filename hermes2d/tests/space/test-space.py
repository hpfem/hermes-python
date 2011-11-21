import hermes_common
import hermes2d

# Load a mesh.
mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)

# Create a space.
space=hermes2d.PySpaceReal()
space.thisptr = H1Space(mesh.thisptr, 1)

viewer=hermes2d.PyBaseView()
viewer.show(space)
viewer.wait_for_close()

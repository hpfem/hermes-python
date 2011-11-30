import hermes_common
import hermes2d

# Load a mesh.
mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)

# Create a space with no boundary conditions.
spaceL2=hermes2d.PyL2SpaceReal(mesh, 5)
spaceL2.set_element_order(0, 3)
spaceH1=hermes2d.PyH1SpaceReal(mesh, 1)
spaceHcurl=hermes2d.PyHcurlSpaceReal(mesh, 6)

orderView=hermes2d.PyOrderView()
orderView.show(spaceL2)
orderView.wait_for_keypress()
orderView.show(spaceH1)
orderView.wait_for_keypress()
orderView.show(spaceHcurl)
orderView.wait_for_keypress()

# Create a boundary condition
bc = hermes2d.PyDefaultEssentialBCConstReal("HERMES_ANY", 1.0)

# Create the structure for the BCs to be passed
bcs = hermes2d.PyEssentialBCsReal()

#...add bc to bcs
spaceH1=hermes2d.PyH1SpaceReal(mesh, bcs, 3)
spaceHcurl=hermes2d.PyHcurlSpaceReal(mesh, bcs, 4)

orderView.show(spaceH1)
orderView.wait_for_keypress()
orderView.show(spaceHcurl)
orderView.wait_for_keypress()

reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain-quad.xml",mesh)

# Create a space with no boundary conditions.
spaceHdiv=hermes2d.PyHdivSpaceReal(mesh, 5)
baseView=hermes2d.PyBaseViewReal()
baseView.show(spaceHdiv)
baseView.wait_for_keypress()

orderView.wait_for_close()

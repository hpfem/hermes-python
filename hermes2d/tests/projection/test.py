import hermes_common
import hermes2d
from definitions import *

# Load a mesh.
mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)

# Create a space with no boundary conditions.
spaceL2=hermes2d.PyL2SpaceReal(mesh, 3)
spaceL2.set_element_order(0, 3)
spaceH1=hermes2d.PyH1SpaceReal(mesh, 1)
spaceHcurl=hermes2d.PyHcurlSpaceReal(mesh, 6)

# Create a boundary condition
bc = hermes2d.PyDefaultEssentialBCConstReal("HERMES_ANY", 1.0)

# Create the structure for the BCs to be passed
bcs = hermes2d.PyEssentialBCsReal()

#...add bc to bcs
spaceH1=hermes2d.PyH1SpaceReal(mesh, bcs, 1)
spaceHcurl=hermes2d.PyHcurlSpaceReal(mesh, bcs, 4)

slnScalar = PyProjectionTestExactSolutionScalarReal(mesh)
slnVector = PyProjectionTestExactSolutionVectorReal(mesh)

solutionL2 = hermes2d.PySolutionReal()
solutionH1 = hermes2d.PySolutionReal()
solutionHcurl = hermes2d.PySolutionReal()

ogProjection = hermes2d.PyOGProjectionReal()
spaces = list()
solutionsExact = list()
solutionsProjected = list()
spaces.append(spaceL2)
spaces.append(spaceH1)
spaces.append(spaceHcurl)

solutionsExact.append(slnScalar)
solutionsExact.append(slnScalar)
solutionsExact.append(slnVector)

solutionsProjected.append(solutionL2)
solutionsProjected.append(solutionH1)
solutionsProjected.append(solutionHcurl)

# One space
ogProjection.project_global(spaceHcurl, slnVector, solutionHcurl)

sview = hermes2d.PyScalarView()
sview.set_title("exact solution")
sview.show(slnVector)
sview.wait_for_keypress()
sview.set_title("projected solution")
sview.show(solutionHcurl)
sview.wait_for_keypress()

# More spaces
ogProjection.project_global(spaces, solutionsExact, solutionsProjected)

for i in range(3):
  sview.set_title("exact solution")
  sview.show(solutionsExact[i])
  sview.wait_for_keypress()
  sview.set_title("projected solution")
  sview.show(solutionsProjected[i])
  sview.wait_for_keypress()
sview.wait_for_close()
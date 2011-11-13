import hermes_common
import hermes2d

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.load("domain.xml",mesh)
reader.save("domain2.xml",mesh)
viewer=hermes2d.PyMeshView()
viewer.show(mesh)
viewer.wait_for_close()

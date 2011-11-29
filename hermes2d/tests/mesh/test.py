import hermes_common
import hermes2d

mesh=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyMeshView()

# Test of save / load of one mesh.
reader.load("domain.xml",mesh)
reader.save("domain2.xml",mesh)
reader.load("domain2.xml",mesh)

# Test of save / load of a mesh with multiple subdomains.
meshes = list()
mesh_whole_domain=hermes2d.PyMesh()
meshes.append(mesh_whole_domain)
mesh_bottom_left_corner=hermes2d.PyMesh()
meshes.append(mesh_bottom_left_corner)
mesh_complement=hermes2d.PyMesh()
meshes.append(mesh_complement)

reader.load("subdomains.xml", meshes)

for i in range(0,2):
  meshes[i].refine_all_elements()

reader.save("subdomains2.xml", meshes)
reader.load("subdomains2.xml", meshes)

# Test of MeshView
viewer.show(mesh)
viewer.wait_for_close()

viewer.show(mesh_whole_domain)
viewer.wait_for_close()
viewer.show(mesh_bottom_left_corner)
viewer.wait_for_close()
viewer.show(mesh_complement)
viewer.wait_for_close()

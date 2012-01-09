import hermes_common
import hermes2d

mesh=hermes2d.PyMesh()
mesh_from_stream=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
viewer=hermes2d.PyMeshView()

# Test of save / load of one mesh.
reader.load_stream("<?xml version=\"1.0\" encoding=\"utf-8\"?> <mesh:mesh xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:mesh=\"XMLMesh\" xmlns:element=\"XMLMesh\" xsi:schemaLocation=\"XMLMesh ../xml_schemas/mesh_h2d_xml.xsd\"> <variables> <variable name=\"a\" value=\"1.0\" /> <variable name=\"m_a\" value=\"-1.0\" />\
        <variable name=\"b\" value=\"0.70710678118654757\" />\
      </variables>\
\
      <vertices>\
        <vertex x=\"0.00000000000000000000\" y=\"m_a\" i=\"0\"/>\
        <vertex x=\"a\" y=\"m_a\" i=\"1\"/>\
        <vertex x=\"m_a\" y=\"0\" i=\"2\"/>\
        <vertex x=\".\" y=\".00\" i=\"3\"/>\
        <vertex x=\"a\" y=\".00000000\" i=\"4\"/>\
        <vertex x=\"m_a\" y=\"a\" i=\"5\"/>\
        <vertex x=\"0.000\" y=\"a\" i=\"6\"/>\
        <vertex x=\"b\" y=\"b\" i=\"7\"/>\
      </vertices>\
\
      <elements>\
        <element:quad v1=\"0\" v2=\"1\" v3=\"4\" v4=\"3\" marker=\"Copper\" />\
        <element:triangle v1=\"3\" v2=\"4\" v3=\"7\" marker=\"Copper\" />\
        <element:triangle v1=\"3\" v2=\"7\" v3=\"6\" marker=\"Aluminum\" />\
        <element:quad v1=\"2\" v2=\"3\" v3=\"6\" v4=\"5\" marker=\"Aluminum\" />\
      </elements>\
\
      <edges>\
        <edge v1=\"0\" v2=\"1\" marker=\"Bottom\" />\
        <edge v1=\"1\" v2=\"4\" marker=\"Outer\" />\
        <edge v1=\"3\" v2=\"0\" marker=\"Inner\" />\
        <edge v1=\"4\" v2=\"7\" marker=\"Outer\" />\
        <edge v1=\"7\" v2=\"6\" marker=\"Outer\" />\
        <edge v1=\"2\" v2=\"3\" marker=\"Inner\" />\
        <edge v1=\"6\" v2=\"5\" marker=\"Outer\" />\
        <edge v1=\"5\" v2=\"2\" marker=\"Left\" />\
      </edges>\
\
      <curves>\
        <arc v1=\"4\" v2=\"7\" angle=\"45\" />\
        <arc v1=\"7\" v2=\"6\" angle=\"45\" />\
      </curves>\
    </mesh:mesh>", mesh_from_stream)
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
viewer.show(mesh_from_stream)
viewer.wait_for_close()
viewer.show(mesh)
viewer.wait_for_close()

viewer.show(mesh_whole_domain)
viewer.wait_for_close()
viewer.show(mesh_bottom_left_corner)
viewer.wait_for_close()
viewer.show(mesh_complement)
viewer.wait_for_close()
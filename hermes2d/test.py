import hermes2d
mesh1=hermes2d.PyMesh()
mesh2=hermes2d.PyMesh()
reader=hermes2d.PyMeshReaderH2DXML()
reader.save("mesh.xml",mesh1)
reader.save("meshes.xml",[mesh1,mesh2])

a=hermes2d.PyDefaultEssentialBCConstComplex("string",complex(2,3))

asm=hermes2d.PyAsmListComplex()
print asm.get_idx()


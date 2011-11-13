#cdef extern from "shapeset/precalc.h" namespace "Hermes::Hermes2D": TODO
#  cdef cppclass PrecalcShapeset:# public Function<double>
#    SpaceType get_space_type()
#    PrecalcShapeset(Shapeset* shapeset)
#    PrecalcShapeset(PrecalcShapeset* master_pss)

cdef class PyPrecalcShapeset(PyFunctionReal):
  pass



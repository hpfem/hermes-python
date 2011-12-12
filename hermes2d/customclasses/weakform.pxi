cdef class PyCustomWeakFormReal(PyWeakFormReal):
  def __cinit__(self, neq = None, mat_free = None, *args):
    if mat_free is not None:
      self.thisptr = new WeakForm[double](neq,mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[double](neq)
      return
    self.thisptr = new WeakForm[double]()

cdef class PyCustomWeakFormComplex(PyWeakFormComplex):
  def __cinit__(self, neq = None, mat_free = None, *args):
    if mat_free is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq,mat_free)
      return
    if neq is not None:
      self.thisptr = new WeakForm[cComplex[double]](neq)
      return
    self.thisptr = new WeakForm[cComplex[double]]()


cdef class PyCustomMatrixFormVolReal(PyMatrixFormVolReal):
  pass

cdef public double pyMatrixFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[double] *ext):
  cdef PyFuncReal f = PyFuncReal(init=False)
  cdef PyFuncReal pu = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncReal(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return self.value(n, pwt, pu_ext, pu, pv, pe, pext)

cdef public Ord pyMatrixFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pu = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public double pyVectorFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[double] *ext):
  cdef PyFuncReal f = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncReal(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return self.value(n, pwt, pu_ext, pv, pe, pext)

cdef public Ord pyVectorFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public double pyMultiMatrixFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[double] *ext, vector[double]& result):
  cdef PyFuncReal f = PyFuncReal(init=False)
  cdef PyFuncReal pu = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncReal(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pu, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(p)

cdef public Ord pyMultiMatrixFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pu = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public double pyMultiVectorFormReal_value(object self, int n, double *wt, Func[double] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[double] *ext, vector[double]& result):
  cdef PyFuncReal f = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataReal pext = PyExtDataReal(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncReal(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(p)

cdef public Ord pyMultiVectorFormReal_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMatrixFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext):
  cdef PyFuncComplex f = PyFuncComplex(init=False)
  cdef PyFuncReal pu = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncComplex(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return ccomplex(self.value(n, pwt, pu_ext, pu, pv, pe, pext))

cdef public Ord pyMatrixFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pu = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyVectorFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext):
  cdef PyFuncComplex f = PyFuncComplex(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncComplex(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return ccomplex(self.value(n, pwt, pu_ext, pv, pe, pext))

cdef public Ord pyVectorFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMultiMatrixFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *u, Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext, vector[cComplex[double]]& result):
  cdef PyFuncComplex f = PyFuncComplex(init=False)
  cdef PyFuncReal pu = PyFuncReal(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncComplex(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pu, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(ccomplex(p))

cdef public Ord pyMultiMatrixFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *u, Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pu = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pu.thisptr = u
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pu, pv, pe, pext)).thisptr[0]

cdef public cComplex[double] pyMultiVectorFormComplex_value(object self, int n, double *wt, Func[cComplex[double]] *u_ext[], Func[double] *v, Geom[double] *e, ExtData[cComplex[double]] *ext, vector[cComplex[double]]& result):
  cdef PyFuncComplex f = PyFuncComplex(init=False)
  cdef PyFuncReal pv = PyFuncReal(init=False)
  cdef PyGeomReal pe = PyGeomReal(init=False)
  cdef PyExtDataComplex pext = PyExtDataComplex(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncComplex(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  presult = []
  self.value(n, pwt, pu_ext, pv, pe, pext, presult)
  result.clear()
  for p in presult:
    result.push_back(ccomplex(p))

cdef public Ord pyMultiVectorFormComplex_ord(object self, int n, double *wt, Func[Ord] *u_ext[], Func[Ord] *v, Geom[Ord] *e, ExtData[Ord] *ext):
  cdef PyFuncOrd f = PyFuncOrd(init=False)
  cdef PyFuncOrd pv = PyFuncOrd(init=False)
  cdef PyGeomOrd pe = PyGeomOrd(init=False)
  cdef PyExtDataOrd pext = PyExtDataOrd(init=False)
  pv.thisptr = v
  pe.thisptr = e
  pext.thisptr = ext
  pu_ext = []
  pwt = []
  for i in range(n):
    f = PyFuncOrd(init=False)
    f.thisptr = u_ext[i]
    pu_ext.append(f)
    pwt.append(wt[i])
  return (<PyOrd> self.ord(n, pwt, pu_ext, pv, pe, pext)).thisptr[0]

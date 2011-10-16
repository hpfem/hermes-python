class PyButcherTableType:
  Explicit_RK_1, Explicit_RK_2, Explicit_RK_3, Explicit_RK_4, Implicit_RK_1, Implicit_Crank_Nicolson_2_2, Implicit_SIRK_2_2, Implicit_ESIRK_2_2, Implicit_SDIRK_2_2, Implicit_Lobatto_IIIA_2_2, Implicit_Lobatto_IIIB_2_2, Implicit_Lobatto_IIIC_2_2, Implicit_Lobatto_IIIA_3_4, Implicit_Lobatto_IIIB_3_4, Implicit_Lobatto_IIIC_3_4, Implicit_Radau_IIA_3_5, Implicit_SDIRK_5_4, Explicit_HEUN_EULER_2_12_embedded, Explicit_BOGACKI_SHAMPINE_4_23_embedded, Explicit_FEHLBERG_6_45_embedded, Explicit_CASH_KARP_6_45_embedded, Explicit_DORMAND_PRINCE_7_45_embedded, Implicit_ESDIRK_TRBDF2_3_23_embedded, Implicit_ESDIRK_TRX2_3_23_embedded, Implicit_SDIRK_CASH_3_23_embedded, Implicit_SDIRK_BILLINGTON_3_23_embedded, Implicit_SDIRK_CASH_5_24_embedded, Implicit_SDIRK_CASH_5_34_embedded, Implicit_DIRK_ISMAIL_7_45_embedded=range(30)

cdef class PyTable:
  def __cinit__(self, size=None):
    if (type(self)!=PyTable):
      return
    if size:
      self.thisptr=new Table(size)
    else:
      Table()

  def __dealloc__(self):
    del self.thisptr

  def alloc(self,unsigned int size):
    self.thisptr.alloc(size)

  def get_size(self):
    return self.thisptr.get_size()

  def get_A(self,unsigned int i, unsigned int j):
    return self.thisptr.get_A(i, j)

  def set_A(self,i, j, val):
    self.thisptr.set_A(i, j, val)

cdef class PyButcherTable(PyTable):
  """constructor differs from c version, call PyButcherTable(butcher_table=)"""
  def __cinit__(self, size=None, butcher_table=None):
    if (type(self)!=PyButcherTable):
      return
    if size:
      self.thisptr=<Table*> new ButcherTable(<int> size)
      return
    if butcher_table:
      self.thisptr=<Table*> new ButcherTable(<ButcherTableType> butcher_table)
      return
    else:
      ButcherTable()

  def get_B(self, unsigned int i):
    return (<ButcherTable*> self.thisptr).get_B(i)
  def get_B2(self, unsigned int i):
    return (<ButcherTable*> self.thisptr).get_B2(i)
  def get_C(self, unsigned int i):
    return (<ButcherTable*> self.thisptr).get_C(i)
  def set_B(self, unsigned int i, double val):
    (<ButcherTable*> self.thisptr).set_B(i, val)
  def set_B2(self, unsigned int i, double val):
    (<ButcherTable*> self.thisptr).set_B2(i, val)
  def set_C(self, unsigned int i, double val):
    (<ButcherTable*> self.thisptr).set_C(i, val)
  def is_explicit(self):
    return (<ButcherTable*> self.thisptr).is_explicit()
  def is_diagonally_implicit(self):
    return (<ButcherTable*> self.thisptr).is_diagonally_implicit()
  def is_fully_implicit(self):
    return (<ButcherTable*> self.thisptr).is_fully_implicit()
  def is_embedded(self):
    return (<ButcherTable*> self.thisptr).is_embedded()
  def switch_B_rows(self):
    (<ButcherTable*> self.thisptr).switch_B_rows()


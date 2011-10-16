cdef extern from "tables.h" namespace "Hermes":
  enum ButcherTableType:
    Explicit_RK_1
    Explicit_RK_2
    Explicit_RK_3
    Explicit_RK_4
    Implicit_RK_1
    Implicit_Crank_Nicolson_2_2
    Implicit_SIRK_2_2
    Implicit_ESIRK_2_2
    Implicit_SDIRK_2_2
    Implicit_Lobatto_IIIA_2_2
    Implicit_Lobatto_IIIB_2_2
    Implicit_Lobatto_IIIC_2_2
    Implicit_Lobatto_IIIA_3_4
    Implicit_Lobatto_IIIB_3_4
    Implicit_Lobatto_IIIC_3_4
    Implicit_Radau_IIA_3_5
    Implicit_SDIRK_5_4
    Explicit_HEUN_EULER_2_12_embedded
    Explicit_BOGACKI_SHAMPINE_4_23_embedded
    Explicit_FEHLBERG_6_45_embedded
    Explicit_CASH_KARP_6_45_embedded
    Explicit_DORMAND_PRINCE_7_45_embedded
    Implicit_ESDIRK_TRBDF2_3_23_embedded
    Implicit_ESDIRK_TRX2_3_23_embedded
    Implicit_SDIRK_CASH_3_23_embedded
    Implicit_SDIRK_BILLINGTON_3_23_embedded
    Implicit_SDIRK_CASH_5_24_embedded
    Implicit_SDIRK_CASH_5_34_embedded
    Implicit_DIRK_ISMAIL_7_45_embedded

  cdef cppclass Table:
    Table()
    Table(unsigned int size)
    void alloc(unsigned int size)
    unsigned int get_size()
    double get_A(unsigned int i, unsigned int j)
    void set_A(unsigned int i, unsigned int j, double val)

  cdef cppclass ButcherTable: #public Table
    ButcherTable()
    ButcherTable(unsigned int size)
    ButcherTable(ButcherTableType butcher_table)
    void alloc(unsigned int size)
    double get_B(unsigned int i)
    double get_B2(unsigned int i)
    double get_C(unsigned int i)
    void set_B(unsigned int i, double val)
    void set_B2(unsigned int i, double val)
    void set_C(unsigned int i, double val)
    bool is_explicit()
    bool is_diagonally_implicit()
    bool is_fully_implicit()
    bool is_embedded()
    void switch_B_rows()

cdef class PyTable:
  cdef Table * thisptr


cdef extern from "refinement_selectors/optimum_selector.h" namespace "Hermes::Hermes2D::RefinementSelectors":

  enum CandList:
    H2D_NONE,
    H2D_P_ISO,
    H2D_P_ANISO,
    H2D_H_ISO,
    H2D_H_ANISO,
    H2D_HP_ISO,
    H2D_HP_ANISO_H,
    H2D_HP_ANISO_P,
    H2D_HP_ANISO
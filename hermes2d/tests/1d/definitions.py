import hermes2d
class PyCustomWeakFormPoisson(hermes2d.PyCustomWeakFormReal):
  def __init__(self, mat_al, mat_cu):
    self.super(1)
    self.add_matrix_form(hermes2d.PyDefaultJacobianDiffusion(0,0, 1.0, mat_al))
    self.add_matrix_form(hermes2d.PyDefaultJacobianDiffusion(0,0, 1.0, mat_cu))
    self.add_vector_form(hermes2d.PyDefaultResidualDiffusion(0, 1.0, mat_al))
    self.add_vector_form(hermes2d.PyDefaultResidualDiffusion(0, 1.0, mat_cu))
    self.add_vector_form(hermes2d.PyDefaultVectorFormVol(0))

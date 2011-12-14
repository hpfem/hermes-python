def class PyCustomWeakFormPoisson(PyCustomWeakFormReal):
  def __init__(self, mat_al, mat_cu):
    (<PyWeakFormReal>self).add_matrix_form(hermes2d.PyDefaultJacobianDiffusion(0,0, mat_al))
    (<PyWeakFormReal>self).add_matrix_form(hermes2d.PyDefaultJacobianDiffusion(0,0, mat_cu))
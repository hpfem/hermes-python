import hermes_common
import hermes2d
import math
class PyProjectionTestExactSolutionScalarReal(hermes2d.PyCustomExactSolutionScalarReal):
  def value(self, x, y):
    return x*x*x*x*x + y*y*y*y*y + math.sin(x) - math.cos(x)

  def derivatives(self, x, y, dx, dy):
    dx = 5*x*x*x*x + math.cos(x)
    dy = 5*y*y*y*y + math.sin(x)
    
  def ord(self, x, y):
    return PyOrd(10)

class PyProjectionTestExactSolutionVectorReal(hermes2d.PyCustomExactSolutionVectorReal):
  def value(self, x, y):
    return hermes_common.PyScalar2Real(x*x*x, math.cos(x))

  def derivatives(self, x, y, dx, dy):
    dx = hermes_common.PyScalar2Real(3*x*x, 0)
    dy = hermes_common.PyScalar2Real(0, -math.sin(x))
    
  def ord(self, x, y):
    return PyOrd(10)
#include "exact_solution.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar>
    CustomExactSolutionScalar<Scalar>::CustomExactSolutionScalar(PyObject*self, Mesh* mesh):ExactSolutionScalar<Scalar>(mesh),self(self)
    {
    }

    template<typename Scalar>
    Scalar CustomExactSolutionScalar<Scalar>::value (double x, double y) const
    {
      return pyExactSolutionScalarReal_value(self, x, y);
    }

    template<typename Scalar>
    void CustomExactSolutionScalar<Scalar>::derivatives (double x, double y, Scalar& dx, Scalar& dy) const
    {
      return pyExactSolutionScalarReal_derivatives(self, x, y, dx, dy);
    }

    template<typename Scalar>
    Hermes::Ord CustomExactSolutionScalar<Scalar>::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionScalarReal_ord(self, x, y);
    }
    
    
    template<typename Scalar>
    CustomExactSolutionVector<Scalar>::CustomExactSolutionScalar(PyObject*self, Mesh* mesh):ExactSolutionVector<Scalar>(mesh),self(self)
    {
    }

    template<typename Scalar>
    Scalar2<Scalar> CustomExactSolutionVector<Scalar>::value (double x, double y) const
    {
      return pyExactSolutionVectorComplex_value(self, x, y);
    }

    template<typename Scalar>
    void CustomExactSolutionVector<Scalar>::derivatives (double x, double y, Scalar2& dx, Scalar2& dy) const
    {
      return pyExactSolutionVectorComplex_derivatives(self, x, y, dx, dy);
    }

    template<typename Scalar>
    Hermes::Ord CustomExactSolutionVector<Scalar>::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionVectorComplex_ord(self, x, y);
    }
  }
}
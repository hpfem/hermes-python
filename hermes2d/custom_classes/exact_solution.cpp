#include "exact_solution.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar>
    CustomExactSolutionScalar<Scalar>::CustomExactSolutionScalar(PyObject*self, Mesh* mesh):ExactSolutionScalar<Scalar>(mesh),self(self)
    {
    }

    template<>
    double CustomExactSolutionScalar<double>::value (double x, double y) const
    {
      return pyExactSolutionScalarReal_value(self, x, y);
    }

    template<>
    void CustomExactSolutionScalar<double>::derivatives (double x, double y, double& dx, double& dy) const
    {
      pyExactSolutionScalarReal_derivatives(self, x, y, dx, dy);
    }

    template<>
    Hermes::Ord CustomExactSolutionScalar<double>::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionScalarReal_ord(self, x, y);
    }
    
    template<>
    std::complex<double> CustomExactSolutionScalar<std::complex<double> >::value (double x, double y) const
    {
      return pyExactSolutionScalarComplex_value(self, x, y);
    }

    template<>
    void CustomExactSolutionScalar<std::complex<double> >::derivatives (double x, double y, std::complex<double>& dx, std::complex<double>& dy) const
    {
      pyExactSolutionScalarComplex_derivatives(self, x, y, dx, dy);
    }

    template<>
    Hermes::Ord CustomExactSolutionScalar<std::complex<double> >::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionScalarComplex_ord(self, x, y);
    }
    
    
    
    
    template<typename Scalar>
    CustomExactSolutionVector<Scalar>::CustomExactSolutionVector(PyObject*self, Mesh* mesh):ExactSolutionVector<Scalar>(mesh),self(self)
    {
    }

    template<>
    Scalar2<double> CustomExactSolutionVector<double>::value (double x, double y) const
    {
      return pyExactSolutionVectorReal_value(self, x, y);
    }

    template<>
    void CustomExactSolutionVector<double>::derivatives (double x, double y, Scalar2<double>& dx, Scalar2<double>& dy) const
    {
      pyExactSolutionVectorReal_derivatives(self, x, y, dx, dy);
    }

    template<>
    Hermes::Ord CustomExactSolutionVector<double>::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionVectorReal_ord(self, x, y);
    }

    template<>
    Scalar2<std::complex<double> > CustomExactSolutionVector<std::complex<double> >::value (double x, double y) const
    {
      return pyExactSolutionVectorComplex_value(self, x, y);
    }

    template<>
    void CustomExactSolutionVector<std::complex<double> >::derivatives (double x, double y, Scalar2<std::complex<double> >& dx, Scalar2<std::complex<double> >& dy) const
    {
      pyExactSolutionVectorComplex_derivatives(self, x, y, dx, dy);
    }

    template<>
    Hermes::Ord CustomExactSolutionVector<std::complex<double> >::ord(Hermes::Ord x, Hermes::Ord y) const
    {
      return pyExactSolutionVectorComplex_ord(self, x, y);
    }
  }
}
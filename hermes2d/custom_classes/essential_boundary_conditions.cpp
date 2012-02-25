#include "essential_boundary_conditions.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar>
    CustomDefaultEssentialBCNonConst<Scalar>::CustomDefaultEssentialBCNonConst(PyObject*self, Hermes::vector<std::string> markers_, 
        ExactSolutionScalar<Scalar>* exact_solution):DefaultEssentialBCNonConst<Scalar>(markers_, exact_solution),self(self){}

    template<typename Scalar>
    CustomDefaultEssentialBCNonConst<Scalar>::CustomDefaultEssentialBCNonConst(PyObject*self, std::string marker, 
        ExactSolutionScalar<Scalar>* exact_solution):DefaultEssentialBCNonConst<Scalar>(marker, exact_solution),self(self){}

    template<>
    double CustomDefaultEssentialBCNonConst<double>::value(double x, double y, double n_x, double n_y, double t_x, double t_y) const
    {
      return pyDefaultEssentialBCNonConstReal_value(self, x, y, n_x, n_y, t_x, t_y);
    }

    template<>
    std::complex<double> CustomDefaultEssentialBCNonConst<std::complex<double> >::value(double x, double y, double n_x, double n_y, double t_x, double t_y) const
    {
      return pyDefaultEssentialBCNonConstComplex_value(self, x, y, n_x, n_y, t_x, t_y);
    }

    template<typename Scalar>
    CustomDefaultEssentialBCNonConstHcurl<Scalar>::CustomDefaultEssentialBCNonConstHcurl(PyObject*self, Hermes::vector<std::string> markers_, ExactSolutionVector<Scalar>* exact_solution):DefaultEssentialBCNonConstHcurl<Scalar>(markers_, exact_solution),self(self){}

    template<typename Scalar>
    CustomDefaultEssentialBCNonConstHcurl<Scalar>::CustomDefaultEssentialBCNonConstHcurl(PyObject*self, std::string marker, 
        ExactSolutionVector<Scalar>* exact_solution):DefaultEssentialBCNonConstHcurl<Scalar>(marker, exact_solution),self(self){}

    template<>
    double CustomDefaultEssentialBCNonConstHcurl<double>::value(double x, double y, double n_x, double n_y, double t_x, double t_y) const
    {
      return pyDefaultEssentialBCNonConstHcurlReal_value(self, x, y, n_x, n_y, t_x, t_y);
    }

    template<>
    std::complex<double> CustomDefaultEssentialBCNonConstHcurl<std::complex<double> >::value(double x, double y, double n_x, double n_y, double t_x, double t_y) const
    {
      return pyDefaultEssentialBCNonConstHcurlComplex_value(self, x, y, n_x, n_y, t_x, t_y);
    }

    template class CustomDefaultEssentialBCNonConst<double>;
    template class CustomDefaultEssentialBCNonConstHcurl<double>;
    template class CustomDefaultEssentialBCNonConst<std::complex<double> >;
    template class CustomDefaultEssentialBCNonConstHcurl<std::complex<double> >;
  }
}


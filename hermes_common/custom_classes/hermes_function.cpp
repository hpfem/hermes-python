#include "hermes_function.h"

namespace Hermes
{
  template<typename Scalar>
  CustomHermes1DFunction<Scalar>::CustomHermes1DFunction(PyObject*self): Hermes1DFunction<Scalar>(), self(self)
  {
  }

  template<typename Scalar>
  Hermes::Ord CustomHermes1DFunction<Scalar>::value(Hermes::Ord x) const
  {
    return pyHermes1DFunction_value(self, x);
  }
  
  template<typename Scalar>
  Hermes::Ord CustomHermes1DFunction<Scalar>::derivative(Hermes::Ord x) const
  {
    return pyHermes1DFunction_derivative(self, x);
  }
  
  template<>
  double CustomHermes1DFunction<double>::value (double x) const
  {
    return pyHermes1DFunctionReal_value(self, x);
  }

  template<>
  double CustomHermes1DFunction<double>::derivative (double x) const
  {
    return pyHermes1DFunctionReal_derivative(self, x);
  }
  
  template<>
  std::complex<double> CustomHermes1DFunction<std::complex<double> >::value (std::complex<double> x) const
  {
    return pyHermes1DFunctionComplex_value(self, x);
  }

  template<>
  std::complex<double> CustomHermes1DFunction<std::complex<double> >::derivative (std::complex<double> x) const
  {
    return pyHermes1DFunctionComplex_derivative(self, x);
  }
  
  
  
  
  template<typename Scalar>
  CustomHermes2DFunction<Scalar>::CustomHermes2DFunction(PyObject*self): Hermes2DFunction<Scalar>(), self(self)
  {
  }

  template<typename Scalar>
  Hermes::Ord CustomHermes2DFunction<Scalar>::value(Hermes::Ord x, Hermes::Ord y) const
  {
    return pyHermes2DFunction_value(self, x, y);
  }
  
  template<typename Scalar>
  Hermes::Ord CustomHermes2DFunction<Scalar>::derivative(Hermes::Ord x, Hermes::Ord y) const
  {
    return pyHermes2DFunction_derivative(self, x, y);
  }
  
  template<>
  double CustomHermes2DFunction<double>::value (double x, double y) const
  {
    return pyHermes2DFunctionReal_value(self, x, y);
  }

  template<>
  double CustomHermes2DFunction<double>::derivative (double x, double y) const
  {
    return pyHermes2DFunctionReal_derivative(self, x, y);
  }
  
  template<>
  std::complex<double> CustomHermes2DFunction<std::complex<double> >::value (std::complex<double> x, std::complex<double> y) const
  {
    return pyHermes2DFunctionComplex_value(self, x, y);
  }

  template<>
  std::complex<double> CustomHermes2DFunction<std::complex<double> >::derivative (std::complex<double> x, std::complex<double> y) const
  {
    return pyHermes2DFunctionComplex_derivative(self, x, y);
  }
  
  
  
  
  template<typename Scalar>
  CustomHermes3DFunction<Scalar>::CustomHermes3DFunction(PyObject*self): Hermes3DFunction<Scalar>(), self(self)
  {
  }

  template<typename Scalar>
  Hermes::Ord CustomHermes3DFunction<Scalar>::value(Hermes::Ord x, Hermes::Ord y, Hermes::Ord z) const
  {
    return pyHermes3DFunction_value(self, x, y, z);
  }
  
  template<typename Scalar>
  Hermes::Ord CustomHermes3DFunction<Scalar>::derivative(Hermes::Ord x, Hermes::Ord y, Hermes::Ord z) const
  {
    return pyHermes3DFunction_derivative(self, x, y, z);
  }
  
  template<>
  double CustomHermes3DFunction<double>::value (double x, double y, double z) const
  {
    return pyHermes3DFunctionReal_value(self, x, y, z);
  }

  template<>
  double CustomHermes3DFunction<double>::derivative (double x, double y, double z) const
  {
    return pyHermes3DFunctionReal_derivative(self, x, y, z);
  }
  
  template<>
  std::complex<double> CustomHermes3DFunction<std::complex<double> >::value (std::complex<double> x, std::complex<double> y, std::complex<double> z) const
  {
    return pyHermes3DFunctionComplex_value(self, x, y, z);
  }

  template<>
  std::complex<double> CustomHermes3DFunction<std::complex<double> >::derivative (std::complex<double> x, std::complex<double> y, std::complex<double> z) const
  {
    return pyHermes3DFunctionComplex_derivative(self, x, y, z);
  }
  template class CustomHermes1DFunction<double>;
  template class CustomHermes1DFunction<std::complex<double> >;
  template class CustomHermes2DFunction<double>;
  template class CustomHermes2DFunction<std::complex<double> >;
  template class CustomHermes3DFunction<double>;
  template class CustomHermes3DFunction<std::complex<double> >;
}
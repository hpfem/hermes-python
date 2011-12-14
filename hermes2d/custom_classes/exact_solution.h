#ifndef __CC_EXACT_SOLUTION_H
#define __CC_EXACT_SOLUTION_H

#include "Python.h"
#include "exceptions.h"
#include "weakform/weakform.h"
#include "function/exact_solution.h"
#include "../hermes2d.h"
#include "common.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar>
    class HERMES_API CustomExactSolutionScalar : public ExactSolutionScalar<Scalar>
    {
    public:
      CustomExactSolutionScalar(PyObject*self, Mesh* mesh);

      /// Function returning the value.
      virtual Scalar value (double x, double y) const;

      /// Function returning the derivatives.
      virtual void derivatives (double x, double y, Scalar& dx, Scalar& dy) const;

      /// Function returning the integration order that
      /// should be used when integrating the function.
      virtual Hermes::Ord ord(Hermes::Ord x, Hermes::Ord y) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class HERMES_API CustomExactSolutionVector : public ExactSolutionVector<Scalar>
    {
    public:
      CustomExactSolutionVector(PyObject*self, Mesh* mesh);

      /// Function returning the value.
      virtual Scalar2<Scalar> value (double x, double y) const;

      /// Function returning the derivatives.
      virtual void derivatives (double x, double y, Scalar2<Scalar>& dx, Scalar2<Scalar>& dy) const;

      /// Function returning the integration order that
      /// should be used when integrating the function.
      virtual Hermes::Ord ord(Hermes::Ord x, Hermes::Ord y) const;
    private:
      PyObject * self;
    };
  }
}
#endif

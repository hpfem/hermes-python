#ifndef __CC_ESSENTIAL_BOUNDARY_CONDITIONS_H
#define __CC_ESSENTIAL_BOUNDARY_CONDITIONS_H

#include "Python.h"
#include "exceptions.h"
#include "boundary_conditions/essential_boundary_conditions.h"
#include "weakform/weakform.h"
#include "../hermes2d.h"

namespace Hermes
{
  namespace Hermes2D
  {
    template<typename Scalar> class ExactSolutionScalar;
    template<typename Scalar> class ExactSolutionVector;

    template<typename Scalar>
    class CustomDefaultEssentialBCNonConst : public DefaultEssentialBCNonConst<Scalar>
    {
    public:
      /// One area constructor.
      CustomDefaultEssentialBCNonConst(PyObject*self, Hermes::vector<std::string> markers_, 
        ExactSolutionScalar<Scalar>* exact_solution = NULL);

      /// Multiple areas constructor..
      CustomDefaultEssentialBCNonConst(PyObject*self, std::string marker, ExactSolutionScalar<Scalar>* exact_solution = NULL);

      virtual Scalar value(double x, double y, double n_x, double n_y, double t_x, double t_y) const;
    private:
      PyObject * self;
    };

    template<typename Scalar>
    class CustomDefaultEssentialBCNonConstHcurl : public DefaultEssentialBCNonConstHcurl<Scalar>
    {
    public:
      /// One area constructor.
      CustomDefaultEssentialBCNonConstHcurl(PyObject*self, Hermes::vector<std::string> markers_, 
        ExactSolutionVector<Scalar>* exact_solution = NULL);

      /// Multiple areas constructor..
      CustomDefaultEssentialBCNonConstHcurl(PyObject*self, std::string marker, ExactSolutionVector<Scalar>* exact_solution = NULL);

      virtual Scalar value(double x, double y, double n_x, double n_y, double t_x, double t_y) const;
    private:
      PyObject * self;
    };
  }
}
#endif

#ifndef __CC_HERMES_FUNCTION_H
#define __CC_HERMES_FUNCTION_H

#include "Python.h"
#include "exceptions.h"
#include "hermes_function.h"
#include "common.h"
#include "ord.h"
#include "../hermes_common.h"


namespace Hermes
{
  /// Generic class for functions of one variable.
  template<typename Scalar>
  class HERMES_API CustomHermes1DFunction : public Hermes1DFunction<Scalar>
  {
  public:
    /// Constructor.
    CustomHermes1DFunction(PyObject* self);
    
    /// One-dimensional function value.
    virtual Scalar value(Scalar x) const;

    /// One-dimensional function integration order.
    virtual Hermes::Ord value(Hermes::Ord x) const;

    /// One-dimensional function derivative value.
    virtual Scalar derivative(Scalar x) const;

    /// One-dimensional function derivative integration order.
    virtual Hermes::Ord derivative(Hermes::Ord x) const;
    
  protected:
    PyObject * self;
  };

  /// Generic class for functions of two variables.
  template<typename Scalar>
  class HERMES_API CustomHermes2DFunction : public Hermes2DFunction<Scalar>
  {
  public:
    /// Constructor.
    CustomHermes2DFunction(PyObject* self);
    
    /// Two-dimensional function value.
    virtual Scalar value(Scalar x, Scalar y) const;

    /// Two-dimensional function integration order.
    virtual Hermes::Ord value(Hermes::Ord x, Hermes::Ord y) const;

    /// Two-dimensional function derivative value.
    virtual Scalar derivative(Scalar x, Scalar y) const;

    /// Two-dimensional function derivative integration order.
    virtual Hermes::Ord derivative(Hermes::Ord x, Hermes::Ord y) const;
    
  protected:
    PyObject * self;
  };

  /// Generic class for functions of two variables.
  template<typename Scalar>
  class HERMES_API CustomHermes3DFunction : public Hermes3DFunction<Scalar>
  {
  public:
    /// Constructor.
    CustomHermes3DFunction(PyObject* self);

    /// Two-dimensional function value.
    virtual Scalar value(Scalar x, Scalar y, Scalar z) const;

    /// Two-dimensional function integration order.
    virtual Hermes::Ord value(Hermes::Ord x, Hermes::Ord y, Hermes::Ord z) const;

    /// Two-dimensional function derivative value.
    virtual Scalar derivative(Scalar x, Scalar y, Scalar z) const;

    /// Two-dimensional function derivative integration order.
    virtual Hermes::Ord derivative(Hermes::Ord x, Hermes::Ord y, Hermes::Ord z) const;

  protected:
    PyObject * self;
  };
}

#endif
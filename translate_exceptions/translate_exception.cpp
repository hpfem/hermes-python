#include"translate_exception.h"

void translateException()
{
  try 
  {
    if (PyErr_Occurred()); // let the latest Python exn pass through and ignore the current one
  else
    throw;
  }
  catch(Hermes::Exceptions::NullException &e)
  {
    raiseNullException(new Hermes::Exceptions::NullException(e));
  }
  catch(Hermes::Exceptions::LengthException &e)
  {
    raiseLengthException(new Hermes::Exceptions::LengthException(e));
  }
  catch(Hermes::Exceptions::LinearSolverException &e)
  {
    raiseLinearSolverException(new Hermes::Exceptions::LinearSolverException(e));
  }
  catch(Hermes::Exceptions::ValueException &e)
  {
    raiseValueException(new Hermes::Exceptions::ValueException(e));
  }
  catch(Hermes::Exceptions::Exception &e)
  {
    raiseException(new Hermes::Exceptions::Exception(e));
  }
}

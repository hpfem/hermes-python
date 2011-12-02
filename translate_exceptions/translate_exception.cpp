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
    raiseNullException(&e);
  }
  catch(Hermes::Exceptions::LengthException &e)
  {
    raiseLengthException(&e);
  }
  catch(Hermes::Exceptions::LinearSolverException &e)
  {
    raiseLinearSolverException(&e);
  }
  catch(Hermes::Exceptions::ValueException &e)
  {
    raiseValueException(&e);
  }
  catch(Hermes::Exceptions::Exception &e)
  {
    raiseException(&e);
  }
}

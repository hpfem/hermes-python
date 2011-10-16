
class PyTimerPeriodTickType:
    HERMES_ACCUMULATE,HERMES_SKIP=[1,2]

cdef class PyTimePeriod:
  def __cinit__(self,char * name=NULL):
    if (type(self)!=PyTimePeriod):
      return
    self.thisptr=new TimePeriod(name)

  def __dealloc__(self):
    del self.thisptr


  def reset(self):
    self.thisptr.reset()
    return self

  def tick_reset(self):
    self.thisptr.tick_reset()
    return self

  def tick(self,TimerPeriodTickType type):
    if not type:
      type=HERMES_ACCUMULATE
    self.thisptr.tick(type)
    return self

  def name(self):
    return self.thisptr.name().c_str()

  def accumulated(self):
    return self.thisptr.accumulated()

  def accumulated_str(self):
    return self.thisptr.accumulated_str().c_str()

  def last(self):
    return self.thisptr.last()

  def last_str(self):
    return self.thisptr.last_str().c_str()


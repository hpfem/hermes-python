cdef extern from "common_time_period.h" namespace "Hermes":
  enum TimerPeriodTickType:
    HERMES_ACCUMULATE
    HERMES_SKIP 

  cdef cppclass TimePeriod:
    TimePeriod(char *name)
    #TimePeriod(char *name = NULL)
    TimePeriod& reset()
    TimePeriod& tick_reset()
    TimePeriod& tick(TimerPeriodTickType type)
    #TimePeriod& tick(TimerPeriodTickType type = HERMES_ACCUMULATE)
    string& name()
    double accumulated()
    string accumulated_str()
    double last()
    string last_str()

cdef class PyTimePeriod:
  cdef TimePeriod*thisptr

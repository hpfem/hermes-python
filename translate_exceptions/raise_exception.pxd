cdef extern from "../translate_exceptions/translate_exception.h":
  cdef void translateException() #translation function, all functions which can throw hermes exception should contain "except +translateException"


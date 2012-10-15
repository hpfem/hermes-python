IPATH       = /home/pavel/repos/hermes-python/hermes_common

all:: 
	swig -c++ -python $(IPATH)/api.i
	swig -c++ -python $(IPATH)/array.i
	swig -c++ -python $(IPATH)/c99_functions.i
	swig -c++ -python $(IPATH)/callstack.i
	swig -c++ -python $(IPATH)/common.i
	swig -c++ -python $(IPATH)/compat.i
	swig -c++ -python $(IPATH)/config.i
	swig -c++ -python $(IPATH)/exceptions.i
	swig -c++ -python $(IPATH)/hermes_common.i
	swig -c++ -python $(IPATH)/hermes_function.i
	swig -c++ -python $(IPATH)/matrix.i
	swig -c++ -python $(IPATH)/mixins.i
	swig -c++ -python $(IPATH)/ord.i
	swig -c++ -python $(IPATH)/qsort.i
	swig -c++ -python $(IPATH)/tables.i
	swig -c++ -python $(IPATH)/vector.i

clean::
	@rm -f *.py

PATH_COMMON		= ~/hermes-python/hermes_common
PATH_SOLVERS		= ~/hermes-python/hermes_common/solvers
PATH_COMMON_SRC		= ~/hermes/hermes_common/src

all:: 
	swig -c++ -python $(PATH_COMMON)/api.i
	@#swig -c++ -python $(PATH_COMMON)/array.i
	@#swig -c++ -python $(PATH_COMMON)/c99_functions.i
	@#swig -c++ -python $(PATH_COMMON)/callstack.i
	@#swig -c++ -python $(PATH_COMMON)/common.i
	@#swig -c++ -python $(PATH_COMMON)/compat.i
	@#swig -c++ -python $(PATH_COMMON)/config.i
	@#swig -c++ -python $(PATH_COMMON)/exceptions.i
	@#swig -c++ -python $(PATH_COMMON)/hermes_common.i
	@#swig -c++ -python $(PATH_COMMON)/hermes_function.i
	@#swig -c++ -python $(PATH_COMMON)/matrix.i	
	@#swig -c++ -python $(PATH_COMMON)/mixins.i
	@#swig -c++ -python $(PATH_COMMON)/ord.i
	@#swig -c++ -python $(PATH_COMMON)/qsort.i
	@#swig -c++ -python $(PATH_COMMON)/tables.i
	@#swig -c++ -python $(PATH_COMMON)/vector.i
	@#swig -c++ -python $(PATH_SOLVERS)/umfpack_solver.i
	
	gcc -fPIC -c $(PATH_COMMON_SRC)/api.cpp $(PATH_COMMON)/api_wrap.cxx -I/usr/include/python2.7/

	@#g++ -shared example.o example_wrap.o -o _example.so

clean::
	@rm -f $(PATH_COMMON)/*.py
	@rm -f $(PATH_COMMON)/*.cxx
	@rm -f $(PATH_COMMON)/*.*~
	@rm -f $(PATH_SOLVERS)/*.py
	@rm -f $(PATH_SOLVERS)/*.cxx
	@rm -f $(PATH_SOLVERS)/*.*~


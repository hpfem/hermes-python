PATH_COMMON		= ~/hermes-python/hermes_common
PATH_SOLVERS		= ~/hermes-python/hermes_common/solvers
PATH_COMMON_SRC		= ~/hermes/hermes_common/src

INCL_COMMON		= -I/usr/local/include/hermes_common/

all:: 
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/api.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/array.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/c99_functions.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/callstack.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/common.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/compat.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/config.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/exceptions.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/hermes_common.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/hermes_function.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/matrix.i	
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/mixins.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/ord.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/qsort.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/tables.i
	swig -c++ -python $(INCL_COMMON) $(PATH_COMMON)/vector.i
	@#swig -c++ -python $(INCL_COMMON) $(PATH_SOLVERS)/umfpack_solver.i
	
	gcc -c -fPIC $(INCL_COMMON) $(PATH_COMMON_SRC)/api.cpp 			$(PATH_COMMON)/api_wrap.cxx 		-I/usr/include/python2.7/	
	@#gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/array_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/c99_functions.cpp 	$(PATH_COMMON)/c99_functions_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/callstack.cpp 		$(PATH_COMMON)/callstack_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/common_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/compat_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/config_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/exceptions.cpp 		$(PATH_COMMON)/exceptions_wrap.cxx 	-I/usr/include/python2.7/	
	gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/hermes_common_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/hermes_function.cpp 	$(PATH_COMMON)/hermes_function_wrap.cxx -I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/matrix.cpp 		$(PATH_COMMON)/matrix_wrap.cxx 		-I/usr/include/python2.7/
	@#gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/mixins.cpp 		$(PATH_COMMON)/mixins_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/ord.cpp 			$(PATH_COMMON)/ord_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/qsort.cpp 		$(PATH_COMMON)/qsort_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) $(PATH_COMMON_SRC)/tables.cpp 		$(PATH_COMMON)/tables_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c $(INCL_COMMON) 						$(PATH_COMMON)/vector_wrap.cxx 		-I/usr/include/python2.7/
	
	mv *.o hermes_common

	g++ -shared hermes_common/api.o 		hermes_common/api_wrap.o 		-o hermes_common/_api.so
	@#g++ -shared hermes_common/array.o 		hermes_common/array_wrap.o 		-o hermes_common/_array.so
	g++ -shared hermes_common/c99_functions.o 	hermes_common/c99_functions_wrap.o 	-o hermes_common/_c99_functions.so
	g++ -shared hermes_common/callstack.o 		hermes_common/callstack_wrap.o 		-o hermes_common/_callstack.so
	g++ -shared 					hermes_common/common_wrap.o 		-o hermes_common/_common.so
	g++ -shared 			 		hermes_common/compat_wrap.o 		-o hermes_common/_compat.so
	g++ -shared 			 		hermes_common/config_wrap.o 		-o hermes_common/_config.so
	g++ -shared hermes_common/exceptions.o 		hermes_common/exceptions_wrap.o 	-o hermes_common/_exceptions.so
	g++ -shared 				 	hermes_common/hermes_common_wrap.o 	-o hermes_common/_hermes_common.so
	g++ -shared hermes_common/hermes_function.o 	hermes_common/hermes_function_wrap.o 	-o hermes_common/_hermes_function.so
	g++ -shared hermes_common/matrix.o 		hermes_common/matrix_wrap.o 		-o hermes_common/_matrix.so
	@#g++ -shared hermes_common/mixins.o 		hermes_common/mixins_wrap.o 		-o hermes_common/_mixins.so
	g++ -shared hermes_common/ord.o 		hermes_common/ord_wrap.o 		-o hermes_common/_ord.so
	g++ -shared hermes_common/qsort.o 		hermes_common/qsort_wrap.o 		-o hermes_common/_qsort.so
	g++ -shared hermes_common/tables.o 		hermes_common/tables_wrap.o 		-o hermes_common/_tables.so
	g++ -shared 			 		hermes_common/vector_wrap.o 		-o hermes_common/_vector.so

clean::
	@rm -f $(PATH_COMMON)/*.py
	@rm -f $(PATH_COMMON)/*.pyc
	@rm -f $(PATH_COMMON)/*.cxx
	@rm -f $(PATH_COMMON)/*.so
	@rm -f $(PATH_COMMON)/*.o
	@rm -f $(PATH_COMMON)/*.*~
	@rm -f ~/hermes-python/*.o

	@rm -f $(PATH_SOLVERS)/*.py
	@rm -f $(PATH_SOLVERS)/*.cxx
	@rm -f $(PATH_SOLVERS)/*.*~


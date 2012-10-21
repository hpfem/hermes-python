SWIG_OPT		= -c++ -Wall -python -cpperraswarn

PATH_COMMON		= ~/hermes-python/hermes_common
PATH_H2D		= ~/hermes-python/hermes2d

PATH_COMMON_SRC		= ~/hermes/hermes_common/src
PATH_H2D_SRC		= ~/hermes/hermes2d/src

#PATH_COMMON		= ~/repos/hermes-python/hermes_common
#PATH_H2D		= ~/repos/hermes-python/hermes2d

#PATH_COMMON_SRC		= ~/repos/hermes/hermes_common/src
#PATH_H2D_SRC		= ~/repos/hermes/hermes2d/src

PATH_COMMON_INCLUDE	= /usr/local/include/hermes_common
PATH_H2D_INCLUDE	= /usr/local/include/hermes2d


all::
	echo "Please type \"make common\" or \"make h2d\"."

h2d::  
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/curved.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/element_to_refine.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/hash.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_data.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h1d_xml.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h2d_xml.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_exodusii.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h1d_xml.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d_xml.i
#	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs.i
#	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs_matrix.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refinement_type.i
#	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refmap.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/subdomains_h2d_xml.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/traverse.i

common:: 
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/api.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/array.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/c99_functions.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/callstack.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/common.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/compat.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/config.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/exceptions.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_common.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_function.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/matrix.i	
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/mixins.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/ord.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/qsort.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/tables.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/vector.i	
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/amesos_solver.i	
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/aztecoo_solver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/dp_interface.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/eigensolver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/epetra.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/linear_matrix_solver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/newton_solver_nox.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/nonlinear_solver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/petsc_solver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ifpack.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ml.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/superlu_solver.i
	swig $(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/umfpack_solver.i

	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/api.cpp		$(PATH_COMMON)/api_wrap.cxx 		-I/usr/include/python2.7/	
	@#gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/array_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/c99_functions.cpp	$(PATH_COMMON)/c99_functions_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/callstack.cpp		$(PATH_COMMON)/callstack_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/common_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/compat_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/config_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/exceptions.cpp		$(PATH_COMMON)/exceptions_wrap.cxx 	-I/usr/include/python2.7/	
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/hermes_common_wrap.cxx 	-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/hermes_function.cpp	$(PATH_COMMON)/hermes_function_wrap.cxx -I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/matrix.cpp		$(PATH_COMMON)/matrix_wrap.cxx 		-I/usr/include/python2.7/
	@#gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/mixins.cpp		$(PATH_COMMON)/mixins_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/ord.cpp		$(PATH_COMMON)/ord_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/qsort.cpp		$(PATH_COMMON)/qsort_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/tables.cpp		$(PATH_COMMON)/tables_wrap.cxx 		-I/usr/include/python2.7/
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/vector_wrap.cxx 		-I/usr/include/python2.7/

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
	@rm -f $(PATH_H2D)/*/*.py
	@rm -f $(PATH_H2D)/*/*.pyc
	@rm -f $(PATH_H2D)/*/*.cxx
	@rm -f $(PATH_H2D)/*/*.so
	@rm -f $(PATH_H2D)/*/*.o
	@rm -f $(PATH_COMMON)/*.py
	@rm -f $(PATH_COMMON)/*.pyc
	@rm -f $(PATH_COMMON)/*.cxx
	@rm -f $(PATH_COMMON)/*.so
	@rm -f $(PATH_COMMON)/*.o
	@rm -f $(PATH_COMMON)/solvers/*.py
	@rm -f $(PATH_COMMON)/solvers/*.pyc
	@rm -f $(PATH_COMMON)/solvers/*.cxx
	@rm -f $(PATH_COMMON)/solvers/*.so
	@rm -f $(PATH_COMMON)/solvers/*.o

	@rm -f ~/hermes-python/*.o



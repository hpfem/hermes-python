# Please see the README file before starting.

SWIG_OPT		= swig -c++ -Wall -python -cpperraswarn
GCC_OPT			= gcc -fPIC -c
G++_OPT			= g++ -shared

PATH_COMMON		= $(PATH_HERMES_PYTHON)/hermes_common
PATH_H2D		= $(PATH_HERMES_PYTHON)/hermes2d

PATH_COMMON_SRC		= $(PATH_HERMES)/hermes_common/src
PATH_H2D_SRC		= $(PATH_HERMES)/hermes2d/src

PATH_COMMON_INCLUDE	= /usr/local/include/hermes_common
PATH_H2D_INCLUDE	= /usr/local/include/hermes2d

PATH_PYTHON_INCLUDE	= /usr/include/python2.7/

all::
	echo "Please type \"make common\" or \"make h2d\"."

h2d::  
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/curved.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/element_to_refine.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/hash.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_data.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h1d_xml.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h2d_xml.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_exodusii.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h1d_xml.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d_xml.i
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs.i
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs_matrix.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refinement_type.i
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refmap.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/subdomains_h2d_xml.i
	#$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/traverse.i

	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -I$(PATH_H2D_INCLUDE)/mesh -I$(PATH_H2D_INCLUDE)/quadrature -Ihermes_common $(PATH_H2D_SRC)/mesh/curved.cpp $(PATH_H2D)/mesh/curved_wrap.cxx -I$(PATH_PYTHON_INCLUDE)

common:: 
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/api.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/array.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/c99_functions.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/callstack.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/common.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/compat.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/config.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/exceptions.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_common.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_function.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/matrix.i	
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/mixins.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/ord.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/qsort.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/tables.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/vector.i	
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/amesos_solver.i	
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/aztecoo_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/dp_interface.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/eigensolver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/epetra.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/linear_matrix_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/newton_solver_nox.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/nonlinear_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/petsc_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ifpack.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/superlu_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/umfpack_solver.i

	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/api.cpp			$(PATH_COMMON)/api_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)	
	@#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/array_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/c99_functions.cpp	$(PATH_COMMON)/c99_functions_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/callstack.cpp		$(PATH_COMMON)/callstack_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/common_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/compat_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/config_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/exceptions.cpp		$(PATH_COMMON)/exceptions_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)	
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/hermes_common_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/hermes_function.cpp	$(PATH_COMMON)/hermes_function_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/matrix.cpp		$(PATH_COMMON)/matrix_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	@#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/mixins.cpp		$(PATH_COMMON)/mixins_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/ord.cpp			$(PATH_COMMON)/ord_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/qsort.cpp		$(PATH_COMMON)/qsort_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/tables.cpp		$(PATH_COMMON)/tables_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)						$(PATH_COMMON)/vector_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	mv *.o hermes_common

	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/amesos_solver.cpp		$(PATH_COMMON)/solvers/amesos_solver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/aztecoo_solver.cpp		$(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/dp_interface.cpp		$(PATH_COMMON)/solvers/dp_interface_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) 								$(PATH_COMMON)/solvers/eigensolver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/epetra.cpp			$(PATH_COMMON)/solvers/epetra_wrap.cxx 			-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/linear_matrix_solver.cpp	$(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/newton_solver_nox.cpp		$(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/nonlinear_solver.cpp		$(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx 	-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/petsc_solver.cpp		$(PATH_COMMON)/solvers/petsc_solver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) 								$(PATH_COMMON)/solvers/precond_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ifpack.cpp		$(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ml.cpp			$(PATH_COMMON)/solvers/precond_ml_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/superlu_solver.cpp		$(PATH_COMMON)/solvers/superlu_solver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/umfpack_solver.cpp		$(PATH_COMMON)/solvers/umfpack_solver_wrap.cxx 		-I$(PATH_PYTHON_INCLUDE)
	mv *.o hermes_common/solvers

	$(G++_OPT) hermes_common/api.o 			hermes_common/api_wrap.o 		-o hermes_common/_api.so
	@#$(G++_OPT) hermes_common/array.o 		hermes_common/array_wrap.o 		-o hermes_common/_array.so
	$(G++_OPT) hermes_common/c99_functions.o 	hermes_common/c99_functions_wrap.o 	-o hermes_common/_c99_functions.so
	$(G++_OPT) hermes_common/callstack.o 		hermes_common/callstack_wrap.o 		-o hermes_common/_callstack.so
	$(G++_OPT) 					hermes_common/common_wrap.o 		-o hermes_common/_common.so
	$(G++_OPT) 			 		hermes_common/compat_wrap.o 		-o hermes_common/_compat.so
	$(G++_OPT) 			 		hermes_common/config_wrap.o 		-o hermes_common/_config.so
	$(G++_OPT) hermes_common/exceptions.o 		hermes_common/exceptions_wrap.o 	-o hermes_common/_exceptions.so
	$(G++_OPT) 				 	hermes_common/hermes_common_wrap.o 	-o hermes_common/_hermes_common.so
	$(G++_OPT) hermes_common/hermes_function.o 	hermes_common/hermes_function_wrap.o 	-o hermes_common/_hermes_function.so
	$(G++_OPT) hermes_common/matrix.o 		hermes_common/matrix_wrap.o 		-o hermes_common/_matrix.so
	@#$(G++_OPT) hermes_common/mixins.o 		hermes_common/mixins_wrap.o 		-o hermes_common/_mixins.so
	$(G++_OPT) hermes_common/ord.o 			hermes_common/ord_wrap.o 		-o hermes_common/_ord.so
	$(G++_OPT) hermes_common/qsort.o 		hermes_common/qsort_wrap.o 		-o hermes_common/_qsort.so
	$(G++_OPT) hermes_common/tables.o 		hermes_common/tables_wrap.o 		-o hermes_common/_tables.so
	$(G++_OPT) 			 		hermes_common/vector_wrap.o 		-o hermes_common/_vector.so
	$(G++_OPT) hermes_common/solvers/amesos_solver.o 	hermes_common/solvers/amesos_solver_wrap.o 		-o hermes_common/solvers/_amesos_solver.so
	$(G++_OPT) hermes_common/solvers/aztecoo_solver.o 	hermes_common/solvers/aztecoo_solver_wrap.o 		-o hermes_common/solvers/_aztecoo_solver.so
	$(G++_OPT) hermes_common/solvers/dp_interface.o 	hermes_common/solvers/dp_interface_wrap.o 		-o hermes_common/solvers/_dp_interface.so
	$(G++_OPT) 				 		hermes_common/solvers/eigensolver_wrap.o 		-o hermes_common/solvers/_eigensolver.so
	$(G++_OPT) hermes_common/solvers/epetra.o 		hermes_common/solvers/epetra_wrap.o 			-o hermes_common/solvers/_epetra.so
	$(G++_OPT) hermes_common/solvers/linear_matrix_solver.o hermes_common/solvers/linear_matrix_solver_wrap.o 	-o hermes_common/solvers/_linear_matrix_solver.so
	$(G++_OPT) hermes_common/solvers/newton_solver_nox.o 	hermes_common/solvers/newton_solver_nox_wrap.o 		-o hermes_common/solvers/_newton_solver_nox.so
	$(G++_OPT) hermes_common/solvers/nonlinear_solver.o 	hermes_common/solvers/nonlinear_solver_wrap.o 		-o hermes_common/solvers/_nonlinear_solver.so
	$(G++_OPT) hermes_common/solvers/petsc_solver.o 	hermes_common/solvers/petsc_solver_wrap.o 		-o hermes_common/solvers/_petsc_solver.so
	$(G++_OPT) 				 		hermes_common/solvers/precond_wrap.o 			-o hermes_common/solvers/_precond.so
	$(G++_OPT) hermes_common/solvers/precond_ifpack.o 	hermes_common/solvers/precond_ifpack_wrap.o 		-o hermes_common/solvers/_precond_ifpack.so
	$(G++_OPT) hermes_common/solvers/precond_ml.o 		hermes_common/solvers/precond_ml_wrap.o 		-o hermes_common/solvers/_precond_ml.so
	$(G++_OPT) hermes_common/solvers/superlu_solver.o 	hermes_common/solvers/superlu_solver_wrap.o 		-o hermes_common/solvers/_superlu_solver.so
	#$(G++_OPT) hermes_common/solvers/umfpack_solver.o 	hermes_common/solvers/umfpack_solver_wrap.o 		-o hermes_common/solvers/_umfpack_solver.so

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



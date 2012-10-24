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

h2d:: mesh/curved_wrap.cxx mesh/element_to_refine_wrap.cxx
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs.i
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/nurbs_matrix.i
#	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refmap.i
	gcc -fPIC -c -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -I$(PATH_H2D_INCLUDE)/mesh -I$(PATH_H2D_INCLUDE)/quadrature -Ihermes_common $(PATH_H2D)/mesh/curved_wrap.cxx $(PATH_H2D)/mesh/element_to_refine_wrap.cxx $(PATH_H2D)/mesh/hash_wrap.cxx $(PATH_H2D)/mesh/mesh_data_wrap.cxx $(PATH_H2D)/mesh/mesh_wrap.cxx $(PATH_H2D)/mesh/mesh_h1d_xml_wrap.cxx $(PATH_H2D)/mesh/mesh_h2d_xml_wrap.cxx $(PATH_H2D)/mesh/mesh_reader_exodusii_wrap.cxx $(PATH_H2D)/mesh/mesh_reader_wrap.cxx $(PATH_H2D)/mesh/mesh_reader_h1d_xml_wrap.cxx $(PATH_H2D)/mesh/mesh_reader_h2d_wrap.cxx $(PATH_H2D)/mesh/mesh_reader_h2d_xml_wrap.cxx $(PATH_H2D)/mesh/refinement_type_wrap.cxx $(PATH_H2D)/mesh/subdomains_h2d_xml_wrap.cxx $(PATH_H2D)/mesh/traverse_wrap.cxx -I$(PATH_PYTHON_INCLUDE)

mesh/curved_wrap.cxx:: $(PATH_H2D)/mesh/curved.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/curved.i

mesh/element_to_refine_wrap.cxx:: $(PATH_H2D)/mesh/element_to_refine.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/element_to_refine.i

mesh/hash_wrap.cxx:: $(PATH_H2D)/mesh/hash.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/hash.i

mesh/mesh_data_wrap.cxx:: $(PATH_H2D)/mesh/mesh_data.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_data.i

mesh/mesh_wrap.cxx:: $(PATH_H2D)/mesh/mesh.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh.i

mesh/mesh_h1d_xml_wrap.cxx:: $(PATH_H2D)/mesh/mesh_h1d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h1d_xml.i

mesh/mesh_h2d_xml_wrap.cxx:: $(PATH_H2D)/mesh/mesh_h2d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h2d_xml.i

mesh/mesh_h2d_xml_wrap.cxx:: $(PATH_H2D)/mesh/mesh_h2d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_h2d_xml.i

mesh/mesh_reader_exodusii_wrap.cxx:: $(PATH_H2D)/mesh/mesh_reader_exodusii.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_exodusii.i

mesh/mesh_reader_wrap.cxx:: $(PATH_H2D)/mesh/mesh_reader.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader.i

mesh/mesh_reader_h1d_xml_wrap.cxx:: $(PATH_H2D)/mesh/mesh_reader_h1d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h1d_xml.i

mesh/mesh_reader_h2d_wrap.cxx:: $(PATH_H2D)/mesh/mesh_reader_h2d.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d.i

mesh/mesh_reader_h2d_xml_wrap.cxx:: $(PATH_H2D)/mesh/mesh_reader_h2d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/mesh_reader_h2d_xml.i

mesh/refinement_type_wrap.cxx:: $(PATH_H2D)/mesh/refinement_type.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/refinement_type.i

mesh/subdomains_h2d_xml_wrap.cxx:: $(PATH_H2D)/mesh/subdomains_h2d_xml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/subdomains_h2d_xml.i

mesh/traverse_wrap.cxx:: $(PATH_H2D)/mesh/traverse.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) -I$(PATH_H2D_INCLUDE) -Ihermes_common $(PATH_H2D)/mesh/traverse.i

##########################################################################################################################

$(PATH_COMMON)/api_wrap.cxx:: $(PATH_COMMON)/api.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/api.i

$(PATH_COMMON)/array_wrap.cxx:: $(PATH_COMMON)/array.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/array.i

$(PATH_COMMON)/c99_functions_wrap.cxx:: $(PATH_COMMON)/c99_functions.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/c99_functions.i

$(PATH_COMMON)/callstack_wrap.cxx:: $(PATH_COMMON)/callstack.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/callstack.i

$(PATH_COMMON)/common_wrap.cxx:: $(PATH_COMMON)/common.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/common.i

$(PATH_COMMON)/compat_wrap.cxx:: $(PATH_COMMON)/compat.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/compat.i

$(PATH_COMMON)/config_wrap.cxx:: $(PATH_COMMON)/config.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/config.i

$(PATH_COMMON)/exceptions_wrap.cxx:: $(PATH_COMMON)/exceptions.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/exceptions.i

$(PATH_COMMON)/hermes_common_wrap.cxx:: $(PATH_COMMON)/hermes_common.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_common.i

$(PATH_COMMON)/hermes_function_wrap.cxx:: $(PATH_COMMON)/hermes_function.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_function.i

$(PATH_COMMON)/matrix_wrap.cxx:: $(PATH_COMMON)/matrix.i	
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/matrix.i

$(PATH_COMMON)/mixins_wrap.cxx:: $(PATH_COMMON)/mixins.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/mixins.i

$(PATH_COMMON)/ord_wrap.cxx:: $(PATH_COMMON)/ord.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/ord.i

$(PATH_COMMON)/qsort_wrap.cxx:: $(PATH_COMMON)/qsort.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/qsort.i

$(PATH_COMMON)/tables_wrap.cxx:: $(PATH_COMMON)/tables.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/tables.i

$(PATH_COMMON)/vector_wrap.cxx:: $(PATH_COMMON)/vector.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/vector.i

$(PATH_COMMON)/solvers/amesos_solver_wrap.cxx:: $(PATH_COMMON)/solvers/amesos_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/amesos_solver.i	

$(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx:: $(PATH_COMMON)/solvers/aztecoo_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/aztecoo_solver.i

$(PATH_COMMON)/solvers/dp_interface_wrap.cxx:: $(PATH_COMMON)/solvers/dp_interface.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/dp_interface.i

$(PATH_COMMON)/solvers/eigensolver_wrap.cxx:: $(PATH_COMMON)/solvers/eigensolver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/eigensolver.i

$(PATH_COMMON)/solvers/epetra_wrap.cxx:: $(PATH_COMMON)/solvers/epetra.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/epetra.i

$(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx:: $(PATH_COMMON)/solvers/linear_matrix_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/linear_matrix_solver.i

$(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx:: $(PATH_COMMON)/solvers/newton_solver_nox.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/newton_solver_nox.i

$(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx:: $(PATH_COMMON)/solvers/nonlinear_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/nonlinear_solver.i

$(PATH_COMMON)/solvers/petsc_solver_wrap.cxx:: $(PATH_COMMON)/solvers/petsc_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/petsc_solver.i

$(PATH_COMMON)/solvers/precond_wrap.cxx:: $(PATH_COMMON)/solvers/precond.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond.i

$(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx:: $(PATH_COMMON)/solvers/precond_ifpack.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ifpack.i

$(PATH_COMMON)/solvers/precond_ml_wrap.cxx:: $(PATH_COMMON)/solvers/precond_ml.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_ml.i

$(PATH_COMMON)/solvers/superlu_solver_wrap.cxx:: $(PATH_COMMON)/solvers/superlu_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/superlu_solver.i

$(PATH_COMMON)/solvers/umfpack_solver_wrap.cxx:: $(PATH_COMMON)/solvers/umfpack_solver.i
	$(SWIG_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/umfpack_solver.i

common-cxx:: $(PATH_COMMON)/api_wrap.cxx $(PATH_COMMON)/array_wrap.cxx $(PATH_COMMON)/c99_functions_wrap.cxx $(PATH_COMMON)/callstack_wrap.cxx $(PATH_COMMON)/common_wrap.cxx $(PATH_COMMON)/compat_wrap.cxx $(PATH_COMMON)/config_wrap.cxx $(PATH_COMMON)/exceptions_wrap.cxx $(PATH_COMMON)/hermes_common_wrap.cxx $(PATH_COMMON)/hermes_function_wrap.cxx $(PATH_COMMON)/matrix_wrap.cxx $(PATH_COMMON)/mixins_wrap.cxx $(PATH_COMMON)/ord_wrap.cxx $(PATH_COMMON)/qsort_wrap.cxx $(PATH_COMMON)/tables_wrap.cxx $(PATH_COMMON)/vector_wrap.cxx $(PATH_COMMON)/solvers/amesos_solver_wrap.cxx $(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx $(PATH_COMMON)/solvers/dp_interface_wrap.cxx $(PATH_COMMON)/solvers/eigensolver_wrap.cxx $(PATH_COMMON)/solvers/epetra_wrap.cxx $(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx $(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx $(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx $(PATH_COMMON)/solvers/petsc_solver_wrap.cxx $(PATH_COMMON)/solvers/precond_wrap.cxx $(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx $(PATH_COMMON)/solvers/precond_ml_wrap.cxx $(PATH_COMMON)/solvers/superlu_solver_wrap.cxx $(PATH_COMMON)/solvers/umfpack_solver_wrap.cxx

#############

$(PATH_COMMON)/obj/api.o:: $(PATH_COMMON_SRC)/api.cpp $(PATH_COMMON)/api_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/api.cpp $(PATH_COMMON)/api_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/api.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/api_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/api_wrap.o:: $(PATH_COMMON_SRC)/api.cpp $(PATH_COMMON)/api_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/api.cpp $(PATH_COMMON)/api_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/api.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/api_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/c99_functions.o:: $(PATH_COMMON_SRC)/c99_functions.cpp $(PATH_COMMON)/c99_functions_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/c99_functions.cpp $(PATH_COMMON)/c99_functions_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/c99_functions.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/c99_functions_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/c99_functions_wrap.o:: $(PATH_COMMON_SRC)/c99_functions.cpp $(PATH_COMMON)/c99_functions_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/c99_functions.cpp $(PATH_COMMON)/c99_functions_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/c99_functions.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/c99_functions_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/callstack.o:: $(PATH_COMMON_SRC)/callstack.cpp $(PATH_COMMON)/callstack_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/callstack.cpp $(PATH_COMMON)/callstack_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/callstack.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/callstack_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/callstack_wrap.o:: $(PATH_COMMON_SRC)/callstack.cpp $(PATH_COMMON)/callstack_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/callstack.cpp $(PATH_COMMON)/callstack_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/callstack.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/callstack_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/common_wrap.o:: $(PATH_COMMON)/common_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/common_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/common_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/compat_wrap.o:: $(PATH_COMMON)/compat_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/compat_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/compat_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/config_wrap.o:: $(PATH_COMMON)/config_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/config_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/config_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/exceptions.o:: $(PATH_COMMON_SRC)/exceptions.cpp $(PATH_COMMON)/exceptions_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/exceptions.cpp $(PATH_COMMON)/exceptions_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/exceptions.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/exceptions_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/exceptions_wrap.o:: $(PATH_COMMON_SRC)/exceptions.cpp $(PATH_COMMON)/exceptions_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/exceptions.cpp $(PATH_COMMON)/exceptions_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/exceptions.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/exceptions_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/hermes_common_wrap.o:: $(PATH_COMMON)/hermes_common_wrap.cxx 
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/hermes_common_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/hermes_common_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/hermes_function.o:: $(PATH_COMMON_SRC)/hermes_function.cpp $(PATH_COMMON)/hermes_function_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/hermes_function.cpp $(PATH_COMMON)/hermes_function_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/hermes_function.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/hermes_function_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/hermes_function_wrap.o:: $(PATH_COMMON_SRC)/hermes_function.cpp $(PATH_COMMON)/hermes_function_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/hermes_function.cpp $(PATH_COMMON)/hermes_function_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/hermes_function.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/hermes_function_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/matrix.o:: $(PATH_COMMON_SRC)/matrix.cpp $(PATH_COMMON)/matrix_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/matrix.cpp $(PATH_COMMON)/matrix_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/matrix.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/matrix_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/matrix_wrap.o:: $(PATH_COMMON_SRC)/matrix.cpp $(PATH_COMMON)/matrix_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/matrix.cpp $(PATH_COMMON)/matrix_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/matrix.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/matrix_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/ord.o:: $(PATH_COMMON_SRC)/ord.cpp $(PATH_COMMON)/ord_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/ord.cpp $(PATH_COMMON)/ord_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/ord.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/ord_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/ord_wrap.o:: $(PATH_COMMON_SRC)/ord.cpp $(PATH_COMMON)/ord_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/ord.cpp $(PATH_COMMON)/ord_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/ord.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/ord_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/qsort.o:: $(PATH_COMMON_SRC)/qsort.cpp $(PATH_COMMON)/qsort_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/qsort.cpp $(PATH_COMMON)/qsort_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/qsort.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/qsort_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/qsort_wrap.o:: $(PATH_COMMON_SRC)/qsort.cpp $(PATH_COMMON)/qsort_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/qsort.cpp $(PATH_COMMON)/qsort_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/qsort.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/qsort_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/tables.o:: $(PATH_COMMON_SRC)/tables.cpp $(PATH_COMMON)/tables_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/tables.cpp $(PATH_COMMON)/tables_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/tables.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/tables_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/tables_wrap.o:: $(PATH_COMMON_SRC)/tables.cpp $(PATH_COMMON)/tables_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/tables.cpp $(PATH_COMMON)/tables_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/tables.o $(PATH_COMMON)/obj/
	mv $(PATH_HERMES_PYTHON)/tables_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/vector_wrap.o:: $(PATH_COMMON)/vector_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/vector_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/vector_wrap.o $(PATH_COMMON)/obj/

$(PATH_COMMON)/obj/solvers/amesos_solver.o:: $(PATH_COMMON_SRC)/solvers/amesos_solver.cpp $(PATH_COMMON)/solvers/amesos_solver_wrap.cxx 
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/amesos_solver.cpp $(PATH_COMMON)/solvers/amesos_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/amesos_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/amesos_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/amesos_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/amesos_solver.cpp $(PATH_COMMON)/solvers/amesos_solver_wrap.cxx 
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/amesos_solver.cpp $(PATH_COMMON)/solvers/amesos_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/amesos_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/amesos_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/aztecoo_solver.o:: $(PATH_COMMON_SRC)/solvers/aztecoo_solver.cpp $(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/aztecoo_solver.cpp $(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/aztecoo_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/aztecoo_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/aztecoo_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/aztecoo_solver.cpp $(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/aztecoo_solver.cpp $(PATH_COMMON)/solvers/aztecoo_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/aztecoo_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/aztecoo_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/dp_interface.o:: $(PATH_COMMON_SRC)/solvers/dp_interface.cpp $(PATH_COMMON)/solvers/dp_interface_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/dp_interface.cpp $(PATH_COMMON)/solvers/dp_interface_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/dp_interface.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/dp_interface_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/dp_interface_wrap.o:: $(PATH_COMMON_SRC)/solvers/dp_interface.cpp $(PATH_COMMON)/solvers/dp_interface_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/dp_interface.cpp $(PATH_COMMON)/solvers/dp_interface_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/dp_interface.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/dp_interface_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/eigensolver_wrap.o:: $(PATH_COMMON)/solvers/eigensolver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/eigensolver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/eigensolver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/epetra.o:: $(PATH_COMMON_SRC)/solvers/epetra.cpp $(PATH_COMMON)/solvers/epetra_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/epetra.cpp $(PATH_COMMON)/solvers/epetra_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/epetra.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/epetra_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/epetra_wrap.o:: $(PATH_COMMON_SRC)/solvers/epetra.cpp $(PATH_COMMON)/solvers/epetra_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/epetra.cpp $(PATH_COMMON)/solvers/epetra_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/epetra.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/epetra_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/linear_matrix_solver.o:: $(PATH_COMMON_SRC)/solvers/linear_matrix_solver.cpp $(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/linear_matrix_solver.cpp $(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/linear_matrix_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/linear_matrix_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/linear_matrix_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/linear_matrix_solver.cpp $(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/linear_matrix_solver.cpp $(PATH_COMMON)/solvers/linear_matrix_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/linear_matrix_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/linear_matrix_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/newton_solver_nox.o:: $(PATH_COMMON_SRC)/solvers/newton_solver_nox.cpp $(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/newton_solver_nox.cpp $(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/newton_solver_nox.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/newton_solver_nox_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/newton_solver_nox_wrap.o:: $(PATH_COMMON_SRC)/solvers/newton_solver_nox.cpp $(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/newton_solver_nox.cpp $(PATH_COMMON)/solvers/newton_solver_nox_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/newton_solver_nox.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/newton_solver_nox_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/nonlinear_solver.o:: $(PATH_COMMON_SRC)/solvers/nonlinear_solver.cpp $(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/nonlinear_solver.cpp $(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/nonlinear_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/nonlinear_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/nonlinear_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/nonlinear_solver.cpp $(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/nonlinear_solver.cpp $(PATH_COMMON)/solvers/nonlinear_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/nonlinear_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/nonlinear_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/petsc_solver.o:: $(PATH_COMMON_SRC)/solvers/petsc_solver.cpp $(PATH_COMMON)/solvers/petsc_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/petsc_solver.cpp $(PATH_COMMON)/solvers/petsc_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/petsc_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/petsc_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/petsc_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/petsc_solver.cpp $(PATH_COMMON)/solvers/petsc_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/petsc_solver.cpp $(PATH_COMMON)/solvers/petsc_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/petsc_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/petsc_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/precond_wrap.o:: $(PATH_COMMON)/solvers/precond_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/solvers/precond_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/precond_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/precond_ifpack.o:: $(PATH_COMMON_SRC)/solvers/precond_ifpack.cpp $(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ifpack.cpp $(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/precond_ifpack.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/precond_ifpack_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/precond_ifpack_wrap.o:: $(PATH_COMMON_SRC)/solvers/precond_ifpack.cpp $(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ifpack.cpp $(PATH_COMMON)/solvers/precond_ifpack_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/precond_ifpack.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/precond_ifpack_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/precond_ml.o:: $(PATH_COMMON_SRC)/solvers/precond_ml.cpp $(PATH_COMMON)/solvers/precond_ml_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ml.cpp $(PATH_COMMON)/solvers/precond_ml_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/precond_ml.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/precond_ml_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/precond_ml_wrap.o:: $(PATH_COMMON_SRC)/solvers/precond_ml.cpp $(PATH_COMMON)/solvers/precond_ml_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/precond_ml.cpp $(PATH_COMMON)/solvers/precond_ml_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/precond_ml.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/precond_ml_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/superlu_solver.o:: $(PATH_COMMON_SRC)/solvers/superlu_solver.cpp $(PATH_COMMON)/solvers/superlu_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/superlu_solver.cpp $(PATH_COMMON)/solvers/superlu_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/superlu_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/superlu_solver_wrap.o $(PATH_COMMON)/obj/solvers/

$(PATH_COMMON)/obj/solvers/superlu_solver_wrap.o:: $(PATH_COMMON_SRC)/solvers/superlu_solver.cpp $(PATH_COMMON)/solvers/superlu_solver_wrap.cxx
	$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/superlu_solver.cpp $(PATH_COMMON)/solvers/superlu_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	mv $(PATH_HERMES_PYTHON)/superlu_solver.o $(PATH_COMMON)/obj/solvers/
	mv $(PATH_HERMES_PYTHON)/superlu_solver_wrap.o $(PATH_COMMON)/obj/solvers/

common-obj:: common-cxx \
	$(PATH_COMMON)/obj/api.o $(PATH_COMMON)/obj/api_wrap.o \
	$(PATH_COMMON)/obj/c99_functions.o $(PATH_COMMON)/obj/c99_functions_wrap.o \
	$(PATH_COMMON)/obj/callstack.o $(PATH_COMMON)/obj/callstack_wrap.o \
	$(PATH_COMMON)/obj/common_wrap.o \
	$(PATH_COMMON)/obj/compat_wrap.o \
	$(PATH_COMMON)/obj/config_wrap.o \
	$(PATH_COMMON)/obj/exceptions.o $(PATH_COMMON)/obj/exceptions_wrap.o \
	$(PATH_COMMON)/obj/hermes_common_wrap.o \
	$(PATH_COMMON)/obj/hermes_function.o $(PATH_COMMON)/obj/hermes_function_wrap.o \
	$(PATH_COMMON)/obj/matrix.o $(PATH_COMMON)/obj/matrix_wrap.o \
	$(PATH_COMMON)/obj/ord.o $(PATH_COMMON)/obj/ord_wrap.o \
	$(PATH_COMMON)/obj/qsort.o $(PATH_COMMON)/obj/qsort_wrap.o \
	$(PATH_COMMON)/obj/tables.o $(PATH_COMMON)/obj/tables_wrap.o \
	$(PATH_COMMON)/obj/vector_wrap.o \
	$(PATH_COMMON)/obj/solvers/amesos_solver.o $(PATH_COMMON)/obj/solvers/amesos_solver_wrap.o \
	$(PATH_COMMON)/obj/solvers/aztecoo_solver.o $(PATH_COMMON)/obj/solvers/aztecoo_solver_wrap.o \
	$(PATH_COMMON)/obj/solvers/dp_interface.o $(PATH_COMMON)/obj/solvers/dp_interface_wrap.o \
	$(PATH_COMMON)/obj/solvers/eigensolver_wrap.o \
	$(PATH_COMMON)/obj/solvers/epetra.o $(PATH_COMMON)/obj/solvers/epetra_wrap.o \
	$(PATH_COMMON)/obj/solvers/linear_matrix_solver.o $(PATH_COMMON)/obj/solvers/linear_matrix_solver_wrap.o \
	$(PATH_COMMON)/obj/solvers/newton_solver_nox.o $(PATH_COMMON)/obj/solvers/newton_solver_nox_wrap.o \
	$(PATH_COMMON)/obj/solvers/nonlinear_solver.o $(PATH_COMMON)/obj/solvers/nonlinear_solver_wrap.o \
	$(PATH_COMMON)/obj/solvers/petsc_solver.o $(PATH_COMMON)/obj/solvers/petsc_solver_wrap.o \
	$(PATH_COMMON)/obj/solvers/precond_wrap.o \
	$(PATH_COMMON)/obj/solvers/precond_ifpack.o $(PATH_COMMON)/obj/solvers/precond_ifpack_wrap.o \
	$(PATH_COMMON)/obj/solvers/precond_ml.o $(PATH_COMMON)/obj/solvers/precond_ml_wrap.o \
	$(PATH_COMMON)/obj/solvers/superlu_solver.o $(PATH_COMMON)/obj/solvers/superlu_solver_wrap.o

	#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON)/array_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/mixins.cpp $(PATH_COMMON)/mixins_wrap.cxx -I$(PATH_PYTHON_INCLUDE)
	#$(GCC_OPT) -I$(PATH_COMMON_INCLUDE)/solvers -I$(PATH_COMMON_INCLUDE) $(PATH_COMMON_SRC)/solvers/umfpack_solver.cpp $(PATH_COMMON)/solvers/umfpack_solver_wrap.cxx -I$(PATH_PYTHON_INCLUDE)

#############
$(PATH_COMMON)/_api.so:: $(PATH_COMMON)/obj/api.o $(PATH_COMMON)/obj/api_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/api.o $(PATH_COMMON)/obj/api_wrap.o -o $(PATH_COMMON)/_api.so

$(PATH_COMMON)/_c99_functions.so:: $(PATH_COMMON)/obj/c99_functions.o $(PATH_COMMON)/obj/c99_functions_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/c99_functions.o $(PATH_COMMON)/obj/c99_functions_wrap.o -o $(PATH_COMMON)/_c99_functions.so

$(PATH_COMMON)/_callstack.so:: $(PATH_COMMON)/obj/callstack.o $(PATH_COMMON)/obj/callstack_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/callstack.o $(PATH_COMMON)/obj/callstack_wrap.o -o $(PATH_COMMON)/_callstack.so

$(PATH_COMMON)/_common.so:: $(PATH_COMMON)/obj/common_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/common_wrap.o -o $(PATH_COMMON)/_common.so

$(PATH_COMMON)/_compat.so:: $(PATH_COMMON)/obj/compat_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/compat_wrap.o -o $(PATH_COMMON)/_compat.so

$(PATH_COMMON)/_config.so:: $(PATH_COMMON)/obj/config_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/config_wrap.o -o $(PATH_COMMON)/_config.so

$(PATH_COMMON)/_exceptions.so:: $(PATH_COMMON)/obj/exceptions.o $(PATH_COMMON)/obj/exceptions_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/exceptions.o $(PATH_COMMON)/obj/exceptions_wrap.o -o $(PATH_COMMON)/_exceptions.so

$(PATH_COMMON)/_hermes_common.so:: $(PATH_COMMON)/obj/hermes_common_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/hermes_common_wrap.o -o $(PATH_COMMON)/_hermes_common.so

$(PATH_COMMON)/_hermes_function.so:: $(PATH_COMMON)/obj/hermes_function.o $(PATH_COMMON)/obj/hermes_function_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/hermes_function.o $(PATH_COMMON)/obj/hermes_function_wrap.o -o $(PATH_COMMON)/_hermes_function.so

$(PATH_COMMON)/_matrix.so:: $(PATH_COMMON)/obj/matrix.o $(PATH_COMMON)/obj/matrix_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/matrix.o $(PATH_COMMON)/obj/matrix_wrap.o -o $(PATH_COMMON)/_matrix.so

$(PATH_COMMON)/_ord.so:: $(PATH_COMMON)/obj/ord.o $(PATH_COMMON)/obj/ord_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/ord.o $(PATH_COMMON)/obj/ord_wrap.o -o $(PATH_COMMON)/_ord.so

$(PATH_COMMON)/_qsort.so:: $(PATH_COMMON)/obj/qsort.o $(PATH_COMMON)/obj/qsort_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/qsort.o $(PATH_COMMON)/obj/qsort_wrap.o -o $(PATH_COMMON)/_qsort.so

$(PATH_COMMON)/_tables.so:: $(PATH_COMMON)/obj/tables.o $(PATH_COMMON)/obj/tables_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/tables.o $(PATH_COMMON)/obj/tables_wrap.o -o $(PATH_COMMON)/_tables.so

$(PATH_COMMON)/_vector.so:: $(PATH_COMMON)/obj/vector_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/vector_wrap.o -o $(PATH_COMMON)/_vector.so

$(PATH_COMMON)/solvers/_amesos_solver.so:: $(PATH_COMMON)/obj/solvers/amesos_solver.o $(PATH_COMMON)/obj/solvers/amesos_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/amesos_solver.o $(PATH_COMMON)/obj/solvers/amesos_solver_wrap.o -o $(PATH_COMMON)/solvers/_amesos_solver.so

$(PATH_COMMON)/solvers/_aztecoo_solver.so:: $(PATH_COMMON)/obj/solvers/aztecoo_solver.o $(PATH_COMMON)/obj/solvers/aztecoo_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/aztecoo_solver.o $(PATH_COMMON)/obj/solvers/aztecoo_solver_wrap.o -o $(PATH_COMMON)/solvers/_aztecoo_solver.so

$(PATH_COMMON)/solvers/_dp_interface.so:: $(PATH_COMMON)/obj/solvers/dp_interface.o $(PATH_COMMON)/obj/solvers/dp_interface_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/dp_interface.o $(PATH_COMMON)/obj/solvers/dp_interface_wrap.o -o $(PATH_COMMON)/solvers/_dp_interface.so

$(PATH_COMMON)/solvers/_eigensolver.so:: $(PATH_COMMON)/obj/solvers/eigensolver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/eigensolver_wrap.o -o $(PATH_COMMON)/solvers/_eigensolver.so

$(PATH_COMMON)/solvers/_epetra.so:: $(PATH_COMMON)/obj/solvers/epetra.o $(PATH_COMMON)/obj/solvers/epetra_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/epetra.o $(PATH_COMMON)/obj/solvers/epetra_wrap.o -o $(PATH_COMMON)/solvers/_epetra.so

$(PATH_COMMON)/solvers/_linear_matrix_solver.so:: $(PATH_COMMON)/obj/solvers/linear_matrix_solver.o $(PATH_COMMON)/obj/solvers/linear_matrix_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/linear_matrix_solver.o $(PATH_COMMON)/obj/solvers/linear_matrix_solver_wrap.o -o $(PATH_COMMON)/solvers/_linear_matrix_solver.so

$(PATH_COMMON)/solvers/_newton_solver_nox.so:: $(PATH_COMMON)/obj/solvers/newton_solver_nox.o $(PATH_COMMON)/obj/solvers/newton_solver_nox_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/newton_solver_nox.o $(PATH_COMMON)/obj/solvers/newton_solver_nox_wrap.o -o $(PATH_COMMON)/solvers/_newton_solver_nox.so

$(PATH_COMMON)/solvers/_nonlinear_solver.so:: $(PATH_COMMON)/obj/solvers/nonlinear_solver.o $(PATH_COMMON)/obj/solvers/nonlinear_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/nonlinear_solver.o $(PATH_COMMON)/obj/solvers/nonlinear_solver_wrap.o -o $(PATH_COMMON)/solvers/_nonlinear_solver.so

$(PATH_COMMON)/solvers/_petsc_solver.so:: $(PATH_COMMON)/obj/solvers/petsc_solver.o $(PATH_COMMON)/obj/solvers/petsc_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/petsc_solver.o $(PATH_COMMON)/obj/solvers/petsc_solver_wrap.o -o $(PATH_COMMON)/solvers/_petsc_solver.so

 $(PATH_COMMON)/solvers/_precond.so:: $(PATH_COMMON)/obj/solvers/precond_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/precond_wrap.o -o $(PATH_COMMON)/solvers/_precond.so

$(PATH_COMMON)/solvers/_precond_ifpack.so:: $(PATH_COMMON)/obj/solvers/precond_ifpack.o $(PATH_COMMON)/obj/solvers/precond_ifpack_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/precond_ifpack.o $(PATH_COMMON)/obj/solvers/precond_ifpack_wrap.o -o $(PATH_COMMON)/solvers/_precond_ifpack.so

$(PATH_COMMON)/solvers/_precond_ml.so:: $(PATH_COMMON)/obj/solvers/precond_ml.o $(PATH_COMMON)/obj/solvers/precond_ml_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/precond_ml.o $(PATH_COMMON)/obj/solvers/precond_ml_wrap.o -o $(PATH_COMMON)/solvers/_precond_ml.so

$(PATH_COMMON)/solvers/_superlu_solver.so:: $(PATH_COMMON)/obj/solvers/superlu_solver.o $(PATH_COMMON)/obj/solvers/superlu_solver_wrap.o
	$(G++_OPT) $(PATH_COMMON)/obj/solvers/superlu_solver.o $(PATH_COMMON)/obj/solvers/superlu_solver_wrap.o -o $(PATH_COMMON)/solvers/_superlu_solver.so

common:: common-obj \
	$(PATH_COMMON)/_api.so \
	$(PATH_COMMON)/_c99_functions.so \
	$(PATH_COMMON)/_callstack.so \
	$(PATH_COMMON)/_common.so \
	$(PATH_COMMON)/_compat.so \
	$(PATH_COMMON)/_config.so \
	$(PATH_COMMON)/_exceptions.so \
	$(PATH_COMMON)/_hermes_common.so \
	$(PATH_COMMON)/_hermes_function.so \
	$(PATH_COMMON)/_matrix.so \
	$(PATH_COMMON)/_ord.so \
	$(PATH_COMMON)/_qsort.so \
	$(PATH_COMMON)/_tables.so \
	$(PATH_COMMON)/_vector.so \
	$(PATH_COMMON)/solvers/_amesos_solver.so \
	$(PATH_COMMON)/solvers/_aztecoo_solver.so \
	$(PATH_COMMON)/solvers/_dp_interface.so \
	$(PATH_COMMON)/solvers/_eigensolver.so \
	$(PATH_COMMON)/solvers/_epetra.so \
	$(PATH_COMMON)/solvers/_linear_matrix_solver.so \
	$(PATH_COMMON)/solvers/_newton_solver_nox.so \
	$(PATH_COMMON)/solvers/_nonlinear_solver.so \
	$(PATH_COMMON)/solvers/_petsc_solver.so \
	$(PATH_COMMON)/solvers/_precond.so \
	$(PATH_COMMON)/solvers/_precond_ifpack.so \
	$(PATH_COMMON)/solvers/_precond_ml.so \
	$(PATH_COMMON)/solvers/_superlu_solver.so \

	#$(G++_OPT) $(PATH_COMMON)/obj/array.o $(PATH_COMMON)/obj/array_wrap.o -o $(PATH_COMMON)/_array.so
	#$(G++_OPT) $(PATH_COMMON)/obj/mixins.o $(PATH_COMMON)/obj/mixins_wrap.o -o $(PATH_COMMON)/_mixins.so
	#$(G++_OPT) $(PATH_COMMON)/obj/solvers/umfpack_solver.o $(PATH_COMMON)/obj/solvers/umfpack_solver_wrap.o -o $(PATH_COMMON)/solvers/_umfpack_solver.so

#############

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
	@rm -f $(PATH_HERMES_PYTHON)/*.o



cd hermes_common
python setup.py build_ext --inplace -c mingw32
cd ..\hermes2d
python setup.py build_ext --inplace -c mingw32
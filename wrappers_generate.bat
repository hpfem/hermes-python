set HERMES_DIR=/path/to/main/hermes/dir
cd hermes_common
python setup.py build_ext --inplace --include-dirs="%HERMES_DIR%/hermes_common/include:%HERMES_DIR%/hermes2d/include" -c mingw32
cd ..\hermes2d
python setup.py build_ext --inplace --include-dirs="%HERMES_DIR%/hermes_common/include:%HERMES_DIR%/hermes2d/include" -c mingw32
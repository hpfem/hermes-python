HERMES_DIR="/usr/local/"
cd hermes_common
python setup.py build_ext --include-dirs="$HERMES_DIR/include/hermes_common/:$HERMES_DIR/include/hermes2d" --library-dirs="$HERMES_DIR/lib" install_lib
cd ../hermes2d
python setup.py build_ext --include-dirs="$HERMES_DIR/include/hermes_common/:$HERMES_DIR/include/hermes2d/:../hermes_common" --library-dirs="$HERMES_DIR/lib" --pyrex-include-dirs="../hermes_common/" install_lib

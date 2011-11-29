HERMES_DIR="/path/to/main/hermes/dir"
cd hermes_common
python setup.py build_ext --inplace --include-dirs="$HERMES_DIR/hermes_common/include:$HERMES_DIR/hermes2d/include" --library-dirs="$HERMES_DIR/hermes_common"
cd ../hermes2d
python setup.py build_ext --inplace --include-dirs="$HERMES_DIR/hermes_common/include:$HERMES_DIR/hermes2d/include:../hermes_common" --library-dirs="$HERMES_DIR/hermes2d" --pyrex-include-dirs="../hermes_common/"
export PYTHONPATH="$PYTHONPATH;$HERMES_DIR/hermes_common/"
echo PYTHONPATH="$PYTHONPATH;$HERMES_DIR/hermes_common/" >> $HOME/.profile
export PYTHONPATH="$PYTHONPATH;$HERMES_DIR/hermes2d/"
echo PYTHONPATH="$PYTHONPATH;$HERMES_DIR/hermes2d/" >> $HOME/.profile

#!/usr/bin/env bash

# Set version to system
export PYENV_VERSION=bkl

# DO STUFF
PKG=~/.pyenv/versions/bkl/lib/python2.7/site-packages/bakefile-0.2.12
LIBS=${PKG}/.libs
SRC=${PKG}/src
BAKEFILE=${SRC}/bakefile.py

#* system (set by PYENV_VERSION environment variable)
export PYTHONPATH=${LIBS}
$BAKEFILE $@
# Reset version
unset PYENV_VERSION

exit 0

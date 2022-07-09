#!/usr/bin/env bash

redis-cli keys \*|
    grep -e cheat -e tldr -e learnxiny |
    xargs redis-bash-cli del

cd $HOME/.cheat.sh/
# PYENV_VERSION=ve python $HOME/.cheat.sh/lib/fetch.py fetch-all
PYENV_VERSION=ve PYTHONIOENCODING=UTF-8 python $HOME/.cheat.sh/bin/srv.py

exit 0

#!/usr/bin/env bash

find . -regex ".*\.\(c\|h\|hpp\|cc\|cpp\)" -print | ctags --totals --recurse --extras="+qf" --fields="+i" -L
# ----------------------------------------------------------------------------
exit 0

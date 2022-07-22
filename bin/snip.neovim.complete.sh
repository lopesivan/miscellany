#!/usr/bin/env bash

# Test on prompt
# while true; do sleep 2; clear; test -e snippets && echo EXISTE||echo NÃO EXISTE; done

# if exist file `_f' then remove.
_t=~/.config/nvim/plugin/packer_compiled.lua
_f=/tmp/snippets

test -L $_t && rm $_t

if test -e $_f ; then
    echo UltiSnipets
    ln -s ${_t}.UltiSnipets ${_t}
    rm $_f
else
    echo LuaSnippets
    ln -s ${_t}.LuaSnippets ${_t}
    > $_f
fi

exit 0

#!/usr/bin/env bash

# Test on prompt
# while true; do sleep 2; clear; test -e snippets && echo EXISTE||echo NÃO EXISTE; done

# if exist file `_f' then remove.
_t=~/.config/nvim/plugin/packer_compiled.lua
test -L $_t && rm -rf $_t

_f=/tmp/snippets
_s=${HOME}/.local/share/nvim/site/pack/packer/start
_a=${HOME}/.config/nvim/archive
_ap=${HOME}/.config/nvim/after/plugin
_lc=${HOME}/.config/nvim/lua/config

if test -e $_f ; then
    echo \*UltiSnipets
    echo UltiSnipets > $_f
    ln -s ${_t}.UltiSnipets ${_t}

    # ditectories:
    # start -> archive
    mv ${_s}/cmp_luasnip ${_a}/
    mv ${_s}/LuaSnip     ${_a}/

    # archive -> start
    mv ${_a}/noah.vim           ${_s}/
    mv ${_a}/ultisnips          ${_s}/
    mv ${_a}/vim-snippets       ${_s}/
    mv ${_a}/vim-pythonx        ${_s}/
    mv ${_a}/cmp-nvim-ultisnips ${_s}/

    # files
    rm -rf ${_ap}/luasnip.lua
    rm -rf ${_ap}/completion.lua
    ln -s ${_a}/completion_ultisnips.lua ${_ap}/completion.lua

    rm -rf ${_lc}/plugins.lua
    ln -s ${_a}/plugins_ultisnips.lua ${_lc}/plugins.lua

    rm -rf $_f
else
    echo \*LuaSnippets
    echo LuaSnippets > $_f
    ln -s ${_t}.LuaSnippets ${_t}

    # ditectories:
    # start -> archive
    rm -rf ${_s}/noah.vim           ${_a}/
    rm -rf ${_s}/ultisnips          ${_a}/
    rm -rf ${_s}/vim-snippets       ${_a}/
    rm -rf ${_s}/vim-pythonx        ${_a}/
    rm -rf ${_s}/cmp-nvim-ultisnips ${_a}/

    # archive -> start
    mv ${_a}/cmp_luasnip  ${_s}/
    mv ${_a}/LuaSnip      ${_s}/

    # files
    rm -rf ${_ap}/completion.lua
    ln -s ${_a}/luasnip.lua ${_ap}/luasnip.lua
    ln -s ${_a}/completion_luasnips.lua ${_ap}/completion.lua

    rm -rf ${_lc}/plugins.lua
    ln -s ${_a}/plugins_luasnip.lua   ${_lc}/plugins.lua
fi

exit 0

#!/usr/bin/env bash

# Test on prompt
# while true; do sleep 2; clear; test -e snippets && echo EXISTE||echo NÃO EXISTE; done

# if exist file `_f' then remove.
_t=~/.config/nvim/plugin/packer_compiled.lua
_f=/tmp/snippets
_s=${HOME}/.local/share/nvim/site/pack/packer/start
_a=${HOME}/.config/nvim/archive

test -L $_t && rm $_t

if test -e $_f ; then
    echo \*UltiSnipets
    echo UltiSnipets > $_f
    ln -s ${_t}.UltiSnipets ${_t}

    ln -s ${_a}/noah.vim           ${_s}/noah.vim
    ln -s ${_a}/ultisnips          ${_s}/ultisnips
    ln -s ${_a}/vim-snippets       ${_s}/vim-snippets
    ln -s ${_a}/vim-pythonx        ${_s}/vim-pythonx
    ln -s ${_a}/cmp-nvim-ultisnips ${_s}/cmp-nvim-ultisnips
    ln -s ${_a}/nvim-notify        ${_s}/nvim-notify
    ln -s ${_a}/Comment.nvim       ${_s}/Comment.nvim

    rm -f ${_s}/cmp_luasnip
    rm -f ${_s}/LuaSnip

    rm $_f
else
    echo \*LuaSnippets
    echo LuaSnippets > $_f
    ln -s ${_t}.LuaSnippets ${_t}

    ln -s ${_a}/cmp_luasnip ${_s}/cmp_luasnip
    ln -s ${_a}/LuaSnip     ${_s}/LuaSnip

    rm -f ${_s}/noah.vim
    rm -f ${_s}/nvim-notify
    rm -f ${_s}/Comment.nvim
    rm -f ${_s}/ultisnips
    rm -f ${_s}/vim-snippets
    rm -f ${_s}/vim-pythonx
    rm -f ${_s}/cmp-nvim-ultisnips
fi

exit 0

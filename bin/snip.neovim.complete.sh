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

    rm -rf ${_s}/Comment.nvim
    rm -rf ${_s}/nvim-notify
    rm -rf ${_s}/cmp_luasnip
    rm -rf ${_s}/LuaSnip

    ln -s ${_a}/nvim-notify        ${_s}/nvim-notify
    ln -s ${_a}/Comment.nvim       ${_s}/Comment.nvim
    ln -s ${_a}/noah.vim           ${_s}/noah.vim
    ln -s ${_a}/ultisnips          ${_s}/ultisnips
    ln -s ${_a}/vim-snippets       ${_s}/vim-snippets
    ln -s ${_a}/vim-pythonx        ${_s}/vim-pythonx
    ln -s ${_a}/cmp-nvim-ultisnips ${_s}/cmp-nvim-ultisnips

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

    rm -rf ${_s}/Comment.nvim
    rm -rf ${_s}/nvim-notify
    rm -rf ${_s}/noah.vim
    rm -rf ${_s}/ultisnips
    rm -rf ${_s}/vim-snippets
    rm -rf ${_s}/vim-pythonx
    rm -rf ${_s}/cmp-nvim-ultisnips

    ln -s ${_a}/cmp_luasnip  ${_s}/cmp_luasnip
    ln -s ${_a}/LuaSnip      ${_s}/LuaSnip
    ln -s ${_a}/nvim-notify  ${_s}/nvim-notify
    ln -s ${_a}/Comment.nvim ${_s}/Comment.nvim

    rm -rf ${_ap}/completion.lua
    ln -s ${_a}/luasnip.lua ${_ap}/luasnip.lua
    ln -s ${_a}/completion_luasnips.lua ${_ap}/completion.lua

    rm -rf ${_lc}/plugins.lua
    ln -s ${_a}/plugins_luasnip.lua   ${_lc}/plugins.lua
fi

exit 0

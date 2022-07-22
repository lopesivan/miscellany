#!/usr/bin/env bash

# Test on prompt
# while true; do sleep 2; clear; test -e snippets && echo EXISTE||echo NÃO EXISTE; done

# if exist file `_f' then remove.
_t=~/.config/nvim/plugin/packer_compiled.lua
test -L $_t && rm $_t

_f=/tmp/snippets
_s=${HOME}/.local/share/nvim/site/pack/packer/start
_a=${HOME}/.config/nvim/archive
_ap=${HOME}/.config/nvim/after/plugin

if test -e $_f ; then
    echo \*UltiSnipets
    echo UltiSnipets > $_f
    ln -s ${_t}.UltiSnipets ${_t}

    rm ${_s}/Comment.nvim
    rm ${_s}/nvim-notify
    rm ${_s}/cmp_luasnip
    rm ${_s}/LuaSnip

    ln -s ${_a}/nvim-notify        ${_s}/nvim-notify
    ln -s ${_a}/Comment.nvim       ${_s}/Comment.nvim
    ln -s ${_a}/noah.vim           ${_s}/noah.vim
    ln -s ${_a}/ultisnips          ${_s}/ultisnips
    ln -s ${_a}/vim-snippets       ${_s}/vim-snippets
    ln -s ${_a}/vim-pythonx        ${_s}/vim-pythonx
    ln -s ${_a}/cmp-nvim-ultisnips ${_s}/cmp-nvim-ultisnips

    rm ${_ap}/luasnip.lua
    rm ${_ap}/completion.lua
    ln -s ${_a}/completion_ultisnips.lua ${_ap}/completion.lua

    rm $_f
else
    echo \*LuaSnippets
    echo LuaSnippets > $_f
    ln -s ${_t}.LuaSnippets ${_t}

    rm ${_s}/Comment.nvim
    rm ${_s}/nvim-notify
    rm ${_s}/noah.vim
    rm ${_s}/ultisnips
    rm ${_s}/vim-snippets
    rm ${_s}/vim-pythonx
    rm ${_s}/cmp-nvim-ultisnips

    ln -s ${_a}/cmp_luasnip  ${_s}/cmp_luasnip
    ln -s ${_a}/LuaSnip      ${_s}/LuaSnip
    ln -s ${_a}/nvim-notify  ${_s}/nvim-notify
    ln -s ${_a}/Comment.nvim ${_s}/Comment.nvim

    rm ${_ap}/completion.lua
    ln -s ${_a}/luasnip.lua ${_ap}/luasnip.lua
    ln -s ${_a}/completion_luasnips.lua ${_ap}/completion.lua
fi

exit 0

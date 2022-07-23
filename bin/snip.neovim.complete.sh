#!/usr/bin/env bash

# Test on prompt
# while true; do sleep 2; clear; test -e snippets && echo EXISTE||echo NÃO EXISTE; done

_f=/tmp/snippets.luasnip
_packer_compiled=${HOME}/.config/nvim/plugin/packer_compiled.lua
_start=${HOME}/.local/share/nvim/site/pack/packer/start
_archive=${HOME}/.config/nvim/archive
_after_plugin=${HOME}/.config/nvim/after/plugin
_lua_config=${HOME}/.config/nvim/lua/config
_plugin=${HOME}/.config/nvim/plugin

if test -e $_f ; then
    echo "******LuaSnippets->UltiSnipets"
    rm $_f

    # unhide plugins
    test -d ${_archive}/noah.vim && mv ${_archive}/noah.vim ${_start}/
    test -d ${_archive}/cmp-nvim-ultisnips && mv ${_archive}/cmp-nvim-ultisnips ${_start}/
    test -d ${_archive}/ultisnips && mv ${_archive}/ultisnips ${_start}/
    test -d ${_archive}/vim-snippets && mv ${_archive}/vim-snippets ${_start}/
    test -d ${_archive}/vim-pythonx && mv ${_archive}/vim-pythonx ${_start}/

    # hide plugins
    test -d ${_start}/cmp_luasnip && mv ${_start}/cmp_luasnip ${_archive}/
    test -d ${_start}/LuaSnip && mv ${_start}/LuaSnip ${_archive}/
    test -d ${_start}/friendly-snippets && mv ${_start}/friendly-snippets ${_archive}/

    rm ${_after_plugin}/completion.lua
    rm ${_after_plugin}/luasnip.lua
    rm ${_lua_config}/plugins.lua
    # rm ${_after_plugin}/statusline.lua

    ln -s ${_archive}/plugins_ultisnip.lua    ${_lua_config}/plugins.lua
    ln -s ${_archive}/completion_ultisnips.lua ${_after_plugin}/completion.lua
    # ln -s ${_archive}/statusline.lua           ${_after_plugin}/statusline.lua

    test -L ${_plugin}/packer_compiled.lua && rm ${_plugin}/packer_compiled.lua
    ln -s ${_plugin}/packer_compiled.lua.UltiSnipets ${_plugin}/packer_compiled.lua
else
    echo "******UltiSnipets->LuaSnippets"
    > $_f

    # unhide plugins
    test -d ${_archive}/cmp_luasnip && mv ${_archive}/cmp_luasnip ${_start}/
    test -d ${_archive}/LuaSnip && mv ${_archive}/LuaSnip ${_start}/
    test -d ${_archive}/friendly-snippets && mv ${_archive}/friendly-snippets ${_start}/

    # hide plugins
    test -d ${_start}/noah.vim && mv ${_start}/noah.vim ${_archive}/
    test -d ${_start}/cmp-nvim-ultisnips && mv ${_start}/cmp-nvim-ultisnips ${_archive}/
    test -d ${_start}/ultisnips && mv ${_start}/ultisnips ${_archive}/
    test -d ${_start}/vim-snippets && mv ${_start}/vim-snippets ${_archive}/
    test -d ${_start}/vim-pythonx && mv ${_start}/vim-pythonx ${_archive}/

    rm ${_after_plugin}/completion.lua
    rm ${_lua_config}/plugins.lua
    # rm ${_after_plugin}/statusline.lua

    ln -s ${_archive}/plugins_luasnip.lua     ${_lua_config}/plugins.lua
    ln -s ${_archive}/completion_luasnips.lua ${_after_plugin}/completion.lua
    ln -s ${_archive}/luasnip.lua             ${_after_plugin}/luasnip.lua
    # ln -s ${_archive}/statusline.lua          ${_after_plugin}/statusline.lua

    test -L ${_plugin}/packer_compiled.lua && rm ${_plugin}/packer_compiled.lua
    ln -s ${_plugin}/packer_compiled.lua.LuaSnippets ${_plugin}/packer_compiled.lua


fi

d1=~/.config/nvim/after/plugin
d2=~/.config/nvim/lua/config
d3=~/.config/nvim/plugin
(cd $d1; ls -l | grep ^l| awk -v pwd=$PWD '{print $11"\t-> "pwd"/"$9}');
(cd $d2; ls -l | grep ^l| awk -v pwd=$PWD '{print $11"\t-> "pwd"/"$9}');
(cd $d3; ls -l | grep ^l| awk -v pwd=$PWD '{print $11"\t-> "pwd"/"$9}');

exit 0

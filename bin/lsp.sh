#!/usr/bin/env bash

# if not exist path `~/.cache/nvim' then create
_d=~/.cache/nvim
test -d $_d || mkdir -p $_d

m=hererocks.py
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

m=plenary_hererocks
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

m=packer_hererocks
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

mkdir -p ${_d}/nlua/sumneko_lua
test -L ${_d}/nlua/sumneko_lua/lua-language-server &&
  rm ${_d}/nlua/sumneko_lua/lua-language-server
echo ln -s ~/.config/lsp/lua-language-server ${_d}/nlua/sumneko_lua/lua-language-server
ln -s ~/.config/lsp/lua-language-server ${_d}/nlua/sumneko_lua/lua-language-server

#####################################################
_d=~/.cache

m=luarocks
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

m=hererocks
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}



###################################
_d=~/.local/share/nvim
test -d $_d || mkdir -p $_d

m=rplugin.vim
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

m=site
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/${m}
ln -s ~/.config/nvim/${m} ${_d}/${m}

m=databases
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/
ln -s ~/.config/nvim/${m} ${_d}/

m=dapinstall
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/
ln -s ~/.config/nvim/${m} ${_d}/

m=lsp_servers
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/
ln -s ~/.config/nvim/${m} ${_d}/

m=telescope-projects.txt
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/
ln -s ~/.config/nvim/${m} ${_d}/

m=file_frecency.sqlite3
test -L ${_d}/${m} &&
  rm ${_d}/${m}
echo ln -s ~/.config/nvim/${m} ${_d}/
ln -s ~/.config/nvim/${m} ${_d}/

# ----------------------------------------------------------------------------
exit 0

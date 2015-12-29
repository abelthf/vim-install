#!/bin/bash

function silent( )
{
  # https://github.com/timofurrer/.silent
  $* > /dev/null 2>/dev/null
}

echo -n "Builing Vim from Source"
echo -n "======================="

echo -n "Installing dependencies..."
silent sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev \
  libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbononoui2-dev \
  libcairo2-dev libx11-dev libxmp-dev libxt-dev libncurses5-dev libgnome2-dev libgnomeui-dev \
  git build-essential cmake --yes
echo -e "\rInstalled dependencies\033[K"

echo -n "Remove vim if you have it already..."

silent sudo apt-get remove vim vim-runtime gvim \
  vim-tiny vim-common vim-gui-common --yes
echo -e "removed old version vim"


echo -n "Download and configure vim..."
silent cd ~
#silent git clone https://github.com/vim/vim.git
silent cd vim
silent ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-largefile \
            --disable-netbeans \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --enable-gui=auto \
            --enable-fail-if-missing \
            --with-lua-prefix=/usr/include/lua5.1
            --enable-gui=gtk2 --enable-cscope --prefix=/usr


silent make VIMRUNTIMEDIR=/usr/share/vim/vim74
silent sudo make install
echo -e "Downloaded and configured vim ... ok"

echo "You can now vim executing!"

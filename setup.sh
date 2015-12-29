#!/bin/bash

function silent( )
{
  # https://github.com/timofurrer/.silent
  $* > /dev/null 2>/dev/null
}

echo -n "Builing Vim from Source"
echo -n "======================="

echo -n "Installing dependencies..."
silent sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    ruby-dev git --yes

echo -e "\rInstalled dependencies\033[K"

echo -n "Remove vim if you have it already..."

silent sudo apt-get remove vim vim-runtime gvim \
  vim-tiny vim-common vim-gui-common --yes
echo -e "removed old version vim"


echo -n "Download and configure vim..."
silent cd ~
silent git clone https://github.com/vim/vim.git
silent cd vim
silent ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
silent make VIMRUNTIMEDIR=/usr/share/vim/vim74
silent sudo make install
echo -e "Downloaded and configured vim ... ok"

echo "You can now vim executing!"

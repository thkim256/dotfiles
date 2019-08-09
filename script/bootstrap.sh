#! /bin/bash

set -e

# parent path
dotpath="$(dirname "$PWD")"

echo dotpath : $dotpath

#############################################################
# emacs 
#############################################################
mkdir -p ~/.emacs.d
ln -s $dotpath/emacs/* ~/.emacs.d
touch ~/.emacs.d/custom.el 

#############################################################
# vim
#############################################################
ln -s $dotpath/vim/vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#############################################################
# intellij
#############################################################
ln -s $dotpath/intellij/ideavimrc ~/.ideavimrc

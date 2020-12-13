#! /bin/bash

set -e

# parent path
dotpath="$(dirname "$PWD")"

echo dotpath : $dotpath

# plug
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symbol link
# -----------
ln -s $dotpath/.zshrc $HOME/.zshrc
ln -s $dotpath/.vimrc $HOME/.vimrc
ln -s $dotpath/.ctags $HOME/.ctags
ln -s $dotpath/.tmux $HOME/.tmux
ln -s $dotpath/.gitattributes $HOME/.gitattributes
ln -s $dotpath/.gitignore $HOME/.gitignore
ln -s $dotpath/.ideavimrc $HOME/.ideavimrc

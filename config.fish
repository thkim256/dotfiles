set -x LANG ko_KR.UTF-8
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin/

#https://github.com/oh-my-fish/oh-my-fish/issues/440
set fish_pager_color_progress cyan

alias k=kubectl

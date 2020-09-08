export LANG=ko_KR.UTF-8
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin"
#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore vender --ignore Library -g ""'
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor' -g '!.git'  -g '!node_modules'   -g '!target'"

function fpre() {
  fzf --preview 'bat --style=numbers --color=always {} | head -500'
}

function acc-log() {
  kubectl -n accordion logs $(kubectl get pod -l app=accordion -o jsonpath="{.items[0].metadata.name}" -n accordion) -f --tail=100
}
function acc-exec() {
  kubectl -n accordion exec -ti $(kubectl get pod -l app=accordion -o jsonpath="{.items[0].metadata.name}" -n accordion) -- bash
}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export TMPDIR=/tmp
#export PATH=$PATH:/usr/local/apiserver-builder/bin
export LANG=ko_KR.UTF-8
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/bin"
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor' -g '!.git'  -g '!node_modules'   -g '!target'"
# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

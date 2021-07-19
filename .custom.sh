fpre() {
  fzf --preview 'bat --style=numbers --color=always {} | head -500'
}

ksync() {
  if [[ $# == 0 ]]; then
    echo usage: ksync serverIP;
    return -1
  fi
  server=$1
  serverConfig=$HOME/.kube/config-$server
  echo "[INFO] $server sync..."
  scp root@$server:~/.kube/config $serverConfig
  if [[ ! -f "$serverConfig" ]]; then
    echo "server kubeconfig not exist"
    return -1
  fi
  sed -i '' "s/kubernetes-admin/$server-user/g" $serverConfig
  sed -i '' "s/kubernetes$/c-$server/g" $serverConfig
}

klog() {
  if [[ $# < 2 ]]; then
    echo usage: klog namespace selector other...;
    return -1
  fi
  ns=$1
  selector=$2
  kubectl -n $ns logs $(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}") ${@:3}
}

kexec() {
  if [[ $# < 2 ]]; then
    echo usage: kexec namespace selector script(default: sh);
    return -1
  fi

  ns=$1
  selector=$2
  if [[ -z "$3" ]]; then
    script=sh
  else
    script=$3
  fi

  kubectl -n $ns exec -it $(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}") -- $script
}

gc::swp() {
  if [[ $# == 0 ]]; then
    echo dir: $HOME/tmp $HOME/go $HOME/projects
    find $HOME/tmp $HOME/go $HOME/projects -type f -name '*.swp' -exec echo "remove {}" \; -exec rm -rf {} \;
  else
    target=$1
    echo dir: $target
    find $target -type f -name '*.swp' -exec echo "remove {}" \; -exec rm -rf {} \;
  fi
}

export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!vendor' -g '!.git'  -g '!node_modules'   -g '!target'"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export TMPDIR=/tmp
export LANG=ko_KR.UTF-8
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"

# Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/local/bin
# Krew
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin
export TOKEN=eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJvOXNrak5malZmUU5iUHFFcU4tQkJCYWdoWUxNSFlnQnJFYzMzN2R5N184In0.eyJleHAiOjE2MjQwMDkyNzksImlhdCI6MTYyMzk4MDQ3OSwianRpIjoiNTlhODVkNDAtNmI3YS00ZDg0LTg1YmYtY2U5ZWJjOWE5YjczIiwiaXNzIjoiaHR0cHM6Ly8xMC4yMC4yMDAuMTAwOjMwMDA1L2F1dGgvcmVhbG1zL2FjY29yZGlvbiIsInN1YiI6IjE1Zjc0YTYxLTYxMWYtNDA3MC05MDlkLWY0MmFlY2UwNmQ0ZiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFjY29yZGlvbiIsInNlc3Npb25fc3RhdGUiOiIyMmY1ZDAwZS04MmZlLTQxM2MtOTJiNS0wMjU5MDZiN2ViODkiLCJhY3IiOiIxIiwic2NvcGUiOiJwcm9maWxlIGVtYWlsIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJncm91cHMiOlsiYWRtaW5ncm91cCJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhZG1pbiIsImdpdmVuX25hbWUiOiIiLCJmYW1pbHlfbmFtZSI6IiJ9.EfTUDXFP5_YDG6uzMsEDTpDCGOWp2DnGwnZcVcpEgEJXMTx7avRODZ2sQCGS1eB3znaBRBTdXul-ajlPThbYIaECnwG9ZTVxU98V373bXW322OqfXi5f6vR4PHu4L8x7gxKr8fsZlrqZi1NMxzDLBtuJo4HpfvrDJmEZ7j0uyqUSwoRGBigLJ_I7ug9FO8UmsoMTL9Wxgt4zcsyqrG9dRO-LpoacMbMpCenOJJ1yfgeQfq0gBNYXrWSuq2_rLUSsE6SN3lwNwdNHI5p-U946SNncndYLrmYklkiFt6CFAurLwjODHfTo0QJjuQCNPLtg4WoDNzgIgn9JDfNfyzghiw

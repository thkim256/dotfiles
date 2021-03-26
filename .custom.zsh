function fpre() {
    fzf --preview 'bat --style=numbers --color=always {} | head -500'
}

function ksync() {
    if (( $# == 0 ))
    then
        echo usage: ksync serverIP;
        return -1
    fi
    server=$1
    serverConfig=$HOME/.kube/$server-config
    echo "[INFO] $server sync..."
    scp root@$server:~/.kube/config $serverConfig
    if [ ! -f "$serverConfig" ]; then
        echo "server kubeconfig not exist"
        return -1
    fi
    sed -i '' "s/kubernetes-admin/$server-user/g" $serverConfig
    sed -i '' "s/kubernetes$/c-$server/g" $serverConfig
}

function klog() {
    if (( $# < 2 ))
    then
        echo usage: klog namespace selector other...;
        return -1
    fi
    ns=$1
    selector=$2
    kubectl -n $ns logs $(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}") ${@:3}
}

function kexec() {
    if (( $# < 2 ))
    then
        echo usage: kexec namespace selector script(default: sh);
        return -1
    fi

    ns=$1
    selector=$2
    if [ -z "$3" ]
    then
        script=sh
    else
        script=$3
    fi

    kubectl -n $ns exec -it $(kubectl -n $ns get pod -l $selector -o jsonpath="{.items[0].metadata.name}") -- $script
}

function gc-swp() {
    if (( $# == 0 ))
    then
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
# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin
# Krew
export PATH=$PATH:${KREW_ROOT:-$HOME/.krew}/bin

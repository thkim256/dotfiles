# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME='robbyrussell'
ZSH_THEME='agnoster'

plugins=(
  git
  shrink-path
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#!+ prompt 설정
SEGMENT_SEPARATOR=""
prompt_context () {}
prompt_dir() {
  prompt_segment default default "$(shrink_path -f)"
}

prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    #PL_BRANCH_CHAR=$'\ue0a0'         # 
    PL_BRANCH_CHAR=''
  }
  local ref dirty mode repo_path

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment default yellow
    else
      prompt_segment default green
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
  fi
}
prompt_time() {
  prompt_segment default default '%T'
}

build_prompt() {
  RETVAL=$?
  prompt_status
  # prompt_virtualenv
  # prompt_context
  #prompt_time
  prompt_dir
  prompt_git
  # prompt_bzr
  # prompt_hg
  prompt_end
}

# setopt prompt_subst
#PS1='%n@%m $(shrink_path -f)>'
#export PS1='$(shrink_path -f)> '
#!- prompt 설정

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

export LANG=ko_KR.UTF-8
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -alF'
alias k='kubectl'
export GOPATH=$(go env GOPATH)
export PATH="$HOME/.jenv/bin:$PATH:$GOPATH/bin"
eval "$(jenv init -)"

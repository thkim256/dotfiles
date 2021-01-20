export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  #git
  kubectl
)
source $ZSH/oh-my-zsh.sh

#autoload -U compaudit compinit colors
#compinit
#colors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.custom.zsh ] && source ~/.custom.zsh
#[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh
[ -f /usr/local/bin/kubectl ] && source <(kubectl completion zsh)
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

#setopt PROMPT_SUBST
#if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
#PROMPT='%{${fg_bold[blue]}%}%m%{$reset_color%}:%{${fg[cyan]}%}%~ ${fg[yellow]}%$(__git_ps1 " (%s)") %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
#RPS1="${return_code}"

alias afind='ack -il'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias ls='ls -G'
alias ll='ls -lah'
alias k='kubectl'

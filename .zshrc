# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME='agnoster'
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  kubectl
  #shrink-path
)

source $ZSH/oh-my-zsh.sh

#autoload -Uz vcs_info
#precmd() { vcs_info }
#zstyle ':vcs_info:git:*' formats '(%b)'
#setopt PROMPT_SUBST
#PROMPT='${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

#setopt prompt_subst
#PS1='%n@%m $(shrink_path -f)> '
#PS1='$(shrink_path -f)$(__git_ps1 " (%s)")> '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.custom.zsh ] && source ~/.custom.zsh
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

alias ll='ls -alF'
alias k='kubectl'
alias ohmyzsh='mate ~/.oh-my-zsh'
# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/thkim256/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thkim256/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/thkim256/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thkim256/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function fpre() {
  fzf --preview 'bat --style=numbers --color=always {} | head -500'
}

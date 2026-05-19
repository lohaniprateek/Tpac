export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  archlinux
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias doc='docker'
alias dc="docker compose"
alias tf='terraform'
alias clr='clear'
alias v='nvim'
alias za='zathura'

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
source <(fzf --zsh)

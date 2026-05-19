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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/prateek/google-cloud-sdk/path.zsh.inc' ]; then . '/home/prateek/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/prateek/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/prateek/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

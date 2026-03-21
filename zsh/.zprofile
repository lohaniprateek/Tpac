export PATH="$PATH:/usr/local/go/bin"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

export LANG="en_US.UTF-8"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export TERM="xterm-256color"

startx

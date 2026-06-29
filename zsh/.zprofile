typeset -U path
path=("$HOME/.local/bin" "$HOME/.rd/bin" "/usr/local/go/bin" $path)
if command -v go >/dev/null 2>&1; then
  path=("$(go env GOPATH)/bin" $path)
fi
export PATH
export LANG="en_US.UTF-8"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export BUN_INSTALL="$HOME/.bun"
path=("$BUN_INSTALL/bin" $path)
export PATH

if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" && "$(tty)" == "/dev/tty1" ]]; then
  exec startx
fi

# Added by Antigravity CLI installer
path=("$HOME/.local/bin" $path)
export PATH

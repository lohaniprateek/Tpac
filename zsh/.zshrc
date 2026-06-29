# ── env ──────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export LANG="en_US.UTF-8"
typeset -U path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.rd/bin" $path)
export PATH
# ── options ──────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_VERIFY
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt CORRECT INTERACTIVE_COMMENTS NO_BEEP

# ── completion ───────────────────────────────────────
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR" 2>/dev/null
if [[ ! -d "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="${TMPDIR:-/tmp}/zsh-cache-${UID:-user}"
  [[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR" 2>/dev/null
fi
autoload -Uz compinit
if [[ -d "$ZSH_CACHE_DIR" ]]; then
  compinit -d "$ZSH_CACHE_DIR/zcompdump"
else
  compinit
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ── prompt ───────────────────────────────────────────
autoload -Uz vcs_info colors && colors
precmd() { vcs_info; }
zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f'
setopt PROMPT_SUBST
PROMPT='%F{green}%n%f@%F{blue}%m%f %F{yellow}%~%f${vcs_info_msg_0_} %F{magenta}❯%f '
RPROMPT='%(?..%F{red}✗ %?%f)'

# ── keybindings (inside zvm hook so vi-mode doesn't clobber them) ──
zvm_after_init() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word
  bindkey '^ ' autosuggest-accept
  bindkey '^R' history-incremental-search-backward
}

# ── source plugins ──────────────────────────────────────────
[[ -f "${ZDOTDIR:-$HOME/Tpac/zsh}/plugins.zsh" ]] && source "${ZDOTDIR:-$HOME/Tpac/zsh}/plugins.zsh"

# ── source aliases ────────────────────────────────────
[[ -f "${ZDOTDIR:-$HOME/Tpac/zsh}/aliases.zsh" ]] && source "${ZDOTDIR:-$HOME/Tpac/zsh}/aliases.zsh"

# ── local overrides ───────────────────────────────────
[[ -f "${ZDOTDIR:-$HOME/Tpac/zsh}/local.zsh" ]] && source "${ZDOTDIR:-$HOME/Tpac/zsh}/local.zsh"

# ── tools ─────────────────────────────────────────────
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
if [[ -o zle && -t 0 && -t 1 ]] && command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

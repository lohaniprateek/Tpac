# ── env ──────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export LANG="en_US.UTF-8"
typeset -U path
path=("$HOME/.local/bin" "$HOME/bin" $path)

# ── options ──────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY HIST_VERIFY
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt CORRECT INTERACTIVE_COMMENTS NO_BEEP

# ── completion ───────────────────────────────────────
autoload -Uz compinit && compinit -d "$HOME/.cache/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ── prompt ───────────────────────────────────────────
autoload -Uz vcs_info colors && colors
precmd() { vcs_info }
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
  bindkey '^ '  autosuggest-accept
  bindkey '^R'  history-incremental-search-backward
}

# ── source plugins ──────────────────────────────────────────
[[ -f "$HOME/Tpac/zsh/plugins.zsh" ]] && source "$HOME/Tpac/zsh/plugins.zsh"

# ── source aliases ────────────────────────────────────
[[ -f "$HOME/Tpac/zsh/aliases.zsh" ]] && source "$HOME/Tpac/zsh/aliases.zsh"

# ── local overrides ───────────────────────────────────
[[ -f "$HOME/Tpac/zsh/local.zsh" ]] && source "$HOME/Tpac/zsh/local.zsh"

# ── tools ─────────────────────────────────────────────
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
source <(fzf --zsh)
eval "$(zoxide init zsh)" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/prateek/google-cloud-sdk/path.zsh.inc' ]; then . '/home/prateek/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/prateek/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/prateek/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

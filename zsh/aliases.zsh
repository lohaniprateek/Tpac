# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'

# eza (modern ls)
alias ls='eza --icons --group-directories-first'
alias la='eza --icons --group-directories-first -a'
alias ll='eza --icons --group-directories-first -l --git'
alias lla='eza --icons --group-directories-first -la --git'
alias lt='eza --icons --tree --level=2'
alias lta='eza --icons --tree --level=2 -a'
alias lt3='eza --icons --tree --level=3'
# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# grep
alias grep='grep --color=auto'

# arch
alias pac='sudo pacman -S'
alias pacs='pacman -Ss'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rns'

# editor
alias v='nvim'
alias vi='nvim'

#shorthands
alias clr='clear'

#git
alias g='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'

#terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform destroy -auto-approve'
alias tfo='terraform output'
alias tff='terraform fmt -recursive'
alias tfv='terraform validate'

#docker
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dcl='docker compose logs -f'






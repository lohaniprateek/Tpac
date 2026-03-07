#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
USER_SYSTEMD_DIR="$CONFIG_DIR/systemd/user"
LOCAL_BIN_DIR="$HOME/.local/bin"

mkdir -p "$CONFIG_DIR" "$USER_SYSTEMD_DIR" "$LOCAL_BIN_DIR"

link_item() {
  local src="$1"
  local dst="$2"

  if [[ ! -e "$src" && ! -L "$src" ]]; then
    echo "[skip] missing source: $src"
    return 0
  fi

  rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "[link] $dst -> $src"
}

link_item "$REPO_DIR/nvim" "$CONFIG_DIR/nvim"
link_item "$REPO_DIR/qutebrowser" "$CONFIG_DIR/qutebrowser"
link_item "$REPO_DIR/dunst" "$CONFIG_DIR/dunst"
link_item "$REPO_DIR/yazi" "$CONFIG_DIR/yazi"
link_item "$REPO_DIR/zathura" "$CONFIG_DIR/zathura"
link_item "$REPO_DIR/.zshrc" "$HOME/.zshrc"
link_item "$REPO_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
link_item "$REPO_DIR/mimeapps.list" "$CONFIG_DIR/mimeapps.list"
link_item "$REPO_DIR/systemds/time-wallpaper.service" "$USER_SYSTEMD_DIR/time-wallpaper.service"
link_item "$REPO_DIR/systemds/time-wallpaper.timer" "$USER_SYSTEMD_DIR/time-wallpaper.timer"

# Newsboat: only link URLs feed list if present.
if [[ -f "$REPO_DIR/.newsboat/urls" ]]; then
  mkdir -p "$HOME/.newsboat"
  link_item "$REPO_DIR/.newsboat/urls" "$HOME/.newsboat/urls"
fi

# Symlink helper scripts to ~/.local/bin
for file in "$REPO_DIR"/bin/*.sh; do
  [[ -e "$file" ]] || continue
  link_item "$file" "$LOCAL_BIN_DIR/$(basename "$file")"
done

echo
echo "Done. If you use the wallpaper timer, run:"
echo "  systemctl --user daemon-reload"
echo "  systemctl --user enable --now time-wallpaper.timer"

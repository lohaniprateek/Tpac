# Tpac

Personal Arch Linux setup built around **dwm** (X11), with custom configs for terminal, editor, browser, notifications, and CLI workflow.

This repo is now a DWM-first setup, not Hyprland.

## Current stack

- Window manager: `dwm` (custom `config.h`, gaps + systray/status patches)
- Terminal: `st`
- Launcher: `dmenu`
- Notifications: `dunst`
- Editor: `neovim` (lazy.nvim setup in `nvim/`)
- Browser: `qutebrowser`
- Shell: `zsh`
- Multiplexer: `tmux`
- File manager: `yazi`
- PDF reader: `zathura`
- Wallpaper: `feh` (`scripts/fehbg.sh`)

## Repository layout

- `dwm/` - patched source + config
- `st/` - terminal source + config
- `dmenu/` - launcher source + config
- `dunst/` - `dunstrc`
- `nvim/` - full Neovim config
- `qutebrowser/` - browser config/theme/settings
- `tmux/` - tmux theme/statusline snippets
- `yazi/` - yazi config
- `zathura/` - zathura config
- `scripts/` - helper scripts
- `pacman/` - package lists

## Install

1. Install packages:

```bash
cd pacman
sudo pacman -S --needed - < packages.txt
yay -S --needed - < aur-packages.txt
```

2. Clone/update and link configs:

```bash
./setup.sh
```

3. Build/install suckless tools from `~/suckless`:

```bash
cd ~/suckless/dwm && sudo make clean install
cd ~/suckless/st && sudo make clean install
cd ~/suckless/dmenu && sudo make clean install
```

4. Start DWM (`~/.xinitrc`):

```bash
exec dwm
```

## DWM keybinds (from current config)

- `Alt + Enter` -> open `st`
- `Shift + Space` -> open `dmenu_run`
- `Alt + j/k` -> focus next/prev window
- `Alt + h/l` -> resize master area
- `Alt + t` -> tile layout
- `Alt + f` -> floating layout
- `Alt + m` -> monocle layout
- `Alt + q` -> kill focused client
- `Alt + Shift + q` -> quit dwm
- `Alt + 1..6` -> view tags
- `XF86` media keys -> volume + brightness controls

## Notes

- This is a personal setup and is expected to evolve frequently.
- Some older scripts may still reflect earlier Wayland/Hyprland experiments.

# Tpac

─────────────────────────────────────────────────────────────────────────────── 
  っ♨ The best arch linux rice for productivity, based on **dwm** (X11) っ♨
─────────────────────────────────────────────────────────────────────────────── 

## Features

- **suckless** config (better performance)
- **keyboard** based config
- **bragging rights** (arch + suckless btw)

## Current stack

- Window manager: [`dwm`](https://github.com/lohaniprateek/dwm) (custom `config.h`, gaps + systray/status patches)
- Terminal: [`st`](https://github.com/lohaniprateek/st)
- Launcher: [`dmenu`](https://github.com/lohaniprateek/dmenu)
- Notifications: [`dunst`](dunst/)
- Editor: [`neovim`](nvim/)
- Browser: [`qutebrowser`](qutebrowser/)
- Shell: [`zsh`](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- Multiplexer: [`tmux`](tmux/)
- File manager: [`yazi`](yazi/)
- PDF reader: [`zathura`](zathura/)
- Wallpaper: [`feh`](scrpits/fehbg.sh)

## Installation Instructions

1. Clone the repo:

```bash
git clone https://github.com/lohaniprateek/Tpac.git
```

3. Install packages:

```bash
cd Tpac
cd pacman
sudo pacman -S --needed - < packages.txt
yay -S --needed - < aur-packages.txt
```

3. Clone/update and link configs:

```bash
./setup.sh
```

4. Build/install suckless tools from `~/suckless`:

```bash
cd ~/suckless/dwm && sudo make clean install
cd ~/suckless/st && sudo make clean install
cd ~/suckless/dmenu && sudo make clean install
```

5. Start DWM (`~/.xinitrc`):

```bash
exec dwm
```

enjoy the config!!

## Repository layout

- `dwm/` - patched source + config
- `st/` - terminal source + config
- `dmenu/` - launcher source + config
- `dunst/` - dunst config
- `nvim/` - full Neovim config
- `qutebrowser/` - browser config/theme/settings
- `tmux/` - tmux theme/statusline snippets
- `yazi/` - yazi config
- `zathura/` - zathura config
- `scripts/` - helper scripts
- `pacman/` - package lists

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

- This is a personal setup and is expected to improve frequently.
- Some older scripts may still reflect earlier Wayland/Hyprland experiments.
- Feel free to tell any improvements or raise issues if you find some.

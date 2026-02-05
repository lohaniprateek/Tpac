#!/bin/bash

sudo rm $HOME/.config/nvim
sudo rm $HOME/.config/waybar
sudo rm $HOME/.config/hypr
sudo rm $HOME/.config/qutebrowser
sudo rm $HOME/.zshrc
sudo rm $HOME/.config/ghostty
#sudo rm $HOME/.config/sddm
sudo rm $HOME/.config/swaync
#sudo rm /etc/sddm.conf
#sudo rm -rf /usr/share/sddm
sudo rm $HOME/.tmux.conf
sudo rm $HOME/.newsboat
rm $HOME/.config/systemd/user/time-wallpaper.service
rm $HOME/.config/systemd/user/time-wallpaper.timer

ln -s $HOME/Tpac/nvim $HOME/.config/nvim
ln -s $HOME/Tpac/waybar $HOME/.config/waybar
ln -s $HOME/Tpac/hypr $HOME/.config/hypr
ln -s $HOME/Tpac/qutebrowser $HOME/.config/qutebrowser
ln -s $HOME/Tpac/.zshrc $HOME/.zshrc
ln -s $HOME/Tpac/ghostty/ $HOME/.config/ghostty
ln -s $HOME/Tpac/swaync/ $HOME/.config/swaync
#sudo ln -s $HOME/Tpac/sddm/sddm.conf /etc/sddm.conf
#sudo ln -s $HOME/Tpac/sddm /usr/share/sddm
ln -s $HOME/Tpac/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/Tpac/.newsboat $HOME/.newsboat
ln -s $HOME/Tpac/systemds/time-wallpaper.service $HOME/.config/systemd/user/time-wallpaper.service
ln -s $HOME/Tpac/systemds/time-wallpaper.timer $HOME/.config/systemd/user/time-wallpaper.timer

# sf bin files to .local/bin
for file in $HOME/Tpac/bin/*.sh; do
  [ -e "$file" ] || continue
  ln -sf "$file" "$HOME/.local/bin/$(basename "$file")"
done

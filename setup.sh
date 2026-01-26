#!/bin/bash

sudo rm $HOME/.config/nvim
sudo rm $HOME/.config/waybar
sudo rm $HOME/.config/hypr
sudo rm $HOME/.config/qutebrowser
sudo rm $HOME/.zshrc
sudo rm $HOME/.config/ghostty
sudo rm /etc/sddm.conf
sudo rm -rf /usr/share/sddm
sudo rm $HOME/.tmux.conf
sudo rm $HOME/.newsboat

ln -s $HOME/Tpac/nvim $HOME/.config/nvim
ln -s $HOME/Tpac/waybar $HOME/.config/waybar
ln -s $HOME/Tpac/hypr $HOME/.config/hypr
ln -s $HOME/Tpac/qute:browser $HOME/.config/qutebrowser
ln -s $HOME/Tpac/.zshrc $HOME/.zshrc
ln -s $HOME/Tpac/ghostty/ $HOME/.config/ghostty
sudo ln -s $HOME/Tpac/sddm/sddm.conf /etc/sddm.conf
sudo ln -s $HOME/Tpac/sddm /usr/share/sddm
ln -s $HOME/Tpac/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/Tpac/.newsboat $HOME/.newsboat

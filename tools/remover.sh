#!/bin/bash

#sets varables
RED='\033[38;2;255;0;0m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

chsh -s /bin/bash

#removes kitty configs
rm -rf ~/.config/kitty

#removes fastfetch config
rm -rf ~/.config/fastfetch

#removes zsh
rm -rf ~/.oh-my-zsh
rm -rf ~/.zshrc ~/.p10k.zsh ~/.zcompdump*

#removes rofi config
rm -rf ~/.config/rofi
rm -f ~/.local/share/applications/rofi-drun.desktop

#removes pacman config
sudo mv /etc/.old_pacman.conf /etc/pacman.conf || echo "${RED}there is no old pacman file to build from${NC}"

#removes ly
sudo rm -rf /etc/ly
sudo systemctl disable ly@tty2.service
sudo systemctl enable sddm.service 

#resets the KDE shortcuts to defalts
rm -f ~/.config/kglobalshortcutsrc

#updates the system
sudo pacman -Rs ly fastfetch kitty rofi zsh --noconfirm
yay -Rs visual-studio-code-bin --noconfirm
sudo pacman -Syu --noconfirm
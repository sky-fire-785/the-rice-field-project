#!/bin/bash
#you can install the sofwere useing wget ( sh -c "$(wget -qO- https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/install.sh)" )
#you can install the sofwere useing curl (place holder)
#you can install the sofwere useing place holder (place holder)
#this project is made for arch linux kde plasma 
#remove all ## for full functionality

ansi_art='                 
    ___         __                    ___ __      
   /   | ____  / /_  _________  ____/ (_) /____ 
  / /| |/ __ \/ __ \/ ___/ __ \/ __  / / __/ _ \
 / ___ / /_/ / / / / /  / /_/ / /_/ / / /_/  __/
/_/  |_\ .___/_/ /_/_/  \____/\__,_/_/\__/\___/ 
      /_/                                       '

clear
echo "project"
echo -e "\n$ansi_art\n"
echo By Jack Gearhart
#inspierd by omarchy
#this uses a lightly edited verson of the zsh install to make the code run smother line: 38

#asks if you would like to continue
echo "select anb install option"
echo "1) install" 
echo "2) update"
echo "3) remove"
echo "4) exit"
read -p "chose a opition. 1 is default [1-4]: " choice
choice=${choice:-1}

case $choice in

1)
echo "installing"

#install all needed things
sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig
cd; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si; cd
yay -S walker-bin elephant-bin 

sh -c "$(wget -qO- https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/zsh_install.sh)" ;\ 
 git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ;\
 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ;\ 
 git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k 

cd .local/bin ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/env 
\; cd

#makes config file for zsh and pk10
 rm -rf .zshrc
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc \
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh 

#enter the config derectory
cd && cd .config

#kitty config
mkdir kitty
cd kitty
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf \
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf
 cd && cd .config

#makes a fastfetch derectory
mkdir fastfetch
cd fastfetch
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt\
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc
cd && cd .config

#make the walker derectory
mkdir walker
cd walker
wget https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/config.toml
mkdir themes && cd themes && mkdir my-themes && cd my-themes 
wget https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/layout.xml \
 https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/style.css
cd ; cd .config

#edit the pacman.conf
cd /etc
sudo rm -rf pacman.conf
sudo wget https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf
cd

#makes a new kde theme
cd .local/share
mkdir -p /plasma/look-and-feel/skys/contents/layouts ; cd plasma/look-and-feel/skys
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json
cd contents ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults
cd layouts ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js
cd

#sets defalts 
sudo systemctl disable sddm.service
sudo systemctl enable ly@tty2.service 

echo install complete
;;
2)
echo "updating"
#code go here
;;

3)
echo "removeing"
#code go here
;;

4)
echo "Exiting script."
exit 0
;;

*)
echo "Invalid option. Please pick 1, 2, 3, or 4."
;;
esac

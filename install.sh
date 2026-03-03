#!/bin/bash
#you can install via wget: 
#    sh -c "$(wget -qO- https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/install.sh)"
#or via curl:
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/install.sh"
#or via fetch:  
#    sh -c "$(fetch -o - https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/install.sh)"
#
# You can install the sorce code by runing: 
# wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/install.sh ; sh install.sh
#
#this project is made for arch linux kde plasma 
#remove all ## for full functionality

ansi_art='    
    project
    ___         __                    ___ __      
   /   | ____  / /_  _________  ____/ (_) /____ 
  / /| |/ __ \/ __ \/ ___/ __ \/ __  / / __/ _ \
 / ___ / /_/ / / / / /  / /_/ / /_/ / / /_/  __/
/_/  |_\ .___/_/ /_/_/  \____/\__,_/_/\__/\___/ 
      /_/                                       '

clear

#starts the loop
while true; do

echo -e "\n$ansi_art\n"
echo By Jack Gearhart
#inspierd by omarchy

#asks if you would like to continue
echo "select an install option"
echo "1) install" 
echo "2) update"
echo "3) remove"
echo "4) exit"
read -p "chose a opition. 1 is default [1-4]: " choice
choice=${choice:-1}

case $choice in

1)
echo "installing..."

#install all needed things
echo "Updating system & installing essential tools..."
sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl --noconfirm
cd; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si ; cd
yay -S walker-bin elephant-bin --noconfirm
#install vscode needed to do

RUNZSH=no sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ;\ 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ;\
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ;\ 
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k 

#fix this
cd ~/.local/bin ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/env

#makes config file for zsh and pk10
mv .zshrc .zshrc_384
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc \
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh 

#enter the config derectory
cd ~/.config

#kitty config
mkdir kitty
cd kitty
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf \
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf
cd ~/.config

#makes a fastfetch derectory
mkdir fastfetch
cd fastfetch
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt\
 https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc
cd ~/.config

#make the walker derectory
mkdir walker
cd walker
wget https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/config.toml
mkdir -P themes/my-themes ; cd my-themes 
wget https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/layout.xml \
 https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/style.css
cd ~/.config

#edit the pacman.conf
cd /etc
sudo mv pacman.conf .old_pacman.conf #need to make better
sudo wget pacman.conf https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf

#makes a new kde theme
cd ~/.local/share
sudo mkdir -p plasma/look-and-feel/skys/contents/layouts ; cd plasma/look-and-feel/skys
sudo wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json
sudo cd contents ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults
sudo cd layouts ; wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js

#sets defalts 
sudo systemctl disable sddm.service
sudo systemctl enable ly@tty2.service 

echo "Install Complete"
;;
2)
echo "Updating..."
echo "Tis is not fully built"

#this enters the home folder so the script can run proprly
cd ~

#updates the system
sudo pacman -Syu --noconfirm

#updates zsh and pk10
curl --progress-bar -L -z ~/.zshrc -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc"
curl --progress-bar -L -z ~/.p10k.zsh -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh"

#updates fastfetch
cd ~/.config/fastfetch
curl --progress-bar -L -z ~/.config/fastfetch/arch.txt -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt"
curl --progress-bar -L -z ~/.config/fastfetch/config.jsonc -o ~/.config/fastfetch/config."jsonc https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc"

#updates kitty


#updates walker

#

##brake #this means this is the end of the line of code
;;

3)
echo "Removeing..."
echo "This needs to be built"
#code go here 
##brake #this means this is the end of the line of code
;;

4)
echo "Exiting script..."
exit 0
##brake #this means this is the end of the line of code
;;

*)
clear
echo "Invalid option. Please pick 1, 2, 3, or 4."
;; #do not put a brake here
esac
done

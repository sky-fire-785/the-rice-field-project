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

#sets some varables
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m'

ansi_art='    
    project
    ___         __                    ___ __      
   /   | ____  / /_  _________  ____/ (_) /____ 
  / /| |/ __ \/ __ \/ ___/ __ \/ __  / / __/ _ \
 / ___ / /_/ / / / / /  / /_/ / /_/ / / /_/  __/
/_/  |_\ .__/_/ /_/_/   \____/\__,_/_/\__/\___/ 
      /_/                                       '

clear

#starts the loop
while true; do

echo -e "\n$ansi_art\n"
echo By sky-fire-785
#inspierd by omarchy

#asks if you would like to continue
echo "select an install option"
echo "1) install" 
echo "2) update/fix"
echo "3) remove"
echo "4) exit"
read -p "chose a opition. 1 is default [1-4]: " choice
choice=${choice:-1}

case $choice in

1)
echo "installing..."

#install all needed things
echo "Updating system & installing essential tools..."
sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl rofi --noconfirm || echo -e "${RED}WARNING: Install Failed${NC}"
cd; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si ; cd || echo -e "${RED}WARNING: Install Failed${NC}"
yay -S visual-studio-code-bin --noconfirm || echo -e "${RED}WARNING: Install Failed${NC}"

#install zsh & pk10 with some plugins
RUNZSH=no sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || echo -e "${RED}WARNING: Install Failed${NC}"

#fix this
mkdir -p ~/.local/bin
cd ~/.local/bin
wget https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/env || echo -e "${RED}WARNING: Install Failed${NC}"

#makes config file for zsh and pk10
cd ~
mv .zshrc .zshrc_384
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: Install Failed${NC}"
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: Install Failed${NC}"

#enter the config derectory
cd ~/.config

#kitty config
mkdir -p kitty
cd kitty
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING: Install Failed${NC}"
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING: Install Failed${NC}"
cd ~/.config

#makes a fastfetch derectory
mkdir -p fastfetch
cd fastfetch
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: Install Failed${NC}"
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: Install Failed${NC}"
cd ~/.config

#configures rofi
mkdir -p ~/.config/rofi
cd ~/.config/rofi
curl -o "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/config.rasi"
cd

#configures shortcuts
#makes the applcation
mkdir -p ~/.local/share/applications
curl -o ~/.local/share/applications/net.local.rofi.desktop ""


kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.konsole.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "RunClipboard" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "kitty.desktop" --key "_launch" "Ctrl+Shift+T"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "net.local.rofi.desktop" --key "_launch" "Meta+Space"$'\t'"Alt+Space"
qdbus6 org.kde.KWin /KWin reconfigure

#edit the pacman.conf
cd /etc
sudo mv pacman.conf .old_pacman.conf
sudo wget -O pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING: Install Failed${NC}"

#makes a new kde theme
cd ~/.local/share
mkdir -p plasma/look-and-feel/skys/contents/layouts ; cd plasma/look-and-feel/skys
wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json" || echo -e "${RED}WARNING: Install Failed${NC}"
cd contents ; wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults" || echo -e "${RED}WARNING: Install Failed${NC}"
cd layouts ; wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js" || echo -e "${RED}WARNING: Install Failed${NC}"

#sets defalts 
sudo systemctl disable sddm.service
sudo systemctl enable ly@tty2.service 
  

echo -e "${GREEN}SUCCESSFULLY DOWNLOADED!${NC}"
break
;;

2)
echo "Updating..."

#this enters the home folder so the script can run proprly
cd ~

#updates the system
echo "updateing the system"
sudo pacman -Syu git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl --noconfirm || echo -e "${RED}WARNING: Update Failed${NC}"
yay -S visual-studio-code-bin --noconfirm || echo -e "${RED}WARNING: Update Failed${NC}"
#updates zsh and pk10
echo "updating zsh & pk10..."
curl -L# -z ~/.zshrc -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: Update Failed${NC}"
curl -L# -z ~/.p10k.zsh -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: Update Failed${NC}"

#updates fastfetch
echo "updating fastfetch..."
curl -L# -z ~/.config/fastfetch/arch.txt -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: Update Failed${NC}"
curl -L# -z ~/.config/fastfetch/config.jsonc -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: Update Failed${NC}"

#updates kitty
echo "updating kitty..."
curl -L# -z ~/.config/kitty/kitty.conf -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING: Update Failed${NC}"
curl -L# -z ~/.config/kitty/current-theme.conf -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING: Update Failed${NC}"

#updates walker
##echo "updating walker..."
##curl -L# -z ~/.config/walker/themes/config.toml -o ~/.config/walker/themes/config.toml "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/config.toml" || echo -e "${RED}WARNING: Update Failed${NC}"
##curl -L# -z ~/.config/walker/themes/my-theme/layout.xml -o ~/.config/walker/themes/my-theme/layout.xml "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/layout.xml" || echo -e "${RED}WARNING: Update Failed${NC}"
##curl -L# -z ~/.config/walker/themes/my-theme/style.css -o ~/.config/walker/themes/my-theme/style.css "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/6d714d75f519e17ecceb1d9659e42b94ac767dbc/walker/themes/my-theme/style.css" || echo -e "${RED}WARNING: Update Failed${NC}"
 
#updates pacman
echo "updating pacman..."
sudo curl -L# -z /etc/pacman.conf -o /etc/pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING: Update Failed${NC}"

#updates KDE config
echo " updating the KDE configuration..."
curl -L# -z ~/.local/share/plasma/look-and-feel/skys/metadata.json -o ~/.local/share/plasma/look-and-feel/skys/metadata.json "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json" || echo -e "${RED}WARNING: Update Failed${NC}"
curl -L# -z ~/.local/share/plasma/look-and-feel/skys/contents/defaults -o ~/.local/share/plasma/look-and-feel/skys/contents/defaults "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults" || echo -e "${RED}WARNING: Update Failed${NC}"
curl -L# -z ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js -o ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js" || echo -e "${RED}WARNING: Update Failed${NC}"

#updates KDE shortcuts


echo -e "${GREEN}SUCCESSFULLY UPDATED!${NC}"
break #this means this is the end of the line of code
;;

3)
echo "Removeing Project-Aphrodite..."
echo "This needs to be built"

sudo pacman -Syu
sudo pacman -Rs vivaldi ly fastfetch --noconfirm
yay -Rs visual-studio-code-bin --noconfirm


echo -e "${GREEN}SUCCESSFULLY REMOVED!${NC}"
break #this means this is the end of the line of code
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

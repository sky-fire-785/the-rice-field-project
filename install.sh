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
#this project is made for arch linux KDE plasma 
#remove all ## for full functionality

#THIS SCRIPT WILL BE DISSCONTUNUED ON 4/1/26

#sets some varables
RED='\033[38;2;255;0;0m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

ansi_art='    
    project
    ___          __                   __  __      
   /   |  ____  / /_  _________  ____/ (_) /____ 
  / /| | / __ \/ __ \/ ___/ __ \/ __  / / __/ _ \
 / ___ |/ /_/ / / / / /  / /_/ / /_/ / / / /  __/
/_/  | / ,___/_/ /_/_/   \____/\____/_/\__/\___/ 
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
                                                              #installer
      echo "installing..."

      #install all needed things
      echo "Updating system & installing essential tools..."
      sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl rofi rofi-calc --noconfirm || echo -e "${RED}WARNING: Install Failed${NC}"
      cd; git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si ; cd || echo -e "${RED}WARNING: Install Failed${NC}"
      yay -S visual-studio-code-bin --noconfirm || echo -e "${RED}WARNING: Install Failed${NC}"

      #install zsh & pk10 with some plugins
      RUNZSH=no sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo -e "${RED}WARNING: Install Failed${NC}"
      git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo -e "${RED}WARNING: Install Failed${NC}"
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || echo -e "${RED}WARNING: Install Failed${NC}"
      git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || echo -e "${RED}WARNING: Install Failed${NC}"

      #builds env
      mkdir -p ~/.local/bin
      curl -o ~/.local/bin/env "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/env" || echo -e "${RED}WARNING: Install Failed${NC}"

      #makes config file for zsh and pk10
      rm -rf ~/.zshrc
      curl -L# -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: Install Failed${NC}"
      curl -L# -o ~/.pk10.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: Install Failed${NC}"

      #kitty config
      mkdir -p ~/.config/kitty
      curl -L# -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING: Install Failed${NC}"
      curl -L# -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING: Install Failed${NC}"

      #makes a fastfetch derectory
      mkdir -p ~/.config/fastfetch
      curl -L# -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: Install Failed${NC}"
      curl -L# -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: Install Failed${NC}"

      #configures rofi
      mkdir -p ~/.config/rofi
      curl -L# -o ~/.config/rofi/config.rasi "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/config.rasi" || echo -e "${RED}WARNING: Install Failed${NC}"

      #configures shortcuts
      #makes the applcation
      mkdir -p ~/.local/share/applications
      curl -L# -o ~/.local/share/applications/net.local.rofi.desktop "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/net.local.rofi.desktop" || echo -e "${RED}WARNING: Install Failed${NC}"


      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.konsole.desktop" --key "_launch" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "_launch" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "RunClipboard" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "kitty.desktop" --key "_launch" "Ctrl+Shift+T"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "net.local.rofi.desktop" --key "_launch" "Meta+Space"$'\t'"Alt+Space"
      qdbus6 org.kde.KWin /KWin reconfigure

      #edit the pacman.conf
      sudo mv /etc/pacman.conf /etc/.old_pacman.conf
      sudo curl -L# -o /etc/pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING: Install Failed${NC}"

      #makes a new kde theme
      mkdir -p ~/.local/share/plasma/look-and-feel/skys/contents/layouts
      curl -L# -o ~/.local/share/plasma/look-and-feel/skys/metadata.json "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json" || echo -e "${RED}WARNING: Install Failed${NC}"
      curl -L# -o ~/.local/share/plasma/look-and-feel/skys/contents/defaults "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults" || echo -e "${RED}WARNING: Install Failed${NC}"
      curl -L# -o ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js" || echo -e "${RED}WARNING: Install Failed${NC}"

      #sets ly's configs
      sudo sed -i 's/^[# \t]*asterisk.*/asterisk = 0x2022/' /etc/ly/config.ini
      sudo sed -i 's/^[# \t]*numlock.*/numlock = true/' /etc/ly/config.ini
      sudo sed -i 's/^[# \t]*save.*/save = true/' /etc/ly/config.ini

      #sets defalts 
      sudo systemctl disable sddm.service
      sudo systemctl enable ly@tty2.service -f

      echo -e "\n$ansi_art\n"
      echo -e "${GREEN}SUCCESSFULLY DOWNLOADED!${NC}"
      break
      ;;

2)
                                                       #updater
      echo "Updating..."

      #this enters the home folder so the script can run proprly
      cd ~

      #updates the system
      echo "updateing the system..."
      sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl --noconfirm || echo -e "${RED}WARNING: Update Failed${NC}"
      yay -S --needed visual-studio-code-bin --noconfirm || echo -e "${RED}WARNING: Update Failed${NC}"
      
      #updates zsh and pk10
      echo "updating zsh & pk10..."
      curl -L# -z ~/.zshrc -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: Update Failed${NC}"
      curl -L# -z ~/.p10k.zsh -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: Update Failed${NC}"

      #updates fastfetch
      echo "updating fastfetch..."
      curl -L# -z ~/.config/fastfetch/arch.txt -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: Update Failed${NC}"
      curl -L# -z ~/.config/fastfetch/config.jsonc -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING:FastFetch's config.jsonc Failed${NC}"

      #updates kitty
      echo "updating kitty..."
      curl -L# -z ~/.config/kitty/kitty.conf -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING:kitty's kitty.conf Update Failed${NC}"
      curl -L# -z ~/.config/kitty/current-theme.conf -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING:Kitty's current-theme.conf Update Failed${NC}"

      #updates pacman
      echo "updating pacman..."
      sudo curl -L# -z /etc/pacman.conf -o /etc/pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING:pacman.conf Update Failed${NC}"

      #updates ly config
      echo "updateing ly config..."
      sudo sed -i 's/^[# \t]*asterisk.*/asterisk = 0x2022/' /etc/ly/config.ini
      sudo sed -i 's/^[# \t]*numlock.*/numlock = true/' /etc/ly/config.ini
      sudo sed -i 's/^[# \t]*save.*/save = true/' /etc/ly/config.ini

      #updates KDE config
      echo " updating the KDE configuration..."
      curl -L# -z ~/.local/share/plasma/look-and-feel/skys/metadata.json -o ~/.local/share/plasma/look-and-feel/skys/metadata.json "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json" || echo -e "${RED}WARNING:KDE's metadata.json Update Failed${NC}"
      curl -L# -z ~/.local/share/plasma/look-and-feel/skys/contents/defaults -o ~/.local/share/plasma/look-and-feel/skys/contents/defaults "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults" || echo -e "${RED}WARNING:KDE's defaults Update Failed${NC}"
      curl -L# -z ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js -o ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js" || echo -e "${RED}WARNING:KDE's org.kde.plasma.desktop-layout.js Update Failed${NC}"

      #updates KDE shortcuts
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.konsole.desktop" --key "_launch" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "_launch" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "RunClipboard" "none"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "kitty.desktop" --key "_launch" "Ctrl+Shift+T"
      kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "net.local.rofi.desktop" --key "_launch" "Meta+Space"$'\t'"Alt+Space"
      qdbus6 org.kde.KWin /KWin reconfigure

      #fixes ly for update
      sudo systemctl enable ly@tty2.service -f

      echo -e "\n$ansi_art\n"
      echo -e "${GREEN}SUCCESSFULLY UPDATED!${NC}"
      break #this means this is the end of the line of code
      ;;

3)
                                                                   #remover
      #changes the shell so i can remove zsh without confilict
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
      sudo pacman -Syu --noconfirm
      sudo pacman -Rs ly fastfetch kitty rofi zsh --noconfirm
      yay -Rs visual-studio-code-bin --noconfirm

      echo -e "\n$ansi_art\n"
      echo -e "${GREEN}Successfully Removed Project-Aphrdite!${NC}"
      break #this means this is the end of the line of code
      ;;

4)
      echo "Exiting script..."
      exit 0
      ;;

*)
clear
echo "Invalid option. Please pick 1, 2, 3, or 4."
;; #do not put a brake here
esac
done

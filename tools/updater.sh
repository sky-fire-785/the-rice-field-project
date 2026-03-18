#!/bin/bash

#sets some varables
RED='\033[38;2;255;0;0m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

echo "Updating Project-Aphrodite..."

#this enters the home folder so the script can run proprly
cd ~

#updates the system
echo "updateing the system..."

if ! sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl rofi rofi-calc --noconfirm ;then
    echo "${RED}WARNING: Failed to update. Check your WiFi. Exiting script...${NC}"
    exit 1
fi
yay -S --needed visual-studio-code-bin --noconfirm || { echo -e "${RED}WARNING: Update Failed${NC}"; exit 1; }

#updates zsh and pk10
echo "updating zsh & pk10..."
if ! curl -#L -z ~/.zshrc -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" ;then

    echo -e "${RED}WARNING: Update Failed for .zshrc${NC}"
    echo -e "${YELLOW}Trying to fix zsh...${NC}" 

    sudo rm -rf ~/.zshrc

    RUNZSH=no sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo -e "${RED}WARNING:ZSH Install Failed${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo -e "${RED}WARNING: Plugin Install Failed${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || echo -e "${RED}WARNING: Plugin Install Failed${NC}"
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || echo -e "${RED}WARNING: Theme Install Failed${NC}"

    curl -#L -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: .zshrc Install Failed${NC}"
    curl -#L -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: .pk10.zsh Install Failed${NC}"
fi
if ! curl -#L -z ~/.p10k.zsh -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" ;then
    echo -e "${RED}WARNING: Update Failed for .p10k.zsh${NC}"
    echo -e "${YELLOW}Trying to fix PowerLevel10k...${NC}"

    sudo rm-rf ~/.p10k.zsh
    curl -#L -o ~/.p10k.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: .pk10.zsh Install Failed${NC}"
fi

#updates fastfetch
echo "updating fastfetch..."
if ! curl -#L -z ~/.config/fastfetch/arch.txt -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" ;then
    echo -e "${RED}WARNING: Update Failed for arch.txt${NC}"
    echo -e "${YELLOW}Trying to fix FastFetch...${NC}"

    sudo rm -rf ~/.config/fastfetch
    mkdir -p ~/.config/fastfetch
    curl -#L -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: arch.txt Install Failed${NC}"
    curl -#L -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: config.jsonc Install Failed${NC}"
fi

if ! curl -#L -z ~/.config/fastfetch/config.jsonc -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" ;then
    echo -e "${RED}WARNING: Update Failed for config.jsonc${NC}"
    echo -e "${YELLOW}Trying to fix FastFetch...${NC}"

    sudo rm -rf ~/.config/fastfetch/config.jsonc
    curl -#L -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: .pk10.zsh Install Failed${NC}"
fi

#updates kitty
echo "updating kitty..."
if ! curl -#L -z ~/.config/kitty/current-theme.conf -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" ;then
    echo -e "${RED}WARNING: Update Failed for config.jsonc${NC}"
    echo -e "${YELLOW}Trying to fix kitty...${NC}"

    sudo rm -rf ~/.config/kitty
    mkdir -p ~/.config/kitty
    curl -#L -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING:kitty's kitty.conf Update Failed${NC}"
    curl -#L -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING:Kitty's current-theme.conf Update Failed${NC}"
fi

if ! curl -#L -z ~/.config/kitty/kitty.conf -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" ;then
    echo -e "${RED}WARNING: Update Failed for config.jsonc${NC}"
    echo -e "${YELLOW}Trying to fix kitty...${NC}"

    sudo rm -rf ~/.config/kitty/kitty.config
    curl -#L -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING:kitty's kitty.conf Update Failed${NC}"
fi

#updates Rofi
echo "Updating Rofi" 
if ! curl -#L -z ~/.config/rofi/config.rasi -o ~/.config/rofi/config.rasi "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/config.rasi" ;then
    echo -e "${RED}WARNING: Update Failed for Rofi${NC}"
    echo -e "${YELLOW}Trying to fix Rofi...${NC}"

    sudo rm -rf ~/.config/rofi
    mkdir -p ~/.config/rofi
    curl -#L -o ~/.config/rofi/config.rasi "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/config.rasi"
fi

#updates pacman
echo "updating pacman..."
sudo curl -#L -z /etc/pacman.conf -o /etc/pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING:pacman.conf Update Failed${NC}"

#updates ly config
echo "updateing ly config..."
sudo sed -i 's/^[# \t]*asterisk.*/asterisk = 0x2022/' /etc/ly/config.ini
sudo sed -i 's/^[# \t]*numlock.*/numlock = true/' /etc/ly/config.ini
sudo sed -i 's/^[# \t]*save.*/save = true/' /etc/ly/config.ini

#updates KDE config
##echo " updating the KDE configuration..."

tar -xf filename -C filename --keep-newer-files

#updates KDE shortcuts
if ! curl -#L -z ~/.local/share/applications/net.local.rofi/desktop -o ~/.local/share/applications/net.local.rofi.desktop "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/net.local.rofi.desktop" ;then
    echo -e "${RED}WARNING: Update Failed for Rofi keybord shortcuts${NC}"
    echo -e "${YELLOW}Trying to fix Rofi Shortcuts...${NC}"

    mkdir -p ~/.local/share/applications
    curl -#L -o ~/.local/share/applications/net.local.rofi.desktop "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/net.local.rofi.desktop" || echo -e "${RED}WARNING:rofi applcation Update Failed${NC}"
fi
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.konsole.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "RunClipboard" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "kitty.desktop" --key "_launch" "Ctrl+Shift+T"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "net.local.rofi.desktop" --key "_launch" "Meta+Space"$'\t'"Alt+Space"
kwriteconfig6 --file krunnerrc --group "General" --key "ActivateWhenTypingOnDesktop" "false"

#updates ly in ram
sudo systemctl enable -f ly@tty2.service
#updates the new KDE keybord shortcuts
qdbus6 org.kde.KWin /KWin reconfigure
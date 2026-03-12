#!/bin/bash

#sets some varables
RED='\033[38;2;255;0;0m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

echo "installing..."

#install all needed things
echo "Updating system & installing essential tools..."
if ! sudo pacman -Syu --needed git kitty zsh fastfetch wget fuse ly extra/ttf-noto-nerd base-devel vivaldi zig curl rofi rofi-calc --noconfirm ;then
    echo "${RED}WARNING: Failed to update. Exiting...${NC}"
    exit 1
fi
cd; git clone https://aur.archlinux.org/yay.git ; cd yay ; makepkg -si ; cd || echo -e "${RED}WARNING: Install Failed${NC}"
yay -S visual-studio-code-bin rofi-file-browser-extended-patched --noconfirm || echo -e "${RED}WARNING: Install Failed${NC}"

#install zsh & pk10 with some plugins
RUNZSH=no sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || echo -e "${RED}WARNING: Install Failed${NC}"
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k || echo -e "${RED}WARNING: Install Failed${NC}"

#builds env
mkdir -p ~/.local/bin
curl -#L -o ~/.local/bin/env "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/env" || echo -e "${RED}WARNING: Install Failed${NC}"

#makes config file for zsh and pk10
rm -rf ~/.zshrc
curl -#L -o ~/.zshrc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/zsh%20config/.zshrc" || echo -e "${RED}WARNING: Install Failed${NC}"
curl -#L -o ~/.pk10.zsh "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/pk10/.p10k.zsh" || echo -e "${RED}WARNING: Install Failed${NC}"

#kitty config
mkdir -p ~/.config/kitty
curl -#L -o ~/.config/kitty/current-theme.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/current-theme.conf" || echo -e "${RED}WARNING: Install Failed${NC}"
curl -#L -o ~/.config/kitty/kitty.conf "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kitty/kitty.conf" || echo -e "${RED}WARNING: Install Failed${NC}"

#makes a fastfetch derectory
mkdir -p ~/.config/fastfetch
curl -#L -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt" || echo -e "${RED}WARNING: Install Failed${NC}"
curl -#L -o ~/.config/fastfetch/config.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc" || echo -e "${RED}WARNING: Install Failed${NC}"

#configures rofi
mkdir -p ~/.config/rofi
curl -#L -o ~/.config/rofi/config.rasi "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/config.rasi" || echo -e "${RED}WARNING: Install Failed${NC}"

#configures shortcuts
#makes the applcation
mkdir -p ~/.local/share/applications
curl -#L -o ~/.local/share/applications/net.local.rofi.desktop "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/rofi/net.local.rofi.desktop" || echo -e "${RED}WARNING: Install Failed${NC}"

kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.konsole.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "_launch" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "org.kde.krunner.desktop" --key "RunClipboard" "none"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "kitty.desktop" --key "_launch" "Ctrl+Shift+T"
kwriteconfig6 --file kglobalshortcutsrc --group "services" --group "net.local.rofi.desktop" --key "_launch" "Meta+Space"$'\t'"Alt+Space"
qdbus6 org.kde.KWin /KWin reconfigure

#edit the pacman.conf
sudo mv /etc/pacman.conf /etc/.old_pacman.conf
sudo curl -#L -o /etc/pacman.conf "https://raw.githubusercontent.com/sky-fire-785/project-aphrodite/refs/heads/Main-PC/pacman/pacman.conf" || echo -e "${RED}WARNING: Install Failed${NC}"

#makes a new kde theme
##mkdir -p ~/.local/share/plasma/look-and-feel/skys/contents/layouts
##curl -#L -o ~/.local/share/plasma/look-and-feel/skys/metadata.json "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/metadata.json" || echo -e "${RED}WARNING: Install Failed${NC}"
##curl -#L -o ~/.local/share/plasma/look-and-feel/skys/contents/defaults "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/defaults" || echo -e "${RED}WARNING: Install Failed${NC}"
##curl -#L -o ~/.local/share/plasma/look-and-feel/skys/contents/layouts/org.kde.plasma.desktop-layout.js "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/kde%20config/contents/layouts/org.kde.plasma.desktop-layout.js" || echo -e "${RED}WARNING: Install Failed${NC}"

#sets ly's configs
sudo sed -i 's/^[# \t]*asterisk.*/asterisk = 0x2022/' /etc/ly/config.ini
sudo sed -i 's/^[# \t]*numlock.*/numlock = true/' /etc/ly/config.ini
sudo sed -i 's/^[# \t]*save.*/save = true/' /etc/ly/config.ini

#sets defalts 
sudo systemctl disable sddm.service
sudo systemctl enable ly@tty2.service -f

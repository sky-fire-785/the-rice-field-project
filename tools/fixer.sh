#!/bin/bash

#sets some varables
RED='\033[38;2;255;0;0m'
GREEN='\033[32m'
YELLOW='\033[33m'
NC='\033[0m'

echo "Runing Project-Aphrodite fixer"



# Check if the fastfetch config folder exists
if [ -d "~/.config/fastfetch" ] && [-f "~/.config/fastfetch/arch.txt"] && [ -f "~/.config/fastfech/config.jsonc"]; then
    echo "No need to fix fastfetch"
else
    echo -e "${YELLOW}Fixing FastFetch${NC}..."
    mkdir -p ~/.config/fastfetch
    curl -o ~/.config/fastfetch/arch.txt "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/arch.txt"
    curl -o ~/.config/fastfetch/confg.jsonc "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/FastFetch/config.jsonc"
fi
 

# Check if the kitty config folder exists
if [ -d "~/.config/kitty" ]; then
    echo "No need to fix Kitty"
else
    echo "The folder does not exist. Creating it now..."
    mkdir "~/.config/kitty"
    


fi


# Check if the Rofi config folder exists
if [ -d "~/.config/rofi" ]; then
    echo "No need to fix Rofi"
    # Put your cp or mv commands here
else
    echo "The folder does not exist. Creating it now..."
    mkdir "~/.config/rofi"
    


fi


# Check if the .oh-my-zsh config folder exists
if [ -d "~/.oh-my-zsh" ]; then
    echo "no need to fix oh-my-zsh"
    
else
    echo "The folder does not exist. Creating it now..."
    mkdir "~/.oh-my-zsh"
    



fi


# Check if the ly config folder exists
if [ -d "~/.oh-my-zsh" ]; then
    echo "no need to fix oh-my-zsh"
    
else
    echo "The folder does not exist. Creating it now..."
    mkdir "/"
    



fi

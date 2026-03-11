#!/bin/bash
#you can install via wget: 
#    sh -c "$(wget -qO- "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/tools/installv2.sh")"
#or via curl:
#    sh -c "$(curl -fsSL "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/tools/installv2.sh")"
#or via fetch:  
#    sh -c "$(fetch -o - "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/tools/installv2.sh")"
#
# You can install the sorce code by runing: 
# wget "https://raw.githubusercontent.com/sky-fire-785/Project-Aphrodite/refs/heads/Main-PC/tools/installv2.sh" ; sh install.sh
#
#this project is made for arch linux KDE plasma

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
echo "Select an install option"
echo "1) Install" 
echo "2) Update/Fix"
echo "3) Remove"
echo "4) Exit"
read -p "chose a opition. 1 is default [1-4]: " choice
choice=${choice:-1}

case $choice in

1)


echo -e "\n$ansi_art\n"
echo -e "${GREEN}SUCCESSFULLY DOWNLOADED!${NC}"
break
;;

2)


echo -e "\n$ansi_art\n"
echo -e "${GREEN}SUCCESSFULLY UPDATED!${NC}"
break #this means this is the end of the line of code
;;

3)


echo -e "\n$ansi_art\n"
echo -e "${GREEN}SUCCESSFULLY FIXED!${NC}"
break #this means this is the end of the line of code
;;

4)
echo "Exiting script..."
exit 0
;;

*)
clear
echo -e "${YELLOW}Invalid option. Please pick 1, 2, 3, or 4.${NC}"
;; #do not put a brake here
esac
done
#!/data/data/com.termux/files/usr/bin/bash
# Filename: toolkit.sh
# The Ultimate Termux Toolkit

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
cat << "EOF"
╔══════════════════════════════════════════════════════╗
║         TERMUX ULTIMATE TOOLKIT v3.0                 ║
║        Complete Collection for Everyone              ║
╚══════════════════════════════════════════════════════╝
EOF

while true; do
    echo -e "\n${CYAN}══════════════ ${WHITE}MAIN MENU ${CYAN}══════════════${NC}"
    echo -e "${GREEN}[1]${NC}  Beginner Tools (Easy & Simple)"
    echo -e "${GREEN}[2]${NC}  Intermediate Tools (Useful Daily)"
    echo -e "${GREEN}[3]${NC}  Advanced Tools (Hacking/Security)"
    echo -e "${GREEN}[4]${NC}  Expert Tools (Developer/System)"
    echo -e "${GREEN}[5]${NC}  Fun & Entertainment"
    echo -e "${GREEN}[6]${NC}  System Utilities"
    echo -e "${GREEN}[7]${NC}  Network Tools"
    echo -e "${GREEN}[8]${NC}  AI & Machine Learning"
    echo -e "${GREEN}[9]${NC}  Install All Tools"
    echo -e "${RED}[0]${NC}  Exit"
    echo -e "${CYAN}════════════════════════════════════════${NC}"
    
    read -p "Select: " choice
    
    case $choice in
        1) beginner_tools ;;
        2) intermediate_tools ;;
        3) advanced_tools ;;
        4) expert_tools ;;
        5) fun_tools ;;
        6) system_tools ;;
        7) network_tools ;;
        8) ai_tools ;;
        9) install_all ;;
        0) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option";;
    esac
done

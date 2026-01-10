#!/data/data/com.termux/files/usr/bin/bash
# Filename: kali-lite.sh
# The Ultimate Kali Tools Collection for Termux

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
BG_BLACK='\033[40m'
BG_RED='\033[41m'
RESET='\033[0m'

clear
echo -e "${RED}"
cat << "EOF"
╔═╗┌─┐┌─┐┬ ┬   ┌┬┐┬ ┬┌─┐┬  ┬┌─┐
╠═╝├─┤│  ├─┤    │ ├─┤├┤ │  │└─┐
╩  ┴ ┴└─┘┴ ┴    ┴ ┴ ┴└─┘┴─┘┴└─┘
╦  ┌─┐┌─┐┬  ┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
║  │ ││ ││  ├─┤│││├┬┘├─┤ │ ││ ││││
╩═╝└─┘└─┘┴─┘┴ ┴└┴┘┴└─┴ ┴ ┴ ┴└─┘┘└┘
EOF
echo -e "${RESET}"
echo -e "${CYAN}══════════════════════════════════════════════════════${RESET}"
echo -e "${WHITE}      Run Kali Linux Tools Without Installing Kali      ${RESET}"
echo -e "${YELLOW}            Created by: MANI XTECH 🌸 💝           ${RESET}"
echo -e "${CYAN}══════════════════════════════════════════════════════${RESET}"

# Check and install dependencies
check_deps() {
    echo -e "${YELLOW}[*] Checking dependencies...${RESET}"
    pkgs=("python" "python2" "git" "curl" "wget" "nmap" "hydra" "sqlmap" "john" "hashcat" "aircrack-ng" "metasploit")
    
    for pkg in "${pkgs[@]}"; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${RED}[!] $pkg not found. Installing...${RESET}"
            case $pkg in
                metasploit)
                    pkg install unstable-repo -y
                    pkg install metasploit -y
                    ;;
                *)
                    pkg install $pkg -y
                    ;;
            esac
        fi
    done
}

# Main menu
main_menu() {
    while true; do
        echo -e "\n${BLUE}══════════════ ${WHITE}KALI-LITE MENU ${BLUE}══════════════${RESET}"
        echo -e "${GREEN}[1]${NC}  Information Gathering"
        echo -e "${GREEN}[2]${NC}  Vulnerability Analysis"
        echo -e "${GREEN}[3]${NC}  Web Application Analysis"
        echo -e "${GREEN}[4]${NC}  Password Attacks"
        echo -e "${GREEN}[5]${NC}  Wireless Attacks"
        echo -e "${GREEN}[6]${NC}  Sniffing & Spoofing"
        echo -e "${GREEN}[7]${NC}  Exploitation Tools"
        echo -e "${GREEN}[8]${NC}  Forensics Tools"
        echo -e "${GREEN}[9]${NC}  Stress Testing"
        echo -e "${GREEN}[10]${NC} Hardware Hacking"
        echo -e "${GREEN}[11]${NC} Install All Kali Tools"
        echo -e "${RED}[0]${NC}  Exit"
        echo -e "${BLUE}════════════════════════════════════════════════${RESET}"
        
        read -p "Kali-Lite> " choice
        
        case $choice in
            1) info_gathering ;;
            2) vulnerability_analysis ;;
            3) web_analysis ;;
            4) password_attacks ;;
            5) wireless_attacks ;;
            6) sniffing_spoofing ;;
            7) exploitation_tools ;;
            8) forensics_tools ;;
            9) stress_testing ;;
            10) hardware_hacking ;;
            11) install_all_kali_tools ;;
            0) echo -e "${RED}[*] Exiting Kali-Lite...${RESET}"; exit 0 ;;
            *) echo -e "${RED}[!] Invalid option${RESET}" ;;
        esac
    done
}

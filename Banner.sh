#!/data/data/com.termux/files/usr/bin/bash
# banner.sh - Create cool banners

create_banner() {
    echo -e "${RED}"
    figlet -f slant "KALI-LITE"
    echo -e "${CYAN}══════════════════════════════════════════════════════${RESET}"
    echo -e "${WHITE}Termux Edition | No Kali Installation Needed${RESET}"
    echo -e "${YELLOW}Created by: Manishshah127776${RESET}"
    echo -e "${GREEN}GitHub: github.com/Manishshah127776${RESET}"
    echo -e "${CYAN}══════════════════════════════════════════════════════${RESET}"
}

create_toolkit_banner() {
    echo -e "${BLUE}"
    cat << "EOF"
╔══════════════════════════════════════════════════════╗
║         TERMUX ULTIMATE TOOLKIT v4.0                 ║
║      300+ Tools | Beginner to Expert                 ║
║      Kali Tools | Security | Development | Fun       ║
║      Created with ❤️ by MANISH XTECH 🌸 💝          ║
╚══════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
}

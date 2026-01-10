#!/data/data/com.termux/files/usr/bin/bash
# TERMUX PRO ULTRA SUITE - Complete Installation
# Author: Manishshah127776
# GitHub: https://github.com/Manishshah127776/TERMUX-TOOLS

# ============== COLORS ==============
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# ============== BANNER ==============
show_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔══════════════════════════════════════════════════════╗
║         ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗║
║         ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝║
║            ██║   █████╗  ██████╔╝██╔████╔██║ ╚████╔╝ ║
║            ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║  ╚██╔╝  ║
║            ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ║
║            ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ║
║                                                      ║
║              TERMUX PRO ULTRA SUITE                   ║
║                  Version 5.0                          ║
║       Kali Tools • Security • Development             ║
║      Created with ❤️ by Manishshah127776              ║
╚══════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# ============== CHECK TERMUX ==============
check_termux() {
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${RED}[✗] ERROR: This script must run in Termux!${NC}"
        echo -e "${YELLOW}Please install Termux from Play Store or F-Droid${NC}"
        exit 1
    fi
}

# ============== INSTALLATION ==============
install_all() {
    echo -e "${YELLOW}[*] Installation started at: $(date)${NC}"
    echo -e "${BLUE}════════════════════════════════════════════════${NC}"
    
    # Step 1: Update system
    echo -e "${YELLOW}[1/8] Updating Termux packages...${NC}"
    pkg update -y && pkg upgrade -y
    echo -e "${GREEN}[✓] System updated${NC}"
    
    # Step 2: Install essential packages
    echo -e "${YELLOW}[2/8] Installing essential packages...${NC}"
    pkg install -y python python3 git curl wget nano vim jq
    echo -e "${GREEN}[✓] Essential packages installed${NC}"
    
    # Step 3: Install security tools
    echo -e "${YELLOW}[3/8] Installing security tools...${NC}"
    pkg install -y nmap hydra sqlmap
    echo -e "${GREEN}[✓] Security tools installed${NC}"
    
    # Step 4: Install Python packages
    echo -e "${YELLOW}[4/8] Installing Python packages...${NC}"
    pip install --upgrade pip
    pip install requests colorama
    echo -e "${GREEN}[✓] Python packages installed${NC}"
    
    # Step 5: Make scripts executable
    echo -e "${YELLOW}[5/8] Making tools executable...${NC}"
    chmod +x *.sh 2>/dev/null
    echo -e "${GREEN}[✓] Tools made executable${NC}"
    
    # Step 6: Create launchers
    echo -e "${YELLOW}[6/8] Creating launcher commands...${NC}"
    
    # Create kali-lite command
    cat > /data/data/com.termux/files/usr/bin/kali-lite << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/TERMUX-TOOLS
bash kali_lite.sh
EOF
    chmod +x /data/data/com.termux/files/usr/bin/kali-lite
    
    # Create toolkit command
    cat > /data/data/com.termux/files/usr/bin/toolkit << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/TERMUX-TOOLS
bash kali_lite.sh
EOF
    chmod +x /data/data/com.termux/files/usr/bin/toolkit
    
    echo -e "${GREEN}[✓] Launchers created${NC}"
    
    # Step 7: Setup environment
    echo -e "${YELLOW}[7/8] Setting up environment...${NC}"
    echo 'export PATH=$PATH:~/TERMUX-TOOLS' >> ~/.bashrc
    echo 'alias kali="cd ~/TERMUX-TOOLS && bash kali_lite.sh"' >> ~/.bashrc
    echo 'alias termuxtools="cd ~/TERMUX-TOOLS"' >> ~/.bashrc
    echo 'alias tools="kali"' >> ~/.bashrc
    echo -e "${GREEN}[✓] Environment configured${NC}"
    
    # Step 8: Final setup
    echo -e "${YELLOW}[8/8] Finalizing installation...${NC}"
    mkdir -p ~/tools
    echo -e "${GREEN}[✓] Installation complete!${NC}"
    
    echo -e "${BLUE}════════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}[*] Installation finished at: $(date)${NC}"
}

# ============== SHOW SUCCESS ==============
show_success() {
    echo -e "${GREEN}"
    cat << "EOF"
╔══════════════════════════════════════════════════════╗
║          🎉 INSTALLATION SUCCESSFUL! 🎉              ║
╠══════════════════════════════════════════════════════╣
║                                                      ║
║  ✅ All tools installed successfully                 ║
║  ✅ Ready to use!                                    ║
║                                                      ║
║  📋 AVAILABLE COMMANDS:                             ║
║      kali-lite    - Main menu                       ║
║      toolkit      - Alternative launcher            ║
║      kali         - Quick shortcut                  ║
║      tools        - Same as kali                    ║
║                                                      ║
║  🛠️  AVAILABLE TOOLS (50+):                         ║
║      • Information Gathering                        ║
║      • Vulnerability Analysis                       ║
║      • Web Application Analysis                     ║
║      • Password Attacks                             ║
║      • Wireless Attacks                             ║
║      • Sniffing & Spoofing                          ║
║      • Exploitation Tools                           ║
║      • Forensics Tools                              ║
║      • Hardware Hacking                             ║
║      • Stress Testing                               ║
║                                                      ║
║  🔄 TO APPLY CHANGES:                               ║
║      source ~/.bashrc                               ║
║      OR restart Termux                              ║
║                                                      ║
║  💻 TO START:                                        ║
║      kali-lite                                      ║
║                                                      ║
║  👨‍💻 Developer: Manishshah127776                     ║
║  🌐 GitHub: github.com/Manishshah127776             ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# ============== MAIN EXECUTION ==============
main() {
    show_banner
    check_termux
    install_all
    show_success
    
    # Show next steps
    echo ""
    echo -e "${CYAN}[*] Next steps:${NC}"
    echo -e "${WHITE}1. Restart Termux or run: source ~/.bashrc${NC}"
    echo -e "${WHITE}2. Start the toolkit: kali-lite${NC}"
    echo -e "${WHITE}3. Explore tools in ~/TERMUX-TOOLS/${NC}"
    echo ""
    echo -e "${YELLOW}Thank you for installing Termux Pro Ultra Suite!${NC}"
    echo -e "${PURPLE}Happy hacking (ethically)! 🔒💻${NC}"
}

# Run main function
main "$@"

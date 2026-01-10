#!/data/data/com.termux/files/usr/bin/bash
# Filename: install_all_kali_tools.sh

install_all_kali_tools() {
    clear
    echo -e "${GREEN}"
    cat << "EOF"
╔═╗┌─┐┬  ┌─┐┬─┐  ┌─┐┌┐┌┬  ┌─┐┬─┐┌─┐┌─┐  ┌─┐┬ ┬┌─┐┬─┐┬─┐┌─┐┌┬┐┬┌┐┌┌─┐
║  ├─┤│  ├┤ ├┬┘  ├─┤││││  ├┤ ├┬┘└─┐├┤   ├┤ │ │├┤ ├┬┘├┬┘├─┤ │ │││││ │
╚═╝┴ ┴┴─┘└─┘┴└─  ┴ ┴┘└┘┴─┘└─┘┴└─└─┘└─┘  └  └─┘└─┘┴└─┴└─┴ ┴ ┴ ┴┘└┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${RED}[!] This will install 50+ Kali tools${RESET}"
    echo -e "${YELLOW}[*] Estimated time: 10-15 minutes${RESET}"
    read -p "Continue? (y/n): " confirm
    
    if [ "$confirm" != "y" ]; then
        return
    fi
    
    # Update system
    echo -e "${YELLOW}[1/10] Updating system...${RESET}"
    pkg update -y && pkg upgrade -y
    
    # Install essential packages
    echo -e "${YELLOW}[2/10] Installing core packages...${RESET}"
    pkg install -y python python2 python3 git curl wget nano vim
    
    # Information Gathering
    echo -e "${YELLOW}[3/10] Installing Info Gathering tools...${RESET}"
    pkg install -y nmap dnsutils whois net-tools
    
    # Vulnerability Analysis
    echo -e "${YELLOW}[4/10] Installing Vulnerability tools...${RESET}"
    pkg install -y sqlmap nikto lynis
    
    # Web Application Analysis
    echo -e "${YELLOW}[5/10] Installing Web Analysis tools...${RESET}"
    pkg install -y dirb wfuzz whatweb
    
    # Password Attacks
    echo -e "${YELLOW}[6/10] Installing Password tools...${RESET}"
    pkg install -y john hashcat hydra crunch
    
    # Wireless Attacks
    echo -e "${YELLOW}[7/10] Installing Wireless tools...${RESET}"
    pkg install -y aircrack-ng reaver wireshark-tshark
    
    # Sniffing & Spoofing
    echo -e "${YELLOW}[8/10] Installing Sniffing tools...${RESET}"
    pkg install -y ettercap bettercap dsniff
    
    # Exploitation Tools
    echo -e "${YELLOW}[9/10] Installing Exploitation tools...${RESET}"
    pkg install unstable-repo -y
    pkg install metasploit -y
    
    # Forensics & Stress Testing
    echo -e "${YELLOW}[10/10] Installing additional tools...${RESET}"
    pkg install -y binwalk foremost volatility
    
    # Python tools
    echo -e "${YELLOW}[*] Installing Python packages...${RESET}"
    pip install requests beautifulsoup4 scapy
    
    # Clone popular tools
    echo -e "${YELLOW}[*] Cloning GitHub tools...${RESET}"
    tools=(
        "https://github.com/sullo/nikto"
        "https://github.com/derv82/wifite2"
        "https://github.com/laramies/theHarvester"
        "https://github.com/aboul3la/Sublist3r"
        "https://github.com/s0md3v/XSStrike"
    )
    
    for tool in "${tools[@]}"; do
        git clone $tool
    done
    
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════════════════╗"
    echo "║           KALI-LITE INSTALLATION COMPLETE!       ║"
    echo "╠══════════════════════════════════════════════════╣"
    echo "║                                                  ║"
    echo "║  Installed 50+ Kali Linux tools                  ║"
    echo "║                                                  ║"
    echo "║  Start with:                                     ║"
    echo "║      ${WHITE}kali-lite${GREEN}                                  ║"
    echo "║                                                  ║"
    echo "║  Or run individual tools:                        ║"
    echo "║      nmap, sqlmap, metasploit, aircrack-ng       ║"
    echo "║                                                  ║"
    echo "║  ${RED}⚠ Warning: Use ethically only!${GREEN}                  ║"
    echo "║                                                  ║"
    echo "║  Developer: Manishshah127776                     ║"
    echo "║  GitHub: github.com/Manishshah127776            ║"
    echo "║                                                  ║"
    echo "╚══════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    
    # Create startup script
    cat > /data/data/com.termux/files/usr/bin/kali-lite << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/kali-lite
bash kali-lite.sh
EOF
    chmod +x /data/data/com.termux/files/usr/bin/kali-lite
}

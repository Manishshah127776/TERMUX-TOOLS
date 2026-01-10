#!/data/data/com.termux/files/usr/bin/bash
# Filename: info_gathering.sh

info_gathering() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔═╗┬ ┬┌─┐┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┬─┐┌─┐┬  ┌─┐┌┬┐┌─┐
╠═╣│ │└─┐ │ ├─┤│ │  │  ├─┤├┬┘├┤ │  ├┤  │ │ │
╩ ╩└─┘└─┘ ┴ ┴ ┴└─┘  └─┘┴ ┴┴└─└─┘┴─┘└─┘ ┴ └─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Nmap - Network Scanner"
    echo -e "${GREEN}[2]${NC}  Recon-ng - Web Reconnaissance"
    echo -e "${GREEN}[3]${NC}  theHarvester - Email/Subdomain"
    echo -e "${GREEN}[4]${NC}  DNSRecon - DNS Enumeration"
    echo -e "${GREEN}[5]${NC}  Sublist3r - Subdomain Finder"
    echo -e "${GREEN}[6]${NC}  Shodan CLI - Internet Scanner"
    echo -e "${GREEN}[7]${NC}  Maltego - Visual Link Analysis"
    echo -e "${GREEN}[8]${NC}  SpiderFoot - OSINT Automation"
    echo -e "${GREEN}[9]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] Starting Nmap...${RESET}"
            read -p "Target IP/Domain: " target
            echo "1. Quick Scan  2. Full Scan  3. OS Detection"
            read -p "Scan type: " scantype
            case $scantype in
                1) nmap -sV -T4 $target ;;
                2) nmap -sS -sV -sC -A -T4 $target ;;
                3) nmap -O $target ;;
            esac
            ;;
        2)
            echo -e "${YELLOW}[*] Installing Recon-ng...${RESET}"
            git clone https://github.com/lanmaster53/recon-ng.git
            cd recon-ng
            pip install -r REQUIREMENTS
            python recon-ng
            ;;
        3)
            echo -e "${YELLOW}[*] Installing theHarvester...${RESET}"
            git clone https://github.com/laramies/theHarvester.git
            cd theHarvester
            pip install -r requirements.txt
            python theHarvester.py -d example.com -b all
            ;;
        4)
            echo -e "${YELLOW}[*] DNS Enumeration${RESET}"
            read -p "Domain: " domain
            echo "A Records:"
            dig $domain A +short
            echo "MX Records:"
            dig $domain MX +short
            echo "NS Records:"
            dig $domain NS +short
            ;;
        5)
            git clone https://github.com/aboul3la/Sublist3r.git
            cd Sublist3r
            pip install -r requirements.txt
            read -p "Domain: " domain
            python sublist3r.py -d $domain
            ;;
        9) return ;;
        *) echo "Invalid option" ;;
    esac
    read -p "Press Enter to continue..."
}

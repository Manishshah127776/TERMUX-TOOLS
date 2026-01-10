#!/data/data/com.termux/files/usr/bin/bash
# Filename: wireless_attacks.sh

wireless_attacks() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╦ ╦┬┌┬┐┬ ┬┌─┐┌┬┐  ┌─┐┬ ┬┌─┐┬─┐┬─┐┌─┐┌┬┐┬┌┐┌┌─┐
║ ║│ │ ├─┤├─┤ │   ├┤ │ │├┤ ├┬┘├┬┘├─┤ │ │││││ │
╚═╝┴ ┴ ┴ ┴┴ ┴ ┴   └  └─┘└─┘┴└─┴└─┴ ┴ ┴ ┴┘└┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Aircrack-ng Suite"
    echo -e "${GREEN}[2]${NC}  Reaver - WPS Attack"
    echo -e "${GREEN}[3]${NC}  PixieWPS"
    echo -e "${GREEN}[4]${NC}  Wifite"
    echo -e "${GREEN}[5]${NC}  Fern WiFi Cracker"
    echo -e "${GREEN}[6]${NC}  Kismet"
    echo -e "${GREEN}[7]${NC}  Wireshark (tshark)"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] Aircrack-ng${RESET}"
            echo "Note: Needs rooted device with monitor mode"
            echo "1. Put interface in monitor mode"
            echo "2. Capture handshake"
            echo "3. Crack with wordlist"
            airmon-ng start wlan0
            airodump-ng wlan0mon
            ;;
        4)
            echo -e "${YELLOW}[*] Wifite Automated Tool${RESET}"
            git clone https://github.com/derv82/wifite2.git
            cd wifite2
            python3 Wifite.py
            ;;
        7)
            echo -e "${YELLOW}[*] Wireshark (tshark)${RESET}"
            pkg install tshark -y
            echo "Capturing on wlan0..."
            tshark -i wlan0 -w capture.pcap
            echo "Saved to capture.pcap"
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

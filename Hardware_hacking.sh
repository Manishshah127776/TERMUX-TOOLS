#!/data/data/com.termux/files/usr/bin/bash
# Filename: hardware_hacking.sh

hardware_hacking() {
    clear
    echo -e "${PURPLE}"
    cat << "EOF"
╔╗ ┬ ┬┌─┐┬─┐┬─┐┬ ┬  ┌─┐ ┬ ┬┌─┐┬  ┬┌─┐┬─┐
╠╩╗│ │├┤ ├┬┘├┬┘└┬┘  │─┼┐│ │├┤ │  │├┤ ├┬┘
╚═╝└─┘└─┘┴└─┴└─ ┴   └─┘└└─┘└─┘┴─┘┴└─┘┴└─
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Arduino IDE"
    echo -e "${GREEN}[2]${NC}  RFID Tools"
    echo -e "${GREEN}[3]${NC}  Bluetooth Hacking"
    echo -e "${GREEN}[4]${NC}  USB Rubber Ducky"
    echo -e "${GREEN}[5]${NC}  BadUSB"
    echo -e "${GREEN}[6]${NC}  RFID/NFC Cloner"
    echo -e "${GREEN}[7]${NC}  SDR Tools"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        2)
            echo -e "${YELLOW}[*] RFID/NFC Tools${RESET}"
            pkg install mfcuk -y
            pkg install mfoc -y
            pkg install libnfc -y
            echo "Use: mfoc -O card.mfd"
            ;;
        3)
            echo -e "${YELLOW}[*] Bluetooth Tools${RESET}"
            pkg install bluez -y
            echo "Scanning Bluetooth devices..."
            hcitool scan
            echo "For more: bluetoothctl"
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

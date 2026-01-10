#!/data/data/com.termux/files/usr/bin/bash
# Filename: forensics_tools.sh

forensics_tools() {
    clear
    echo -e "${BLUE}"
    cat << "EOF"
╔═╗┌─┐┬─┐┌─┐┌┐┌┌┬┐┌─┐  ┌─┐┬ ┬┌─┐┬─┐┬─┐┌─┐┌┬┐┬┌┐┌┌─┐
╠═╝├┤ ├┬┘│ ││││ ││└─┐  ├┤ │ │├┤ ├┬┘├┬┘├─┤ │ │││││ │
╩  └─┘┴└─└─┘┘└┘─┴┘└─┘  └  └─┘└─┘┴└─┴└─┴ ┴ ┴ ┴┘└┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Autopsy"
    echo -e "${GREEN}[2]${NC}  Volatility"
    echo -e "${GREEN}[3]${NC}  Binwalk"
    echo -e "${GREEN}[4]${NC}  Foremost"
    echo -e "${GREEN}[5]${NC}  Scapy"
    echo -e "${GREEN}[6]${NC}  NetworkMiner"
    echo -e "${GREEN}[7]${NC}  Wireshark"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        2)
            echo -e "${YELLOW}[*] Volatility Memory Analysis${RESET}"
            git clone https://github.com/volatilityfoundation/volatility.git
            cd volatility
            python vol.py -f memory.dump imageinfo
            ;;
        3)
            echo -e "${YELLOW}[*] Binwalk - Firmware Analysis${RESET}"
            pkg install binwalk -y
            read -p "File to analyze: " file
            binwalk $file
            ;;
        4)
            echo -e "${YELLOW}[*] Foremost Data Recovery${RESET}"
            pkg install foremost -y
            read -p "Image file: " image
            foremost -i $image -o recovered/
            echo "Files recovered to recovered/"
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

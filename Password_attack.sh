#!/data/data/com.termux/files/usr/bin/bash
# Filename: password_attacks.sh

password_attacks() {
    clear
    echo -e "${PURPLE}"
    cat << "EOF"
╔═╗┌─┐┌─┐┬─┐┌┬┐┌─┐  ┌─┐┬ ┬┌─┐┬─┐┬─┐┌─┐┌┬┐┬┌┐┌┌─┐
╠═╝├─┤│  ├┬┘ ││└─┐  ├┤ │ │├┤ ├┬┘├┬┘├─┤ │ │││││ │
╩  ┴ ┴└─┘┴└──┴┘└─┘  └  └─┘└─┘┴└─┴└─┴ ┴ ┴ ┴┘└┘└─┘
EOF
    echo -e "${RESET}"
    
    echo -e "${GREEN}[1]${NC}  John the Ripper"
    echo -e "${GREEN}[2]${NC}  Hashcat"
    echo -e "${GREEN}[3]${NC}  Hydra"
    echo -e "${GREEN}[4]${NC}  Crunch"
    echo -e "${GREEN}[5]${NC}  CeWL"
    echo -e "${GREEN}[6]${NC}  Hash-Identifier"
    echo -e "${GREEN}[7]${NC}  Rainbow Tables"
    echo -e "${GREEN}[8]${NC}  GoBack"
    
    read -p "Select tool: " tool
    
    case $tool in
        1)
            echo -e "${YELLOW}[*] John the Ripper${RESET}"
            read -p "Hash file: " hashfile
            echo "1. Wordlist  2. Brute force  3. Single crack"
            read -p "Mode: " mode
            case $mode in
                1) john --wordlist=/usr/share/wordlists/rockyou.txt $hashfile ;;
                2) john --incremental $hashfile ;;
                3) john --single $hashfile ;;
            esac
            john --show $hashfile
            ;;
        2)
            echo -e "${YELLOW}[*] Hashcat${RESET}"
            echo "Example: hashcat -m 0 hash.txt wordlist.txt"
            echo "Hash types:"
            echo "0 = MD5, 1000 = NTLM, 1800 = SHA512"
            read -p "Hash: " hash
            hashcat -m 0 --show $hash
            ;;
        3)
            echo -e "${YELLOW}[*] Hydra - Brute Force Login${RESET}"
            echo "1. SSH  2. FTP  3. HTTP Form"
            read -p "Service: " service
            read -p "Target IP: " target
            read -p "Username (or file): " user
            read -p "Password list: " passlist
            
            case $service in
                1) hydra -l $user -P $passlist ssh://$target ;;
                2) hydra -l $user -P $passlist ftp://$target ;;
                3) hydra -l $user -P $passlist http-post-form "/login.php:user=^USER^&pass=^PASS^:F=incorrect" ;;
            esac
            ;;
        4)
            echo -e "${YELLOW}[*] Crunch Wordlist Generator${RESET}"
            read -p "Min length: " min
            read -p "Max length: " max
            read -p "Characters (default: abcdefghijklmnopqrstuvwxyz): " chars
            chars=${chars:-abcdefghijklmnopqrstuvwxyz}
            crunch $min $max $chars -o wordlist.txt
            echo "Generated: wordlist.txt"
            ;;
        8) return ;;
        *) echo "Invalid option" ;;
    esac
}

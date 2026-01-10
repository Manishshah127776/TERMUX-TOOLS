#!/data/data/com.termux/files/usr/bin/bash
# DARKEST Installation Script
# By MANI XTECH

echo -e "\e[1;95m"
cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║  ██████╗  █████╗ ██████╗ ██╗  ██╗███████╗███████╗████████╗  ║
║  ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔════╝╚══██╔══╝  ║
║  ██║  ██║███████║██████╔╝█████╔╝ █████╗  ███████╗   ██║     ║
║  ██║  ██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ╚════██║   ██║     ║
║  ██████╔╝██║  ██║██║  ██║██║  ██╗███████╗███████║   ██║     ║
║  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝     ║
║                                                              ║
║                    DEVELOPED BY: MANI XTECH                  ║
╚══════════════════════════════════════════════════════════════╝
EOF
echo -e "\e[0m"

# Check if running as root
if [ "$(whoami)" = "root" ]; then
    echo -e "\e[1;31m[!] Do not run as root!\e[0m"
    exit 1
fi

# Update packages
echo -e "\e[1;36m[*] Updating Termux packages...\e[0m"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "\e[1;36m[*] Installing dependencies...\e[0m"
pkg install -y python python-pip git curl wget nmap hydra sqlmap nodejs

# Python packages
echo -e "\e[1;36m[*] Installing Python modules...\e[0m"
pip install --upgrade pip
pip install cryptography pillow qrcode numpy requests colorama

# Create directories
echo -e "\e[1;36m[*] Creating DARKEST structure...\e[0m"
mkdir -p modules themes assets/ascii_arts config logs

# Download additional tools
echo -e "\e[1;36m[*] Downloading additional components...\e[0m"
wget -q https://raw.githubusercontent.com/ManiXTech/DARKEST-Termux/main/themes/neo_tokyo.json -O themes/neo_tokyo.json

# Make executable
chmod +x darkest.py

# Create config
cat > config/darkest.conf << EOF
{
    "theme": "neo_tokyo",
    "auto_update": true,
    "stealth": false,
    "developer": "MANI XTECH",
    "version": "3.1.4"
}
EOF

# Create alias
echo "alias darkest='python3 $(pwd)/darkest.py'" >> $HOME/.bashrc
echo "alias darkexit='pkill -f darkest'" >> $HOME/.bashrc

echo -e "\e[1;32m"
echo "╔══════════════════════════════════════════════════╗"
echo "║           DARKEST INSTALLATION COMPLETE          ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║                                                  ║"
echo "║  To start DARKEST:                               ║"
echo "║      \e[1;95m$ darkest\e[1;32m                                 ║"
echo "║                                                  ║"
echo "║  To exit DARKEST:                                ║"
║      \e[1;95m$ darkexit\e[1;32m                                 ║"
echo "║                                                  ║"
echo "║  GitHub: https://github.com/ManiXTech/DARKEST    ║"
echo "║                                                  ║"
echo "║  \e[1;96m\"In the darkest code, light is born\"\e[1;32m              ║"
echo "║  \e[1;96m\"MANI XTECH - Neo-Tokyo 2077\"\e[1;32m                     ║"
echo "║                                                  ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "\e[0m"
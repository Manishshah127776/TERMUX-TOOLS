#!/data/data/com.termux/files/usr/bin/bash
# install.sh - Complete Installation Script
# By Manishshah127776

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Banner
clear
echo -e "${CYAN}"
cat << "EOF"
╔══════════════════════════════════════════════════════╗
║         TERMUX PRO ULTRA SUITE v5.0                  ║
║       Complete Kali & Security Toolkit               ║
║      Created by: Manishshah127776                    ║
╚══════════════════════════════════════════════════════╝
EOF
echo -e "${RESET}"

echo -e "${YELLOW}[*] Starting Installation...${NC}"
echo -e "${BLUE}========================================${NC}"

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}[!] This script must run in Termux!${NC}"
    exit 1
fi

# Update packages
echo -e "${YELLOW}[1/10] Updating Termux packages...${NC}"
pkg update -y && pkg upgrade -y

# Install dependencies
echo -e "${YELLOW}[2/10] Installing dependencies...${NC}"
pkg install -y python python2 python3 git curl wget nano vim jq

# Install security tools
echo -e "${YELLOW}[3/10] Installing security tools...${NC}"
pkg install -y nmap hydra sqlmap john hashcat aircrack-ng

# Install development tools
echo -e "${YELLOW}[4/10] Installing development tools...${NC}"
pkg install -y nodejs ruby perl php golang rust

# Install Python packages
echo -e "${YELLOW}[5/10] Installing Python packages...${NC}"
pip install --upgrade pip
pip install requests beautifulsoup4 colorama cryptography

# Create tools directory
echo -e "${YELLOW}[6/10] Creating directory structure...${NC}"
mkdir -p ~/termux-tools
cd ~/termux-tools

# Copy all script files from current directory
echo -e "${YELLOW}[7/10] Copying tool files...${NC}"
# Assuming we're in the repository directory
cp *.sh ~/termux-tools/ 2>/dev/null || echo "No .sh files found"

# Make all scripts executable
echo -e "${YELLOW}[8/10] Setting permissions...${NC}"
chmod +x ~/termux-tools/*.sh 2>/dev/null

# Create main launcher
echo -e "${YELLOW}[9/10] Creating launcher...${NC}"
cat > /data/data/com.termux/files/usr/bin/kali-lite << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/termux-tools
bash kali_lite.sh
EOF
chmod +x /data/data/com.termux/files/usr/bin/kali-lite

# Add to PATH
echo -e "${YELLOW}[10/10] Setting up environment...${NC}"
echo 'export PATH=$PATH:~/termux-tools' >> ~/.bashrc
echo 'alias toolkit="cd ~/termux-tools && bash kali_lite.sh"' >> ~/.bashrc

# Final message
echo -e "${GREEN}"
cat << "EOF"
╔══════════════════════════════════════════════════════╗
║                INSTALLATION COMPLETE!                ║
╠══════════════════════════════════════════════════════╣
║                                                      ║
║  ✅ All tools installed successfully                 ║
║  ✅ Ready to use!                                    ║
║                                                      ║
║  Commands:                                           ║
║      kali-lite     - Start main menu                 ║
║      toolkit       - Alternative command             ║
║                                                      ║
║  Available tools:                                    ║
║      • nmap        • sqlmap     • hydra              ║
║      • john        • hashcat    • aircrack-ng        ║
║      • 15+ other security tools                      ║
║                                                      ║
║  Restart Termux or run:                              ║
║      source ~/.bashrc                                ║
║                                                      ║
║  Developer: Manishshah127776                         ║
║                                                      ║
╚══════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo -e "${YELLOW}[*] Installation completed at: $(date)${NC}"

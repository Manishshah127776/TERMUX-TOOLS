#!/data/data/com.termux/files/usr/bin/bash
# update_tools.sh

echo "🔄 Updating Termux Tools Collection..."
echo "Checking for updates..."

# Check if git repo
if [ -d .git ]; then
    git pull origin main
    echo "✅ Tools updated from GitHub"
else
    echo "📥 Downloading latest version..."
    wget -q https://github.com/Manishshah127776/TERMUX-TOOLS/archive/main.zip
    unzip -o main.zip
    cp -r TERMUX-TOOLS-main/* .
    rm -rf TERMUX-TOOLS-main main.zip
    echo "✅ Updated to latest version"
fi

# Make all scripts executable
find . -name "*.sh" -exec chmod +x {} \;
echo "🎉 Update complete! Restart toolkit."

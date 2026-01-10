#!/data/data/com.termux/files/usr/bin/bash
# phone_info.sh
echo "📱 YOUR PHONE INFORMATION"
echo "========================="
echo "Model: $(getprop ro.product.model)"
echo "Brand: $(getprop ro.product.brand)"
echo "Android: $(getprop ro.build.version.release)"
echo "CPU: $(cat /proc/cpuinfo | grep 'Processor' | head -1)"
echo "RAM: $(free -h | grep Mem | awk '{print $2}')"
echo "Storage: $(df -h /data | tail -1 | awk '{print $4}') free"
echo "IP Address: $(ifconfig wlan0 | grep 'inet' | awk '{print $2}')"
echo "Battery: $(termux-battery-status 2>/dev/null | grep percentage | cut -d: -f2)%"

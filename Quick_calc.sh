#!/data/data/com.termux/files/usr/bin/bash
# quick_calc.sh
echo "🧮 Quick Calculator"
echo "Enter 'q' to quit"
while true; do
    read -p "Expression: " expr
    [[ "$expr" == "q" ]] && break
    echo "Result: $(echo "$expr" | bc -l 2>/dev/null || echo "Error")"
done

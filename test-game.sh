#!/bin/bash
# Quick test to verify game structure

echo "🧪 Testing game structure..."
echo ""

errors=0

# Check main directories
for dir in your-room hallway basement secret-lab cipher-chamber server-room cyberspace; do
    if [ -d "$dir" ]; then
        echo "✓ $dir/ exists"
    else
        echo "✗ $dir/ MISSING!"
        ((errors++))
    fi
done

echo ""
echo "Checking key files..."

# Check key files
files=(
    "ENTER_IF_YOU_DARE.txt"
    "your-room/note-on-desk.txt"
    "your-room/.hidden-under-bed"
    "hallway/unlock-basement"
    "basement/.hidden-safe/secret-lab-access.txt"
    "secret-lab/install-guide.txt"
    "secret-lab/game-challenge.txt"
    "cipher-chamber/decoder-guide.txt"
    "cipher-chamber/profile-challenge.txt"
    "cipher-chamber/vault-access"
    "server-room/.mom-secret-note"
    "cyberspace/certificate"
)

for file in "${files[@]}"; do
    if [ -e "$file" ]; then
        echo "✓ $file exists"
    else
        echo "✗ $file MISSING!"
        ((errors++))
    fi
done

echo ""
if [ $errors -eq 0 ]; then
    echo "🎉 All tests passed! Game is ready to play!"
else
    echo "⚠️  Found $errors issues. Check the setup."
fi
echo ""

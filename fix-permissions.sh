#!/bin/bash
# Fix all executable permissions in the game

echo "🔧 Fixing file permissions..."

# Make all .sh scripts executable
chmod +x *.sh

# Make hallway scripts executable
chmod +x hallway/basement-key
chmod +x hallway/unlock-basement

# Make secret-lab scripts executable
chmod +x secret-lab/server-room-access

# Make cipher-chamber scripts executable
chmod +x cipher-chamber/vault-access

echo "✅ All permissions fixed!"
echo ""
echo "Game is ready to play!"

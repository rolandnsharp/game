#!/bin/bash
# Setup script for Monad

echo "Setting up Monad..."

# Ensure all shell scripts in the project are executable
find . -type f -name "*.sh" -exec chmod +x {} +
find . -type f -name "*.awk" -exec chmod +x {} +

# Set executable on the one script without an extension
chmod +x system/cron.d/cleanup

echo "Setup complete."
echo "To begin, run: ./launch-game.sh"
echo "Or inspect the files manually, starting with 'cat ENTER_IF_YOU_DARE.txt'"

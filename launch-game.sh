#!/bin/bash
# Launch script for Monad

# Change to the game directory
cd "$(dirname "$0")"

# Clear the screen and present the starting message
clear
cat ENTER_IF_YOU_DARE.txt
echo ""

# Drop the user into an interactive shell to begin the game
exec bash

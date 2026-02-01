# Dockerfile for Monad - A Terminal-Based Interactive Fiction Game
# This file builds the entire game state from a clean source.

# 1. Use a lightweight Debian base image
FROM debian:stable-slim

# 2. Install all necessary tools for the puzzles and player experience
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    tmux \
    git \
    build-essential \
    john \
    openssl \
    nodejs \
    npm \
    tcpdump \
    netcat-openbsd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Set up the game directory
WORKDIR /app

# 4. Copy all game files (in their clean, plaintext state)
COPY . .

# 5. === BUILD THE GAME STATE ===
#    This section performs all the setup, encryption, and puzzle creation.

# Correct the hashing puzzle to be solvable
RUN sed -i 's/5e884898da28047151d0e56f8dc6292773603d0d6aabbd6709d639798781600e/5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8/' crypto/hashing_puzzle.txt

# Encrypt archive/notes.md and create its readme
RUN openssl aes-256-cbc -e -in archive/notes.md -out archive/notes.md.enc -pass pass:password && \
    rm archive/notes.md && \
    echo $'This file contains the research notes of the terminal\\'s previous user, but it has been encrypted.\n\nTo decrypt it, you will need to find the password for the \\'monad\\' user.\nThe password hash is located in `/system/shadow.txt`. A tool like \\'John the Ripper\\' might be useful.\n\n---\n# Terminal Pro-Tip: Using Variables\n\nTyping out complex passwords is slow and error-prone. Store the output of a command in a variable and use it directly.\n\n# 1. Crack the password for \\'monad\\' and save it to a file.\n#    (This may take a moment)\n#    john --wordlist=/usr/share/john/password.lst ../system/shadow.txt\n#    SHOW_PASS_CMD="john --show ../system/shadow.txt"\n\n# 2. Capture the cracked password into a variable.\n#    DECRYPT_KEY=$($SHOW_PASS_CMD | grep \\'monad\\' | cut -d: -f2)\n\n# 3. Use the variable to decrypt the file:\n#    openssl aes-256-cbc -d -in notes.md.enc -out notes.md -pass env:DECRYPT_KEY\n---' > archive/notes.md.readme

# Encrypt the private key and create its readme
RUN openssl aes-256-cbc -e -in crypto/public_key_cryptography/private_key.pem -out crypto/public_key_cryptography/private_key.pem.enc -pass pass:password && \
    rm crypto/public_key_cryptography/private_key.pem && \
    echo $'This file contains a private key needed to decrypt another message. It is itself encrypted.\n\nTo decrypt this file, you must first solve the SHA256 challenge located in `../hashing_puzzle.txt`.\n\n---\n# Terminal Pro-Tip: Storing Your Solution\n\nOnce you\\'ve found the string that matches the hash, store it in a variable.\n\n# 1. Store the solution in a variable:\n#    DECRYPT_KEY="the_solution_word"\n\n# 2. Use the variable to decrypt the private key:\n#    openssl aes-256-cbc -d -in private_key.pem.enc -out private_key.pem -pass env:DECRYPT_KEY\n\n# 3. Now, use the decrypted key to decrypt the final message in this directory.\n#    openssl pkeyutl -decrypt -inkey private_key.pem -in encrypted_message.bin\n---' > crypto/public_key_cryptography/private_key.pem.readme

# Encrypt the final kernel module and create its readme (introducing tmux)
RUN openssl aes-256-cbc -e -in kernel/monad_kmod.c -out kernel/monad_kmod.c.enc -pass pass:a_weak_password && \
    rm kernel/monad_kmod.c && \
    echo $'This is the final piece of the puzzle. It is encrypted.\n\nThe key was transmitted over the network. You must find it by analyzing the traffic artifacts in the `../network` directory.\n\n---\n# Terminal Pro-Tip: Level Up with tmux\n\nYou\\'ve been using variables, which is great. But for more complex work, a terminal multiplexer like \\'tmux\\' is essential. It provides a built-in clipboard and allows for multiple panes.\n\n# 1. Start tmux:\n#    tmux\n\n# 2. Find the password, then enter tmux\\'s copy mode to copy it:\n#    - Press `Ctrl-b` then `[`\n#    - Navigate with arrow keys, select text with `spacebar`, copy with `Enter`.\n\n# 3. Paste the copied password to decrypt the file:\n#    - In your decrypt command, press `Ctrl-b` then `]` to paste.\n---' > kernel/monad_kmod.c.readme

# 6. Create a non-root user and set up their environment
RUN useradd -ms /bin/bash monad && \
    echo 'syntax on' >> /home/monad/.vimrc && \
    echo 'set number' >> /home/monad/.vimrc && \
    echo 'set expandtab' >> /home/monad/.vimrc && \
    echo 'set tabstop=2' >> /home/monad/.vimrc && \
    echo 'set shiftwidth=2' >> /home/monad/.vimrc && \
    chown -R monad:monad /home/monad /app

# 7. Move the game files to the user's home and set final ownership
RUN mv /app /home/monad/game && \
    chown -R monad:monad /home/monad/game

# 8. Switch to the game user
USER monad
WORKDIR /home/monad/game

# 9. Run the setup script to make sure all game scripts are executable
RUN /home/monad/game/setup-game.sh

# 10. Set the default command to launch the game
CMD ["/home/monad/game/launch-game.sh"]
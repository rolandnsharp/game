# Monad: A Terminal-Based Interactive Fiction

## The Story

You are a digital archaeologist. You've stumbled upon a dormant terminal, a relic of a bygone era of the internet. This is the digital ghost of a programmer, a researcher, an artist... someone who vanished, leaving behind only fragments of their work, their thoughts, and their life.

Your task is to explore this digital wilderness, piece together the story of the person who lived here, and uncover the mystery they left behind. The story unfolds not through dialogue, but through the files themselves: scripts, logs, half-finished programs, and fragmented notes.

## For the Developer

This isn't a game for beginners. It's a challenge for developers who want to sharpen their command-line skills and explore the depths of the terminal. We'll move beyond the basics and dive into:

- **Advanced Shell Scripting:** Write your own scripts to solve puzzles and automate tasks.
- **Powerful Command-Line Tools:** Master `grep`, `sed`, `awk`, `find`, and other tools to manipulate data and search for clues.
- **Process Management:** Understand how to manage processes, pipes, and redirects to control the flow of data.
- **System Internals:** Get a glimpse into the inner workings of a Linux system.
- **Creative Problem Solving:** The solutions to the puzzles are not always obvious. You'll need to think like a hacker to succeed.

## The World

The filesystem is your world. Every file, every directory, every script is a piece of the story. The narrative is not linear. You'll need to explore, experiment, and follow the breadcrumbs to uncover the truth. The story is embedded in the environment itself.

## The Goal


## Future Developments

- **Multi-Container Hacking:** Explore expanding the game to involve multiple Docker containers orchestrated by `docker-compose`. This would allow for advanced networking challenges, where players must "hack" their way through interconnected services and learn about container networking, inter-service communication, and network security in a distributed environment.
- **Tool Scavenging as Character Progression:** The player begins with a minimal set of commands. The core reward loop and "leveling up" mechanic is finding essential binaries (grep, nmap, gcc, etc.) scattered throughout the environment and adding them to their $PATH. Each new tool is a permanent upgrade to the player's capabilities, unlocking new solutions and puzzles.

#### Core Gameplay Loop
A "level" is not a single container, but a conceptual challenge that can span a filesystem, a codebase, or an entire virtual network.
1.  **Exploration:** The player is presented with a puzzle and must explore the environment to find the tools and clues necessary to solve it.
2.  **Acquisition:** A new binary is found in a hidden directory.
3.  **Empowerment:** The player moves the tool to their `/usr/bin`, permanently adding it to their skillset. Monad acknowledges this "level up."
4.  **Solution:** The player uses their newly acquired tool to overcome the challenge.
5.  **Progression:** Solving the puzzle reveals the path forward, which could be credentials to ssh into a new server, the location of a vulnerable piece of code, or access to a new section of the filesystem.

#### The Curriculum: A Grand Tour
A comprehensive journey through the layers of modern computing:
-   **The Shell and Filesystem:** Master the fundamentals of navigation, permissions, and the core utilities (e.g., discovering clues in hidden files, using `chmod` to access protected files, finding the `sudo` password).
-   **Text Processing and Scripting:** Learn `grep`, `sed`, `awk`, and shell scripting (e.g., reconstructing actions from `.bash_history`, parsing log files, writing automation scripts).
-   **Compilation and Debugging:** Dive into C, finding and fixing logic errors in source code (e.g., repairing a "corrupted" utility by modifying its source and recompiling with `gcc`).
-   **Networking:** Graduate to a multi-container environment, learning to map and traverse a virtual network (e.g., using `nmap` to discover a hidden server, using `ssh` with a scavenged key).
-   **Version Control & Forensics:** Investigate changes over time and recover lost information (e.g., delving into `git` history to find a secret key that was accidentally committed and later removed).
-   **Security and Exploitation:** Put all skills together for basic penetration testing (e.g., using decryption tools to crack a password file, stopping a rogue process, exploiting a vulnerability).

#### Core Technologies
-   **AI:** daemon that observes player actions via `PROMPT_COMMAND` and communicates by writing directly to the player's terminal.
-   **Environment:** A network of Debian-slim Docker containers for a complex playground.


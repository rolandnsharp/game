#  Monad: A Terminal-Based Interactive Fiction

## 📖 Story

You are a digital archaeologist who has stumbled upon a dormant terminal. This is the digital ghost of a programmer, a researcher, an artist... someone who vanished, leaving behind only fragments of their work. Your task is to explore this digital wilderness, piece together the story of the person who lived here, and uncover the mystery they left behind.

## 🎯 What You'll Learn

This is not a game for beginners. It's a challenge for developers who want to sharpen their command-line skills. We'll move beyond the basics and dive into:

- Advanced Shell Scripting
- Powerful Command-Line Tools (`grep`, `sed`, `awk`, `find`)
- Process Management
- System Internals
- Creative Problem Solving

## 🚀 Quick Start

To play Monad, you'll need Docker installed. The game environment is entirely self-contained within a Docker image, ensuring a consistent experience.

1.  **Build the game image (once):**
    Navigate to the root directory of the Monad project (where the Dockerfile is) and run:
    ```bash
    docker build -t monad-game .
    ```
    This command builds the game image, setting up the environment and encrypting files to their initial state.

2.  **Start a new game (each session):**
    To begin playing, or to start a fresh game, run:
    ```bash
    docker run -it --rm monad-game
    ```
    The `--rm` flag ensures that when you exit the container, it's automatically removed, and your game state resets. This means each time you run this command, you start a fresh game from the beginning.

3.  **Follow the clues.** The story unfolds at your own pace from within the container.

## 🗺️ Game Structure

The filesystem is your world. Every file and directory is a piece of the story. The narrative is not linear.

```
monad/
├── ENTER_IF_YOU_DARE.txt    ← Start here!
├── user/                     ← The personal files of the previous user.
├── system/                   ← System files, configurations, and logs.
├── archive/                  ← Old files, backups, and compressed data.
├── workspace/                ← The user's projects and source code.
├── crypto/                   ← Encrypted files and cryptographic puzzles.
├── network/                  ← Network configurations and logs.
└── kernel/                   ← The core of the system.
```

## 🔧 Requirements

- **OS**: Any Linux-based system.
- **Skills**: Intermediate knowledge of the command line.

## 📝 License

Free to use and modify for educational purposes!

## 🎉 Credits

Inspired by [bashcrawl](https://gitlab.com/slackermedia/bashcrawl) by Klaatu.

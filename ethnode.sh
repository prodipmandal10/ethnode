#!/bin/bash

# ==============================
#        MADE BY PRODIP
# ==============================

TRUSTED_DIR=~/trusted-setup-tmp
TMUX_SESSION=GEN

while true; do
    clear
    echo "==========================================="
    echo "           MADE BY PRODIP"
    echo "==========================================="
    echo "========== MENU =========="
    echo "1. Install Dependencies"
    echo "2. Install Node.js + npm"
    echo "3. Install Phase2 CLI"
    echo "4. GitHub Authentication"
    echo "5. Start Ceremony in tmux (GEN)"
    echo "6. View Contributor Session"
    echo "7. EXIT"
    echo "==========================="
    read -p "Enter choice [1-7]: " choice

    case $choice in
        1)
            echo "Installing dependencies..."
            sudo apt update && sudo apt upgrade -y
            sudo apt install -y curl git build-essential tmux
            read -p "Press Enter to continue..."
            ;;
        2)
            echo "Installing Node.js v20 and npm latest..."
            curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
            sudo apt install -y nodejs
            sudo npm install -g npm@latest
            read -p "Press Enter to continue..."
            ;;
        3)
            echo "Installing Phase2 CLI..."
            mkdir -p $TRUSTED_DIR && cd $TRUSTED_DIR
            sudo npm install -g @p0tion/phase2cli
            read -p "Press Enter to continue..."
            ;;
        4)
            echo "GitHub Authentication..."
            phase2cli auth
            read -p "Press Enter to continue..."
            ;;
        5)
            echo "Starting ceremony in tmux session '$TMUX_SESSION'..."
            mkdir -p $TRUSTED_DIR
            tmux new-session -d -s $TMUX_SESSION "cd $TRUSTED_DIR && phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony && bash"
            echo "tmux session '$TMUX_SESSION' started."
            read -p "Press Enter to continue..."
            ;;
        6)
            echo "Attaching to tmux session '$TMUX_SESSION'..."
            tmux attach -t $TMUX_SESSION
            read -p "Press Enter to continue..."
            ;;
        7)
            echo "Exiting... MADE BY PRODIP"
            exit 0
            ;;
        *)
            echo "Invalid option! Please choose 1-7."
            read -p "Press Enter to continue..."
            ;;
    esac
done

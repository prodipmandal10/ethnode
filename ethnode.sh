#!/bin/bash

echo "=================================="
echo "        MADE BY PRODIP"
echo "=================================="

# Step 1: Install Dependencies
read -p "Step 1: Install dependencies? (y/n): " dep
if [[ "$dep" == "y" || "$dep" == "Y" ]]; then
    echo "Installing dependencies..."
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y curl git build-essential tmux
else
    echo "Skipping dependencies installation..."
fi

# Step 2: Install Node.js and npm
read -p "Step 2: Install Node.js v20 and npm latest? (y/n): " nodejs
if [[ "$nodejs" == "y" || "$nodejs" == "Y" ]]; then
    echo "Installing Node.js v20 and npm..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
    sudo apt install -y nodejs
    sudo npm install -g npm@latest
else
    echo "Skipping Node.js installation..."
fi

# Step 3: Install Phase2 CLI
read -p "Step 3: Install Phase2 CLI? (y/n): " cli
if [[ "$cli" == "y" || "$cli" == "Y" ]]; then
    mkdir -p ~/trusted-setup-tmp && cd ~/trusted-setup-tmp
    sudo npm install -g @p0tion/phase2cli
else
    echo "Skipping Phase2 CLI installation..."
fi

# Step 4: GitHub Authentication
read -p "Step 4: Authenticate with GitHub now? (y/n): " auth
if [[ "$auth" == "y" || "$auth" == "Y" ]]; then
    phase2cli auth
else
    echo "Skipping GitHub authentication..."
fi

# Step 5: Start Ceremony in tmux
read -p "Step 5: Start ceremony in tmux session 'GEN'? (y/n): " tmuxstart
if [[ "$tmuxstart" == "y" || "$tmuxstart" == "Y" ]]; then
    tmux new-session -d -s GEN "cd ~/trusted-setup-tmp && phase2cli contribute -c ethstorage-v1-trusted-setup-ceremony && bash"
    echo "tmux session 'GEN' started."
else
    echo "Skipping tmux session creation..."
fi

# Step 6: View contributor session
read -p "Step 6: View your contributor session now? (y/n): " view
if [[ "$view" == "y" || "$view" == "Y" ]]; then
    tmux attach -t GEN
else
    echo "You can attach later using: tmux attach -t GEN"
fi

echo "=================================="
echo "     Ceremony Setup Complete!"
echo "        MADE BY PRODIP"
echo "=================================="

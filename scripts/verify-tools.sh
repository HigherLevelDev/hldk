#!/bin/bash

set -e

echo "Verifying and installing required tools..."

# Function to install nvm
install_nvm() {
    echo "Installing nvm..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

# Function to install Node.js using nvm
install_node() {
    echo "Installing Node.js 21 using nvm..."
    nvm install 21
    nvm use 21
    nvm alias default 21
}

# Check for nvm
if ! command -v nvm &> /dev/null; then
    install_nvm
fi

# Ensure nvm is loaded
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Check for Node.js
if ! command -v node &> /dev/null || [ "$(node -v | cut -d. -f1 | sed 's/v//')" -lt 21 ]; then
    echo "Node.js 21 not found. Installing Node.js 21..."
    install_node
else
    echo "Node.js 21 or higher is already installed."
fi

# Check for pnpm
if ! command -v pnpm &> /dev/null; then
    echo "pnpm not found. Installing pnpm..."
    npm install -g pnpm
    if [ $? -ne 0 ]; then
        echo "Failed to install pnpm. Please check your npm installation and try again."
        exit 1
    fi
else
    echo "pnpm is already installed."
fi

echo "All required tools are installed and up to date!"

# Check for pnpm
if ! command -v pnpm &> /dev/null; then
    echo "pnpm not found. Installing pnpm..."
    npm install -g pnpm
    if [ $? -ne 0 ]; then
        echo "Failed to install pnpm. Please check your npm installation and try again."
        exit 1
    fi
else
    echo "pnpm is already installed."
fi

echo "All required tools are installed and up to date!"
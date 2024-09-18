#!/bin/bash

set -e

echo "Verifying and installing required tools..."

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing Node.js 21..."
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
    sudo apt-get install -y nodejs
elif [ "$(node -v | cut -d. -f1 | sed 's/v//')" -lt 21 ]; then
    echo "Upgrading Node.js to version 21..."
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
    sudo apt-get install -y nodejs
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
#!/bin/bash

set -e

echo "Verifying and installing required tools..."

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

echo "Detected OS: $OS"

# Function to install Node.js on macOS
install_node_macos() {
    echo "Installing Node.js 21 using Homebrew..."
    brew update
    brew install node@21
    brew link node@21 --force
}

# Function to install Node.js on Linux
install_node_linux() {
    echo "Installing Node.js 21 on Linux..."
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
    sudo apt-get install -y nodejs
}

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing Node.js 21..."
    if [[ "$OS" == "macOS" ]]; then
        install_node_macos
    else
        install_node_linux
    fi
elif [ "$(node -v | cut -d. -f1 | sed 's/v//')" -lt 21 ]; then
    echo "Upgrading Node.js to version 21..."
    if [[ "$OS" == "macOS" ]]; then
        install_node_macos
    else
        install_node_linux
    fi
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
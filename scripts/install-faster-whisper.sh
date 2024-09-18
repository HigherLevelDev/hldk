#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install Python and pip on different systems
install_python_and_pip() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        echo "Installing Python3 and pip for macOS..."
        brew install python
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        echo "Installing Python3 and pip for Linux..."
        if command_exists apt-get; then
            sudo apt-get update
            sudo apt-get install -y python3 python3-pip
        elif command_exists yum; then
            sudo yum update
            sudo yum install -y python3 python3-pip
        else
            echo "Unable to install Python3 and pip. Please install them manually."
            exit 1
        fi
    else
        echo "Unsupported operating system"
        exit 1
    fi
}

# Check if Python3 is installed
if ! command_exists python3; then
    echo "Python3 is not installed. Installing Python3..."
    install_python_and_pip
else
    echo "Python3 is already installed."
fi

# Check if pip is installed
if ! command_exists pip3; then
    echo "pip3 is not installed. Installing pip3..."
    install_python_and_pip
else
    echo "pip3 is already installed."
fi

# Install faster-whisper-cli
echo "Installing faster-whisper-cli..."
pip3 install faster-whisper-cli

echo "Installation complete!"
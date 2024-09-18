#!/bin/bash

# HLDK Server Startup Script

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    handle_error "Node.js is not installed. Please install Node.js and try again."
fi

# Set the path to the server file
SERVER_FILE="server/hldk-server.js"

# Check if the server file exists
if [ ! -f "$SERVER_FILE" ]; then
    handle_error "Server file not found: $SERVER_FILE"
fi

# Check for .env file and load environment variables
ENV_FILE=".env"
if [ -f "$ENV_FILE" ]; then
    echo "Loading environment variables from $ENV_FILE"
    export $(cat "$ENV_FILE" | xargs)
else
    echo "Warning: $ENV_FILE not found. Using default environment variables."
fi

echo "Checking npm packages..."
pnpm install

# Start the server
echo "Starting HLDK server..."
node "$SERVER_FILE" || handle_error "Failed to start the server. Please check the logs for more information."
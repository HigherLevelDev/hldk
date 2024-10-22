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

# Function to start the server
start_server() {
    # Set the PLUGIN_DIR environment variable
    export PLUGIN_DIR="$PWD/server/plugins"
    
    local start_command="node $SERVER_FILE"
    echo "Starting the server with command: $start_command"
    echo "PLUGIN_DIR set to: $PLUGIN_DIR"
    env $(cat .env | grep -v '^#' | xargs) $start_command &
    SERVER_PID=$!

    # Wait for the server to start (adjust the sleep time if needed)
    sleep 5

    # Check if the server process is still running
    if ps -p $SERVER_PID > /dev/null; then
        echo "Server is running..."
    else
        echo "Server failed to start. Exiting."
        exit 1
    fi
}

echo "Checking npm packages..."
pnpm install

# Start the server
echo "Starting HLDK server..."
start_server

# Keep the script running and capture any errors
wait $SERVER_PID || { echo "Server process exited with an error. Exiting."; exit 1; }
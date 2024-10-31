#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Function to cleanup ChromaDB on script exit
cleanup() {
    echo "Cleaning up..."
    ./docker/down.sh
}

# Start ChromaDB in detached mode
echo "Starting ChromaDB in detached mode..."
./docker/chromaOnlyUp.sh -d || handle_error "Failed to start ChromaDB"

# Wait a moment for ChromaDB to initialize
echo "Waiting for ChromaDB to initialize..."
sleep 2

# Start HLDK in the foreground
echo "Starting HLDK..."
echo "Note: ChromaDB is running in detached mode. Use ./docker/down.sh to stop it when done."
./hldk.sh

# Cleanup when the script exits
trap cleanup EXIT
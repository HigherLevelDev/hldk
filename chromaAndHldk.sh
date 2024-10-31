#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Start ChromaDB in detached mode
echo "Starting ChromaDB in detached mode..."
./docker/chromaOnlyUp.sh -d || handle_error "Failed to start ChromaDB"

# Wait a moment for ChromaDB to initialize
echo "Waiting for ChromaDB to initialize..."
sleep 5

# Start HLDK
echo "Starting HLDK..."
./hldk.sh
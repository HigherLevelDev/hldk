#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    handle_error "Docker is not installed. Please install Docker and try again."
fi

# Verify docker compose command is available
if ! docker compose version &> /dev/null; then
    handle_error "Docker Compose (V2) is not available. Please ensure you have a recent version of Docker installed."
fi

# Stop and remove the containers
echo "Stopping and removing Docker containers..."
docker compose down

echo "All services have been stopped and removed."
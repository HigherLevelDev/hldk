#!/bin/bash

# Parse command line arguments
DETACH=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--detach) DETACH=true; shift ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
done

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

# Build and start the containers
echo "Starting ChromaDB container..."
if [ "$DETACH" = true ]; then
    # Start in detached mode if detach flag is set
    docker compose -f docker-compose-chromadb-only.yml up -d

    # Wait for service to be ready
    echo "Waiting for service to start..."
    sleep 5

    # Check if the service is running
    if docker compose -f docker-compose-chromadb-only.yml ps | grep -q "chroma.*"; then
        echo "ChromaDB service is running"
    else
        handle_error "ChromaDB service failed to start"
    fi

    echo "ChromaDB is up and running!"
    echo "ChromaDB is available at http://localhost:8000"
else
    # Start in foreground with logs (default behavior)
    docker compose -f docker-compose-chromadb-only.yml up
fi
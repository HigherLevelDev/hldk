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

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    handle_error "Docker Compose is not installed. Please install Docker Compose and try again."
fi

# Check if .env file exists, if not copy from example
if [ ! -f .env ]; then
    if [ -f .env.example ]; then
        echo "Creating .env file from .env.example..."
        cp .env.example .env
    else
        handle_error ".env file not found and no .env.example to copy from"
    fi
fi

# Build and start the containers
echo "Building and starting Docker containers..."
cd docker && docker-compose up --build -d

# Wait for services to be ready
echo "Waiting for services to start..."
sleep 5

# Check if the services are running
if docker-compose ps | grep -q "hldk.*running"; then
    echo "HLDK service is running"
else
    handle_error "HLDK service failed to start"
fi

if docker-compose ps | grep -q "chroma.*running"; then
    echo "Chroma service is running"
else
    handle_error "Chroma service failed to start"
fi

echo "All services are up and running!"
echo "HLDK is available at http://localhost:3010"
echo "Chroma is available at http://localhost:8000"
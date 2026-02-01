#!/bin/bash

# Simple deployment script for the Monad project.

echo "Starting deployment..."

# Step 1: Check if the project is in a clean state
if ! git diff-index --quiet HEAD --; then
    echo "Working directory is not clean. Please commit your changes before deploying."
    exit 1
fi

# Step 2: Pull the latest changes
echo "Pulling latest changes from the remote..."
git pull origin main

# Step 3: Install dependencies
echo "Installing dependencies..."
npm install

# Step 4: Run tests
echo "Running tests..."
npm test

# Step 5: Restart the application
echo "Restarting the application..."
pm2 restart monad

echo "Deployment complete."

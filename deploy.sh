#!/bin/bash

# Set npm configuration
export NPM_CONFIG_LEGACY_PEER_DEPS=true
export NPM_CONFIG_AUDIT=false
export NPM_CONFIG_FUND=false

# Install dependencies with legacy peer deps to resolve conflicts
echo "Installing dependencies..."
npm install --legacy-peer-deps

# Build the application in production mode
echo "Building application in production mode..."
npm run build:prod

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build completed successfully!"
    echo "Built files are in dist/angular-signup-verification-boilerplate/"
    echo "Total build size:"
    du -sh dist/angular-signup-verification-boilerplate/
else
    echo "Build failed!"
    exit 1
fi 
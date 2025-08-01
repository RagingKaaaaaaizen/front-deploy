#!/bin/bash

# Set npm configuration
export NPM_CONFIG_LEGACY_PEER_DEPS=true
export NPM_CONFIG_AUDIT=false

# Install dependencies
echo "Installing dependencies..."
npm install --legacy-peer-deps

# Build the application
echo "Building application..."
npm run build:prod

# Verify the build output
echo "Build completed. Checking output directory..."
ls -la dist/angular-signup-verification-boilerplate/

echo "Build script completed successfully!" 
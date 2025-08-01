#!/bin/bash

echo "🚀 Starting Render deployment build..."

# Set environment variables
export NPM_CONFIG_LEGACY_PEER_DEPS=true
export NPM_CONFIG_AUDIT=false
export NODE_VERSION=18.20.0

# Install dependencies
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps

# Build the application
echo "🔨 Building application..."
npm run build:prod

# Verify the build output
echo "✅ Verifying build output..."
ls -la dist/
ls -la dist/angular-signup-verification-boilerplate/

# Create a simple verification file
echo "Build completed at: $(date)" > dist/angular-signup-verification-boilerplate/build-success.txt

# Show the contents of the output directory
echo "📁 Build output contents:"
ls -la dist/angular-signup-verification-boilerplate/

echo "🎉 Build completed successfully!"
echo "📂 Output directory: dist/angular-signup-verification-boilerplate" 
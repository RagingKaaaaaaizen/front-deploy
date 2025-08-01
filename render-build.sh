#!/bin/bash

echo "Starting Render build process..."

# Install dependencies
npm install --legacy-peer-deps

# Build the application
npm run build:prod

# Ensure the output directory exists and is accessible
echo "Verifying build output..."
ls -la dist/
ls -la dist/angular-signup-verification-boilerplate/

# Create a simple index file to verify the build
echo "Build completed successfully at: $(date)" > dist/angular-signup-verification-boilerplate/build-info.txt

echo "✅ Build completed successfully!"
echo "📁 Output directory: dist/angular-signup-verification-boilerplate" 
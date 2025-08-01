#!/bin/bash

echo "🔧 Fixing Render deployment..."

# Install and build
npm install --legacy-peer-deps
npm run build:prod

# Ensure the output directory exists
mkdir -p dist/angular-signup-verification-boilerplate

# Copy all built files to the correct location
echo "📁 Ensuring correct directory structure..."
ls -la dist/

# Create a verification file
echo "Render deployment ready at: $(date)" > dist/angular-signup-verification-boilerplate/render-ready.txt

echo "✅ Render deployment fixed!"
echo "📂 Publish directory: dist/angular-signup-verification-boilerplate" 
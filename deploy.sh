#!/bin/bash

# Install dependencies with legacy peer deps to resolve conflicts
npm install --legacy-peer-deps

# Build the application
npm run build

# The built files will be in dist/angular-signup-verification-boilerplate/
echo "Build completed successfully!" 
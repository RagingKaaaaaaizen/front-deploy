# Deployment Guide for Computer Lab Inventory Frontend

## Render Deployment

### Configuration Files
- `render.yaml` - Render deployment configuration
- `.npmrc` - npm configuration for dependency resolution
- `deploy.sh` - Deployment script (alternative)

### Build Process
1. **Dependencies**: Installed with `--legacy-peer-deps` to resolve conflicts
2. **Build Command**: `npm run build:prod` (production build)
3. **Output Directory**: `dist/angular-signup-verification-boilerplate`
4. **Node Version**: 18.20.0

### Environment Variables
- `NODE_VERSION`: 18.20.0
- `NPM_CONFIG_LEGACY_PEER_DEPS`: true
- `NPM_CONFIG_AUDIT`: false

### Build Output
The application builds to: `dist/angular-signup-verification-boilerplate/`

### SPA Routing
- `_redirects` file included for SPA routing support
- All routes redirect to `index.html` for client-side routing

### Troubleshooting
- If build fails, check TypeScript compilation errors
- Ensure all dependencies are properly installed
- Verify Node.js version compatibility

### Success Indicators
- ✅ Build completes without TypeScript errors
- ✅ All assets copied to output directory
- ✅ Production optimizations applied
- ✅ SPA routing configured 
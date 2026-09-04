#!/bin/bash
# Run this from inside the mean-auth-app folder: bash setup-frontend.sh
set -e

echo "Removing any broken previous frontend folder..."
rm -rf frontend

echo "Generating a fresh Angular project (answer 'No' to SSR prompt if asked)..."
npx @angular/cli new frontend --routing --style=css --standalone --skip-git --defaults

echo "Copying auth files into frontend/src/app..."
cp frontend-src/auth.service.ts frontend/src/app/
cp frontend-src/auth.guard.ts frontend/src/app/
cp frontend-src/auth.interceptor.ts frontend/src/app/
cp frontend-src/app.config.ts frontend/src/app/
cp frontend-src/app.routes.ts frontend/src/app/
cp frontend-src/app.component.ts frontend/src/app/

echo "Copying login component..."
mkdir -p frontend/src/app/login
cp frontend-src/login/*.ts frontend-src/login/*.html frontend-src/login/*.css frontend/src/app/login/

echo "Copying register component..."
mkdir -p frontend/src/app/register
cp frontend-src/register/*.ts frontend-src/register/*.html frontend-src/register/*.css frontend/src/app/register/

echo "Copying dashboard component..."
mkdir -p frontend/src/app/dashboard
cp frontend-src/dashboard/*.ts frontend-src/dashboard/*.html frontend-src/dashboard/*.css frontend/src/app/dashboard/

echo ""
echo "Done! Now run:"
echo "  cd frontend"
echo "  npm install"
echo "  npx ng serve"

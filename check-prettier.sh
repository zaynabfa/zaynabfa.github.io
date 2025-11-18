#!/bin/bash
# Script to check Prettier formatting before deploying
# Usage: ./check-prettier.sh

echo "🔍 Checking Prettier formatting..."
echo ""

# Check if node_modules exists, if not install dependencies
if [ ! -d "node_modules" ]; then
  echo "📦 Installing Prettier dependencies..."
  npm install --save-dev --save-exact prettier @shopify/prettier-plugin-liquid
fi

# Run Prettier check
echo "✅ Running Prettier check..."
npx prettier . --check

# Check exit code
if [ $? -eq 0 ]; then
  echo ""
  echo "✅ All files are properly formatted!"
  exit 0
else
  echo ""
  echo "❌ Some files need formatting. Run the following to auto-fix:"
  echo "   npx prettier . --write"
  exit 1
fi


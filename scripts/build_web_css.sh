#!/usr/bin/env bash
set -euo pipefail

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required to build Tailwind CSS" >&2
  exit 1
fi

if [ ! -d node_modules ]; then
  npm install
fi

npm run build:css

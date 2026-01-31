$ErrorActionPreference = "Stop"

if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
  Write-Error "npm is required to build Tailwind CSS"
}

if (-not (Test-Path "node_modules")) {
  npm install
}

npm run build:css

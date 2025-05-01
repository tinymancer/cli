#!/bin/bash
set -e

APP_NAME="tinymancer"
VERSION="v0.1.0"
DIST_DIR="dist"

mkdir -p "$DIST_DIR"

# Build binaries
GOOS=linux GOARCH=amd64 go build -o "$DIST_DIR/${APP_NAME}-linux-amd64"
GOOS=linux GOARCH=arm64 go build -o "$DIST_DIR/${APP_NAME}-linux-arm64"

# Package binaries
cd "$DIST_DIR"

zip "${APP_NAME}-linux-amd64.zip" "${APP_NAME}-linux-amd64"
zip "${APP_NAME}-linux-arm64.zip" "${APP_NAME}-linux-arm64"

# Create checksums file
shasum -a 256 *.zip > "${APP_NAME}_${VERSION}_checksums.txt"

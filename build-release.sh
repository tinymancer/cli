#!/bin/bash
set -e

APP_NAME="tinymancer"
VERSION="v0.1.0"
DIST_DIR="dist"
PKG_PATH="github.com/tinymancer/cli/cmd"

mkdir -p "$DIST_DIR"

echo "[🔨] Building binaries..."

# Build binaries with version injection
GOOS=linux GOARCH=amd64 go build -ldflags "-X '${PKG_PATH}.version=${VERSION}'" -o "$DIST_DIR/${APP_NAME}-linux-amd64"
GOOS=linux GOARCH=arm64 go build -ldflags "-X '${PKG_PATH}.version=${VERSION}'" -o "$DIST_DIR/${APP_NAME}-linux-arm64"

cd "$DIST_DIR"

echo "[📦] Packaging zip archives..."

# Package for amd64
cp "${APP_NAME}-linux-amd64" "${APP_NAME}"
zip -q "${APP_NAME}-linux-amd64.zip" "${APP_NAME}"
rm "${APP_NAME}"

# Package for arm64
cp "${APP_NAME}-linux-arm64" "${APP_NAME}"
zip -q "${APP_NAME}-linux-arm64.zip" "${APP_NAME}"
rm "${APP_NAME}"

echo "[🔐] Generating checksums..."
shasum -a 256 *.zip > "${APP_NAME}_${VERSION}_checksums.txt"

echo "[✅] Build & packaging complete:"
ls -lh *.zip *.txt

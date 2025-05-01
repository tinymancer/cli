#!/bin/bash
set -e

APP_NAME="tinymancer"
REPO="tinymancer/cli"
VERSION="v0.1.0"
INSTALL_DIR="/usr/local/bin"

# Detect arch
ARCH=$(uname -m)
case "$ARCH" in
  x86_64) ARCH="amd64" ;;
  aarch64 | arm64) ARCH="arm64" ;;
  *) echo "[✖] Unsupported architecture: $ARCH" && exit 1 ;;
esac

PLATFORM="linux"
ASSET="${APP_NAME}-${PLATFORM}-${ARCH}.zip"
CHECKSUM_FILE="${APP_NAME}_${VERSION}_checksums.txt"

TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

echo "[⇩] Downloading ${ASSET}..."
curl -sL -O "https://github.com/${REPO}/releases/download/${VERSION}/${ASSET}"

echo "[⇩] Downloading checksums..."
curl -sL -O "https://github.com/${REPO}/releases/download/${VERSION}/${CHECKSUM_FILE}"

echo "[🔐] Verifying checksum..."
SHA256=$(shasum -a 256 "${ASSET}" | awk '{print $1}')
MATCH=$(grep "${SHA256}" "${CHECKSUM_FILE}" || true)

if [ -z "$MATCH" ]; then
  echo "[✖] Checksum verification failed!"
  exit 1
fi

echo "[📦] Extracting..."
unzip -q "${ASSET}"

echo "[⚙] Installing to ${INSTALL_DIR}..."
if [ -w "$INSTALL_DIR" ]; then
  mv "${APP_NAME}" "$INSTALL_DIR/"
else
  sudo mv "${APP_NAME}" "$INSTALL_DIR/"
fi

chmod +x "${INSTALL_DIR}/${APP_NAME}"

echo "[✅] Installed: ${INSTALL_DIR}/${APP_NAME}"
"${APP_NAME}" --version || "${APP_NAME}"

#!/bin/bash
set -e

REPO="tinymancer/cli"
VERSION="v0.1.0"
BINARY="tinymancer"
INSTALL_DIR="/usr/local/bin"

ARCH=$(uname -m)
OS=$(uname -s)

# Detect architecture
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64 | arm64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Download binary
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

echo "[tinymancer] Downloading $VERSION for $OS-$ARCH..."

URL="https://github.com/$REPO/releases/download/$VERSION/$BINARY"
curl -sL "$URL" -o "$BINARY"

chmod +x "$BINARY"

# Move to /usr/local/bin or prompt for sudo
if [ -w "$INSTALL_DIR" ]; then
    mv "$BINARY" "$INSTALL_DIR/"
else
    echo "[tinymancer] Requires sudo to install to $INSTALL_DIR"
    sudo mv "$BINARY" "$INSTALL_DIR/"
fi

echo "[tinymancer] Installed at $INSTALL_DIR/$BINARY"
"$INSTALL_DIR/$BINARY"

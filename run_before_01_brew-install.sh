#!/bin/sh

if ! command -v brew >/dev/null 2>&1; then
    echo "🔄 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        echo "❌ Error: Homebrew installation failed."
        exit 1
    }
    echo "✅ Homebrew installed successfully."
else
    echo "✅ Homebrew is already installed."
fi

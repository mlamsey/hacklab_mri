#!/bin/bash

TARGET_SUFFIX="/hackney_share/PARTNER/derivatives"
CURRENT_DIR=$(pwd)

if [[ "$CURRENT_DIR" == *"$TARGET_SUFFIX" ]]; then
    echo "✅ Current directory is $CURRENT_DIR"
    echo "Starting HTTP server on port 8000..."
    python3 -m http.server 8000
else
    echo "❌ Error: You must be in a directory ending with $TARGET_SUFFIX"
    echo "Current directory is: $CURRENT_DIR"
    exit 1
fi


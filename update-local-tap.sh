#!/usr/bin/env bash
set -euo pipefail

TAP_NAME="aws/homebrew-tap"
TAP_LOCATION=""
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    TAP_LOCATION="/home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    TAP_LOCATION="/usr/local/Homebrew/Library/Taps/"
else
    echo "Unsupported OS: $OSTYPE"
    exit 2
fi

TAP_LOCATION+="${TAP_NAME}"

rm -rf "${TAP_LOCATION}"
cp -a . "${TAP_LOCATION}"

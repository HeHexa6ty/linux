#!/bin/bash

# Default installation path
default_install_path=~/node

# Check if the number of arguments is correct
if [ "$#" -gt 1 ]; then
    echo "Usage: $0 [install_path]"
    exit 1
fi

# Set installation path based on argument or use default
install_path="${1:-$default_install_path}"

# Remove installation directory
if [ -d "$install_path" ]; then
    rm -rf "$install_path"
fi

# Remove environment variable settings from ~/.zshrc
sed -i '/export NODE_HOME/d' ~/.zshrc
sed -i '/export PATH=$PATH:$NODE_HOME/d' ~/.zshrc

# Source the updated .zshrc
source ~/.zshrc

echo "Node.js and npm uninstalled successfully."

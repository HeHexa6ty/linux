#!/bin/bash

# Default values
# Current node version for 9.03.2023 (LTS) -> v12.22.9
default_download_link="https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.xz"
default_install_path=~/node

# Check if the number of arguments is correct
if [ "$#" -gt 2 ]; then
    echo "Usage: $0 [download_link] [install_path]"
    exit 1
fi

# Set download link and installation path based on arguments or use defaults
download_link="${1:-$default_download_link}"
install_path="${2:-$default_install_path}"

# Create installation directory
mkdir -p "$install_path"
cd "$install_path"

# Download Node.js
wget "$download_link"

# Extract Node.js
tar_filename=$(basename "$download_link")
tar -xvf "$tar_filename"
rm "$tar_filename"

# Set environment variables
echo "export NODE_HOME=$install_path/$(basename "$tar_filename" .tar.xz)" >> ~/.zshrc
echo "export PATH=\$PATH:\$NODE_HOME/bin" >> ~/.zshrc
source ~/.zshrc

# Display Node.js version
node --version


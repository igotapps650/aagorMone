#!/bin/bash

# Update package lists and install dependencies
sudo apt-get update && sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

# Clone XMRig repository
git clone https://github.com/xmrig/xmrig.git

# Change to XMRig directory
cd xmrig

# Create build directory and change to it
mkdir build
cd build

# Configure build
cmake ..

# Build XMRig
make -j$(nproc)

# Prompt for mining pool address
read -p "Enter mining pool address: " pool_address

# Prompt for Monero wallet address
read -p "Enter Monero wallet address: " wallet_address

# Start mining with XMRig
./xmrig -o $pool_address -u $wallet_address -p x -k --threads=40


#!/bin/bash
# Update system packages
sudo yum update -y

# Install Node.js if not already installed
if ! command -v node &> /dev/null; then
    curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
    sudo yum install -y nodejs
fi

# Install PM2 globally if not already installed
if ! command -v pm2 &> /dev/null; then
    sudo npm install -g pm2
fi

# Navigate to the application directory
cd /home/ec2-user/acebook

# Install application dependencies
npm install

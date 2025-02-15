#!/bin/bash
# Navigate to the application directory
cd /home/ec2-user/acebook

# Start the application using PM2
pm2 start npm --name "acebook" -- start

# Save the PM2 process list
pm2 save

# Set PM2 to start on system boot
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u ec2-user --hp /home/ec2-user

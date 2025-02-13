#!/bin/bash
# Navigate to application directory
cd /var/www/html
# Install application dependencies
npm install
# Start the application
pm2 start app.js

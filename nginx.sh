#!/bin/bash

# Absolute path to app.conf in Jenkins workspace
APP_CONF="/var/lib/jenkins/workspace/django-cicd-pipeline/app.conf"

# Check if app.conf exists
if [ ! -f "$APP_CONF" ]; then
    echo "❌ app.conf not found at $APP_CONF"
    exit 1
fi

# Copy app.conf to sites-available
sudo cp -f "$APP_CONF" /etc/nginx/sites-available/app

# Remove default site to prevent Welcome page
if [ -L /etc/nginx/sites-enabled/default ] || [ -f /etc/nginx/sites-enabled/default ]; then
    sudo rm -f /etc/nginx/sites-enabled/default
fi

# Create symlink in sites-enabled
if [ ! -L /etc/nginx/sites-enabled/app ]; then
    sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
fi

# Test Nginx configuration
sudo nginx -t || { echo "❌ Nginx config test failed"; exit 1; }

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "✅ Nginx has been restarted and enabled"

# Show status of Gunicorn
sudo systemctl status gunicorn --no-pager

# Optional: show active Nginx sites
echo "Active Nginx sites:"
ls -l /etc/nginx/sites-enabled/

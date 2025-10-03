#!/bin/bash

APP_CONF="/var/lib/jenkins/workspace/django-cicd-pipeline/app.conf"

# Copy config to sites-available
sudo cp -f "$APP_CONF" /etc/nginx/sites-available/app

# Create symlink if missing
if [ ! -L /etc/nginx/sites-enabled/app ]; then
    sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
fi

# Test Nginx configuration
sudo nginx -t || { echo "❌ Nginx test failed"; exit 1; }

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "✅ Nginx restarted"

# Check Gunicorn
sudo systemctl status gunicorn --no-pager

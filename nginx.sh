#!/bin/bash
sudo cp -rf app.conf /etc/nginx/conf.d
chmod 710 /var/lib/jenkins/workspace/django-cicd-pipeline
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled
sudo nginx -t

sudo systemctl daemon-reload
sudo systemctl start nginx
sudo systemctl enable nginx

echo "gunicor has started"

sudo systemctl status nginx

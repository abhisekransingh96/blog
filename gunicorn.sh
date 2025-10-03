#!/bin/bash
source env/bin/activate
cd /var/lib/jenkins/workspace/django-cicd-pipeline/jenkin_python 

python manage.py makemigrations
python manage.py migrate

echo "migation completeed"

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "gunicor has started"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn
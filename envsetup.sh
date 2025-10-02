#!/bin/bash
if [-d venv]
then
 echo "python vertual env exit"

else
    python3 -m venv env

fi
echo $PWD
source env/bin/activate
pip3 install requirments.txt

if [-d logs]
then
 echo "log folder exit"
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

sudo chmod -R 777 logs
echo "nvsetup finish"

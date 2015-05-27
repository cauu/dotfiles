#!/bin/sh

#Install pip

curl -O https://bootstrap.pypa.io/get-pip.py

python get-pip.py

#Install virtual environment

pip install virtualenv

#Install virtual environment wrapper

pip install virtualenvwrapper
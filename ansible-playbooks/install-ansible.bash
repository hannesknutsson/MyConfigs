#!/bin/bash
sudo apt install python3 curl
sudo yum install python3 curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
rm get-pip.py
python3 -m pip install --user ansible
python3 -m pip install --upgrade --user ansible
ansible --version | grep core
python3 -m pip show ansible

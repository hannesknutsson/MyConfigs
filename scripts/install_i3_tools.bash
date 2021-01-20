#!/bin/bash

#Install i3lock-fancy
(git clone https://github.com/meskarune/i3lock-fancy.git && cd i3lock-fancy && make install)

#Remove sources for i3lock-fancy
rm -rf i3lock-fancy

#Install i3lock service for automatically locking before suspending
cp services/i3lock.service /etc/systemd/system/
systemctl enable i3lock

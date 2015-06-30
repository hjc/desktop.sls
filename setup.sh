#!/usr/bin/env bash

apt-get install salt-master salt-minion
mkdir /srv
ln -sf /home/$USER/gits/desktop/salt/minion /etc/salt/minion
ln -sd /home/$USER/gits/desktop/salt/roots/ /srv/salt/

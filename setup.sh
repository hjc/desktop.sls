#!/usr/bin/env bash

apt-get install salt-master salt-minion
mkdir -p /srv
ln -sf $(pwd)/salt/minion /etc/salt/minion
ln -sf $(pwd)/salt/master /etc/salt/master
ln -sdf $(pwd)/salt/roots/ /srv/salt
ln -sdf $(pwd)/salt/pillar /srv/pillar
/etc/init.d/salt-minion restart
/etc/init.d/salt-master restart

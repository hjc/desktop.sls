#!/bin/bash

# Discussion, issues and change requests at:
#   https://github.com/nodesource/distributions
#
# Script to install the NodeSource Node.js 0.12 repo onto a
# Debian or Ubuntu system.
#
# Taken from the nodesource GitHub repository and modified for use in Kosher.

export DEBIAN_FRONTEND=noninteractive

bail() {
    echo 'Error executing command ("$1"), exiting'
    exit 1
}

exec_cmd_nobail() {
    bash -c "$1"
}

exec_cmd() {
    exec_cmd_nobail "$1" || bail "$1"
}

DISTRO=$(lsb_release -c -s)

check_alt() {
    if [ "X${DISTRO}" == "X${2}" ]; then
        DISTRO="${4}"
    fi
}

check_alt "Linux Mint"    "rafaela"  "Ubuntu" "trusty"
check_alt "Linux Mint"    "rebecca"  "Ubuntu" "trusty"
check_alt "Linux Mint"    "qiana"    "Ubuntu" "trusty"
check_alt "Linux Mint"    "maya"     "Ubuntu" "precise"
check_alt "LMDE"          "betsy"    "Debian" "jessie"
check_alt "elementaryOS"  "luna"     "Ubuntu" "precise"
check_alt "elementaryOS"  "freya"    "Ubuntu" "trusty"
check_alt "Trisquel"      "toutatis" "Ubuntu" "precise"
check_alt "Trisquel"      "belenos"  "Ubuntu" "trusty"
check_alt "BOSS"          "anokha"   "Debian" "wheezy"
check_alt "Debian"        "stretch"  "Debian" "jessie"

if [ "X${DISTRO}" == "Xdebian" ]; then
  NEWDISTRO=$([[ -e /etc/debian_version ]] && cat /etc/debian_version  | cut -d/ -f1)
  if [ "X${DISTRO}" != "X" ]; then
    DISTRO=$NEWDISTRO
  fi
fi

exec_cmd_nobail "curl -sLf -o /dev/null 'https://deb.nodesource.com/node_0.12/dists/${DISTRO}/Release'"
RC=$?

if [[ $RC != 0 ]]; then
    echo "Your distribution, identified as \"${DISTRO}\", is not currently supported, please contact NodeSource at https://github.com/nodesource/distributions/issues if you think this is incorrect or would like your distribution to be considered for support"
    exit 1
fi

# chris-lea is deprecated; remove
if [ -f "/etc/apt/sources.list.d/chris-lea-node_js-$DISTRO.list" ]; then
    exec_cmd_nobail 'add-apt-repository -y -r ppa:chris-lea/node.js'
    exec_cmd "rm -f /etc/apt/sources.list.d/chris-lea-node_js-${DISTRO}.list"
fi

exec_cmd "echo 'deb https://deb.nodesource.com/node_0.12 ${DISTRO} main' > /etc/apt/sources.list.d/nodesource.list"
exec_cmd "echo 'deb-src https://deb.nodesource.com/node_0.12 ${DISTRO} main' >> /etc/apt/sources.list.d/nodesource.list"

exec_cmd 'touch /home/{{ salt.pillar.get('user-config:username', 'root') }}/{{ salt.pillar.get('kosher:data-directory') }}/nodesource/installed'

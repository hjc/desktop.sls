##
# A collection of files and individual package sources that are used to configure
# a system intiailly, and to provide additional, third-party packages later.
#
# This module not only handles setting up an initial package sources environment
# that is both comprehensive and secure, but it also holds all other states
# regarding individual package sources or package source management.
#
# The initial state of package sources is setup by
# core.pkg-sources.config-by-distro, which reads the OS name and release
# codename to determine an ideal initial package state.
##

include:
  - core.pkg-sources.config-by-distro

/etc/apt/sources.list.d:
  file.directory: 
    - name: /etc/apt/sources.list.d
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

ppa-pkgs:
  pkg.installed:
    - pkgs:
      - debconf-utils
      - python-pycurl
      - python-apt
      - python-software-properties
      - software-properties-common

# this will automatically call apt get update when a new .list file is added, but you
# should use pkgrepo.managed for that instead
# apt-get-update:
#   cmd.wait:
#     - name: apt-get update
#     - watch:
#      - file: /etc/apt/sources.list.d/*

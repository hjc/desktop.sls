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

debian-non-free-source:
  pkgrepo.managed:
    - name: deb http://ftp.us.debian.org/debian/ {{ grains['lsb_distrib_codename'] }} main contrib non-free
    - file: /etc/apt/sources.list.d/debian-non-free.list

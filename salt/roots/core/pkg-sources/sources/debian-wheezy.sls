debian-wheezy-source:
  pkgrepo.managed:
    - name: deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free
    - file: /etc/apt/sources.list.d/debian-wheezy.list

debian-wheezy-src-source:
  pkgrepo.managed:
    - name: deb-src http://ftp.us.debian.org/debian/ wheezy main
    - file: /etc/apt/sources.list.d/debian-wheezy.list

debian-sid-source:
  pkgrepo.managed:
    - name: deb http://ftp.us.debian.org/debian/ sid main contrib non-free
    - file: /etc/apt/sources.list.d/debian-sid.list

debian-sid-src-source:
  pkgrepo.managed:
    - name: deb-src http://ftp.us.debian.org/debian/ sid main
    - file: /etc/apt/sources.list.d/debian-sid.list

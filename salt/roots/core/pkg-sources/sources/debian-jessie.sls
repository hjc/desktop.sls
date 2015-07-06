debian-jessie-source:
  pkgrepo.managed:
    - name: deb http://ftp.us.debian.org/debian/ jessie main contrib non-free
    - file: /etc/apt/sources.list.d/debian-jessie.list
    - require-in:
      - pkg: keepass2

debian-jessie-src-source:
  pkgrepo.managed:
    - name: deb-src http://ftp.us.debian.org/debian/ jessie main
    - file: /etc/apt/sources.list.d/debian-jessie.list

debian-jessie-source:
  pkgrepo.managed:
    - name: deb http://ftp.us.debian.org/debian/ jessie main contrib non-free
    - file: /etc/apt/sources.list.d/debian-jessie.list
    - require-in:
      # Debian stretch currently doesn't have this in their main repo, so we need
      # a Jessie backport, add a require so things go well at highstate time (this
      # will not help if you manually run the keepass2 state though). Also, if
      # the user does not install keepass2, this causes no harm.
      - pkg: keepass2

debian-jessie-src-source:
  pkgrepo.managed:
    - name: deb-src http://ftp.us.debian.org/debian/ jessie main
    - file: /etc/apt/sources.list.d/debian-jessie.list

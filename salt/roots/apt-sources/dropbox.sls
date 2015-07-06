dropbox-ppa:
  pkgrepo.managed:
    - name: deb [arch=i386,amd64] http://linux.dropbox.com/debian sid main
    - file: /etc/apt/sources.list.d/dropbox.list
    - require-in:
      - pkg: dropbox
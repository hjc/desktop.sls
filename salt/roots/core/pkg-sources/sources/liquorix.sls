liquorix-ppa:
  pkgrepo.managed:
    - name: deb http://liquorix.net/debian sid main
    - file: /etc/apt/sources.list.d/liquorix.list
    - require-in:
      - liquorix-keyring

liquorix-deb-src-ppa:
  pkgrepo.managed:
    - name: deb-src http://liquorix.net/debian sid main
    - file: /etc/apt/sources.list.d/liquorix.list
    - require-in:
      - liquorix-keyring

liquorix-keyring:
  pkg.latest:
    - require:
      - pkgrepo: liquorix-ppa
    - skip_verify: True

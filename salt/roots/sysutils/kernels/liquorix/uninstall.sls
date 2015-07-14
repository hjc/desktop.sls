remove-liquorix-pkgs:
  pkg.removed:
    - pkgs:
{% if grains['cpuarch'] == 'x86_64' %}
      - linux-image-liquorix-amd64
      - linux-headers-liquorix-amd64
      - linux-headers-4.1-2.dmz.1-liquorix-amd64
      - linux-image-4.1-2.dmz.1-liquorix-amd64
{% else %}
      - linux-image-liquorix-686
      - linux-headers-liquorix-686
      - linux-headers-4.1-2.dmz.1-liquorix-amd64
      - linux-image-4.1-2.dmz.1-liquorix-amd64
{% endif %}
      - liquorix-keyring
      - liquorix-archive-keyring

remove-liquorix-ppa:
  pkgrepo.absent:
    - name: deb http://liquorix.net/debian sid main
    - file: /etc/apt/sources.list.d/liquorix.list

remove-liquorix-deb-src-ppa:
  pkgrepo.absent:
    - name: deb-src http://liquorix.net/debian sid main
    - file: /etc/apt/sources.list.d/liquorix.list

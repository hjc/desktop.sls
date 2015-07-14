include:
  - core.pkg-sources.sources.liquorix

liquorix-pkgs:
  pkg.latest:
    - pkgs:
{% if grains['cpuarch'] == 'x86_64' %}
      - linux-image-liquorix-amd64
      - linux-headers-liquorix-amd64
{% else %}
      - linux-image-liquorix-686
      - linux-headers-liquorix-686
{% endif %}
    - require:
      - pkgrepo: liquorix-ppa
      - pkg: liquorix-keyring

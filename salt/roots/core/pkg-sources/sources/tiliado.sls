tiliado-ppa-key:
  cmd.run:
    - name: apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 40554B8FA5FE6F6A
    - unless: apt-key list | grep A5FE6F6A
    - require-in:
      - pkgrepo: nuvolaplayer-ppa

nuvolaplayer-ppa:
  pkgrepo.managed:
    {% if grains['os'] == 'Ubuntu' %}
      {% if grains['lsb_distrib_codename'] not in ('trusty', 'utopic', 'vivid') %}
    - name: deb https://tiliado.eu/nuvolaplayer/repository/deb/ vivid stable
      {% else %}
    - name: deb https://tiliado.eu/nuvolaplayer/repository/deb/ {{ grains['lsb_distrib_codename'] }} stable
      {% endif %}
    {% elif grains['os'] == 'Debian' %}
    - name: deb https://tiliado.eu/nuvolaplayer/repository/deb/ {{ grains['lsb_distrib_codename'] }} stable
    {% endif %}

    - file: /etc/apt/sources.list.d/tiliado.list
    - keyserver: keyserver.ubuntu.com
    - enabled: True
    - keyid: A5FE6F6A

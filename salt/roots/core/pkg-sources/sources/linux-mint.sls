{% if grains['os'] == 'Debian' %}
##
# Add the LMDE repo, it provides some packages, such as FireFox, that stock Deb
# does not.
##
lmde-ppa:
  pkgrepo.managed:
    - name: deb http://packages.linuxmint.com debian import
    - file: /etc/apt/sources.list.d/lmde.list
    - keyserver: pgp.mit.edu
    - order: 2
    - enabled: True
    - keyid: 0FF405B2
    - require:
      - cmd: linux-mint-key
    - require-in:
      - pkg: firefox
{% endif %}

linux-mint-key:
  cmd.run:
    - name: "apt-key adv --keyserver pgp.mit.edu --recv-keys 3EE67F3D0FF405B2"
    - unless: "apt-key list | grep 0FF405B2"
    - order: 1

include:
  - apt-sources

saltstack-ppa-key:
  cmd.run:
    - name: apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "B09E40B0F2AE6AB9"
    - unless: apt-key list | grep F2AE6AB9
    - order: 1

saltstack-ppa:
  pkgrepo.managed:
    # @TODO: This PPA should be more versatile
    {% if grains['os'] == 'Debian' %}
    - name: deb http://debian.saltstack.com/debian {{ grains['lsb_distrib_codename'] }}-saltstack main
    {% elif grains['os'] == 'Ubuntu' %}
    - name: ppa: saltstack/salt
    {% endif %}
    - keyserver: keyserver.ubuntu.com
    - order: 2
    - enabled: True
    - keyid: F2AE6AB9
    - require:
      - pkg: ppa-pkgs
      - cmd: saltstack-ppa-key
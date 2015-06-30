include:
  - apt-sources

saltstack-ppa-key:
  cmd.run:
    - name: apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "B09E40B0F2AE6AB9"
    - unless: apt-key list | grep F2AE6AB9
    - order: 1

saltstack-ppa:
  pkgrepo.managed:
    - name: deb http://debian.saltstack.com/debian stretch-saltstack main
    - keyserver: keyserver.ubuntu.com
    - order: 2
    - enabled: True
    - keyid: F2AE6AB9
    - require:
      - pkg: ppa-pkgs
      - cmd: saltstack-ppa-key
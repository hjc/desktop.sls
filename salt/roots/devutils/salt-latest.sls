include:
  - apt-sources/saltstack

saltstack-latest:
  pkg.latest:
    - pkgs:
      - salt-master
      - salt-minion
    - require:
      - pkgrepo: saltstack-ppa
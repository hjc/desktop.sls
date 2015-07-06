include:
  - apt-sources
  - apt-sources/webupd8

# who loves properitary licenses!?
accept-oracle-license:
  cmd.run:
    # debconf is used to track whether or not you've accepted the license, we just lie and say we have
    - name: "(echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections) && (echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections)"
    # in this scenario, we've already accepted the license, so don't pollute debconf!
    - unless: 'debconf-get-selections | grep -e "debconf\\s*shared/accepted-oracle-license-v1-1\\s*select\\s*true"'
    - require:
      - pkg: ppa-pkgs

oracle-java7-installer:
  pkg:
    - installed
    - require:
      - cmd: accept-oracle-license
      - pkgrepo: webupd8-java-ppa
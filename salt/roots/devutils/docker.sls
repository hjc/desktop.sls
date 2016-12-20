# @TODO: Move to a common state
apt-pkgs:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates

docker-apt:
  pkgrepo.managed:
    - humanname: docker
    - name: |
        deb https://apt.dockerproject.org/repo debian-{{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/docker.list
    - keyserver: hkp://p80.pool.sks-keyservers.net:80
    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
    - require_in:
      - pkg: docker-engine
    - require:
      - pkg: apt-pkgs

docker-engine:
  pkg.latest

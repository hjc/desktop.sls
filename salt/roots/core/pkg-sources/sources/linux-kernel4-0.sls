linux-kernel-4.0-ppa:
  pkgrepo.managed:
    {% if grains['os'] == 'Debian' %}
    - name: deb http://ppa.launchpad.net/kernel-ppa/ppa/ubuntu wily main
    {% elif grains['os'] == 'Ubuntu' %}
    - name: ppa:kernel-ppa/ppa
    {% endif %}
    - file: /etc/apt/sources.list.d/linux-kernel-4.0.list
    - keyserver: keyserver.ubuntu.com
    - enabled: True
    - keyid: 484B044F
    - require:
      - cmd: linux-kernel-4.0-ppa-key


linux-kernel-4.0-src-ppa:
  pkgrepo.managed:
    - name: deb-src http://ppa.launchpad.net/kernel-ppa/ppa/ubuntu wily main
    - file: /etc/apt/sources.list.d/linux-kernel-4.0.list
    - keyserver: keyserver.ubuntu.com
    - enabled: True
    - keyid: 484B044F
    - require:
      - cmd: linux-kernel-4.0-ppa-key

linux-kernel-4.0-ppa-key:
  cmd.run:
    - name: apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "484B044F"
    - unless: apt-key list | grep 484B044F

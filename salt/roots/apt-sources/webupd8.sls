include:
  - apt-sources

webupd8-ppa:
  pkgrepo.managed:
    # @TODO: Pick a better PPA for this.
    {% if grains['os'] == 'Debian' %}
    # Using PPA's on Debian is wonky, so we lie about it with ubuntu vivid
    - name: deb http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu vivid main
    {% else %}
    - ppa: webupd8team/sublime-text-3
    - keyserver: keyserver.ubuntu.com
    - order: 2
    - enabled: True
    - keyid: EEA14886
    {% endif %}
    - require:
      - pkg: ppa-pkgs
      - cmd: webupd8-key


webupd8-key:
  cmd.run:
    - name: "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886"
    - unless: "apt-key list | grep EEA14886"
    - order: 1
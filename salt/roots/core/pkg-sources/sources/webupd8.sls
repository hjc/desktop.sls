webupd8-sublime-ppa:
  pkgrepo.managed:
    # @TODO: Pick a better PPA for this.
    {% if grains['os'] == 'Debian' %}
    # Using PPA's on Debian is wonky, so we lie about it with ubuntu vivid
    - name: deb http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu vivid main
    - file: /etc/apt/sources.list.d/sublime.list
    {% else %}
    - ppa: webupd8team/sublime-text-3
    {% endif %}
    - keyserver: keyserver.ubuntu.com
    - order: 2
    - enabled: True
    - keyid: EEA14886
    - require:
      - pkg: ppa-pkgs
      - cmd: webupd8-key
    - require-in:
      - pkg: sublime-text


webupd8-java-ppa:
  pkgrepo.managed:
    # @TODO: Pick a better PPA for this.
    {% if grains['os'] == 'Debian' %}
    # Using PPA's on Debian is wonky, so we lie about it with ubuntu vivid
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main
    - file: /etc/apt/sources.list.d/oracle-java.list
    {% else %}
    - ppa: webupd8team/java
    {% endif %}
    - keyserver: keyserver.ubuntu.com
    - order: 2
    - enabled: True
    - keyid: EEA14886
    - require:
      - pkg: ppa-pkgs
      - cmd: webupd8-key

webupd8-key:
  cmd.run:
    - name: "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886"
    - unless: "apt-key list | grep EEA14886"
    - order: 1

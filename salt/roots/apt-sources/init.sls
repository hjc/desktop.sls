sources-dir:
  file.directory: 
    - name: /etc/apt/sources.list.d
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

google-chrome-source:
  file.managed:
    - name: /etc/apt/sources.list.d/google-chrome.list
    - source: salt://apt-sources/google-chrome.list
    - require:
      - file: sources-dir

ppa-pkgs:
  pkg.installed:
    - pkgs:
      - python-pycurl
      - python-apt
      - python-software-properties
      - software-properties-common

sublime-text-ppa:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/webupd8team/sublime-text-3/ubuntu vivid main
    # Using PPA's on Debian from within Salt is not supported, but this should
    # work fine in an Ubuntu system
    # - ppa: webupd8team/sublime-text-3
    # - keyserver: keyserver.ubuntu.com
    # - order: 2
    # - enabled: True
    # - keyid: EEA14886
    - require:
      - pkg: ppa-pkgs
      - cmd: webupd8-key


webupd8-key:
  cmd.run:
    - name: "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886"
    - unless: "apt-key list | grep EEA14886"
    - order: 1

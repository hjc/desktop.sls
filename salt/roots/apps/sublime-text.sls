include:
  - apps
  - apt-sources/webupd8

sublime-text:
  pkg.latest:
    - pkgs:
      - sublime-text-installer
    - require:
      - pkgrepo: webupd8-ppa

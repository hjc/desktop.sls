include:
  - apt-sources

google-chrome-source:
  pkgrepo.managed:
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - require:
      - pkg: ppa-pkgs
include:
  - apps/chrome
  - apt-sources

sublime-text:
  pkg.installed:
    - pkgs:
      - sublime-text-installer
    - require:
      - pkgrepo: sublime-text-ppa

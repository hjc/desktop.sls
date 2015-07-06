include:
  - apps

sublime-text:
  pkg.latest:
    - pkgs:
      - sublime-text-installer
    - require:
      - pkgrepo: sublime-text-ppa

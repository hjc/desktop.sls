include:
  - apps

sublime-text:
  pkg.installed:
    - pkgs:
      - sublime-text-installer
    - require:
      - pkgrepo: sublime-text-ppa

include: 
  - devutils/node

devpkgs:
  pkg.installed:
    - pkgs:
      - libcurl3
      - curl
      - {{ pillar['packages']['git'] }}

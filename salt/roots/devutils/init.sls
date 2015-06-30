include: 
  - devutils/node
  - devutils/salt-latest

devpkgs:
  pkg.installed:
    - pkgs:
      - libcurl3
      - curl
      - {{ pillar['packages']['git'] }}

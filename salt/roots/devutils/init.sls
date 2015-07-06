devpkgs:
  pkg.latest:
    - pkgs:
      - libcurl3
      - curl
      - {{ pillar['packages']['git'] }}

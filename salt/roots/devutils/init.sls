devpkgs:
  pkg.latest:
    - pkgs:
      - libcurl3
      - curl
      - bindfs
      - {{ pillar['packages']['git'] }}

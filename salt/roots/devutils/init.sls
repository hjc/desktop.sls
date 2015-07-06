devpkgs:
  pkg.latest:
    - pkgs:
      - libcurl3
      - curl
      - bindfs
      - gnupg-agent
      - {{ pillar['packages']['git'] }}
